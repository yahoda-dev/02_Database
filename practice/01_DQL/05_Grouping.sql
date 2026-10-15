/* Q1)
전체 직원 수와 전 직원 급여의 합계를 조회하시오.
(힌트: COUNT, SUM)
*/

SELECT COUNT(*) AS 직원수, SUM(salary) AS 급여합계
FROM tbl_employee
;


/* Q2)
부서코드별로 부서코드, 급여 합계, 평균 급여(소수점 이하 버림), 직원 수를 조회하시오.
부서가 배정되지 않은 직원도 하나의 그룹으로 포함하고,
부서코드를 기준으로 오름차순 정렬하시오.
(힌트: GROUP BY, SUM, AVG, FLOOR, COUNT)
*/

SELECT dept_code          AS 부서코드,
       SUM(salary)        AS 급여합계,
       FLOOR(AVG(salary)) AS 평균급여,
       COUNT(*)           AS 직원수
FROM tbl_employee
WHERE dept_code IS NOT NULL
GROUP BY dept_code
;


/* Q3)
보너스를 받는 직원만 대상으로 직급코드별 직원 수를 조회하시오.
직급코드를 기준으로 오름차순 정렬하시오.
(힌트: WHERE, GROUP BY, COUNT)
*/

SELECT job_code AS 직급코드,
       COUNT(*) AS 직원수
FROM tbl_employee
WHERE bonus IS NOT NULL
GROUP BY job_code
ORDER BY job_code
;


/* Q4)
부서별 평균 급여가 300만원 이상인 부서의 부서명, 직원 수,
평균 급여(소수점 이하 버림)를 조회하시오.
평균 급여를 기준으로 내림차순 정렬하시오.
(힌트: JOIN, GROUP BY, HAVING)
*/

SELECT b.dept_title,
       COUNT(*)           AS 직원수,
       FLOOR(AVG(salary)) AS 평균급여
FROM tbl_employee a
         JOIN tbl_department b
              ON a.dept_code = b.dept_id
GROUP BY dept_code
HAVING AVG(salary) >= 3000000
ORDER BY 평균급여 DESC
;


/* Q5)
직급별 직급명, 직원 수, 급여 합계를 조회하고 마지막 행에 전체 직원 수와
전체 급여 합계가 표시되도록 하시오.

*/

SELECT b.job_name    AS 직급명,
       COUNT(*)      AS 직원수,
       SUM(a.salary) AS 급여합계
FROM tbl_employee a
         JOIN tbl_job b
              ON a.job_code = b.job_code
GROUP BY b.job_name
WITH ROLLUP
;