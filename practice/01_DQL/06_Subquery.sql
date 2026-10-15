/* Q1)
사원명이 '노옹철'인 직원과 같은 부서에 속한 직원의 사원명과 부서코드를 조회하시오.
(힌트: WHERE절의 서브쿼리)
*/

SELECT a.emp_name  AS 사원명,
       a.dept_code AS 부서코드
FROM tbl_employee a
WHERE a.dept_code = (SELECT b.dept_code
                     FROM tbl_employee b
                     WHERE b.emp_name = '노옹철');

/* Q2)
전 직원의 평균 급여보다 많은 급여를 받는 직원의 사번, 사원명, 직급코드,
급여를 조회하고 급여를 기준으로 내림차순 정렬하시오.
(힌트: AVG를 사용한 서브쿼리)
*/

SELECT emp_id   AS 사번,
       emp_name AS 사원명,
       job_code AS 직급코드,
       salary   AS 급여
FROM tbl_employee
WHERE salary > (SELECT AVG(salary)
                FROM tbl_employee)
ORDER BY salary DESC;

/* Q3)
부서별 급여 합계를 먼저 구한 뒤, 급여 합계가 가장 큰 부서의 부서명과
급여 합계를 조회하시오.
(힌트: FROM절 서브쿼리, GROUP BY, JOIN, ORDER BY, LIMIT)
*/

SELECT c.dept_title                         AS 부서명,
       CONCAT(FORMAT(a.sum_salary, 0), '원') AS 총급여
FROM (SELECT b.dept_code,
             SUM(b.salary) AS sum_salary
      FROM tbl_employee b
      GROUP BY dept_code) AS a
         JOIN tbl_department c
              ON a.dept_code = c.dept_id
ORDER BY a.sum_salary DESC
LIMIT 1;

/* Q4)
부서가 배정된 직원 중 각 부서의 최고 급여를 받는 직원의 사원명, 직급명,
부서명, 급여를 조회하시오. 최고 급여가 같은 직원은 모두 조회하시오.
(힌트: 상관 서브쿼리, MAX, JOIN)
*/

SELECT tb.emp_name   AS 사원명,
       jb.job_name   AS 직급명,
       dp.dept_title AS 부서명,
       tb.salary     AS 급여
FROM tbl_employee tb
         JOIN tbl_job jb
              ON tb.job_code = jb.job_code
         JOIN tbl_department dp
              ON tb.dept_code = dp.dept_id
WHERE tb.dept_code IS NOT NULL
  AND tb.salary = (SELECT MAX(b.salary)
                   FROM tbl_employee b
                   WHERE b.dept_code = tb.dept_code);

/* Q5)
보너스를 받는 직원의 부서코드를 CTE로 먼저 정의하시오.
그 CTE와 EXISTS를 사용하여 보너스를 받는 직원이 한 명 이상 있는 부서의
부서코드와 부서명을 조회하고, 부서코드를 기준으로 오름차순 정렬하시오.
(힌트: WITH, EXISTS)
*/

-- 1. 보너스를 받는 직원의 부서코드를 CTE로 정의
WITH bonus_dept_cte AS (SELECT dept_code
                        FROM tbl_employee
                        WHERE bonus IS NOT NULL)
-- 2. 부서 테이블을 기준으로 조회하되, CTE에 존재하는 부서만 필터링
SELECT d.dept_id    AS 부서코드,
       d.dept_title AS 부서명
FROM tbl_department d
WHERE EXISTS (SELECT 1
              FROM bonus_dept_cte c
              WHERE c.dept_code = d.dept_id -- 메인 쿼리의 부서코드와 CTE의 부서코드 연결
)
ORDER BY 부서코드 ASC;
