show databases;
use assg2;
select ename, hiredate, sal, date_add(hiredate, interval 1 year) as salary_review from emp;