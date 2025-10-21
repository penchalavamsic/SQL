show databases;
use assg2;
select ename, hiredate, sal, date_add(hiredate, interval 1 year) as salary_review from emp;
select ename as Employee,
	case 
		when sal >1500 then sal
        when sal=1500 then 'on target'
        else 'below 1500'
	end as salary
from emp;
select e.ename , e.sal , m.min_sal as minimum_salary from emp e join(select min(sal)as min_sal from emp)m;

select e.ename, e.sal, m.min_sal, m.max_sal, m.avg_sal from emp e join (select min(sal) as min_sal, max(sal) as max_sal, round(avg(sal), 2) as avg_sal from emp)m;
select job, (select min(sal) from emp e2 where e2.job=e1.job) as min_sal, (select max(sal) from emp e2 where e2.job=e1.job) as max_sal from emp e1 group by job;
select job, (select avg(sal) from emp e2 where e2.job=e1.job) as avg_sal, (select sum(sal*12) from emp e2 where e2.job=e1.job) as total_rem from emp e1 group by job;
select job , max(sal) - min(sal) as difference from emp group by job;
select job, count(*)as emp_count from emp group by job having count(*)>3 ;
select empno, count(*) as cnt from emp group by empno having count(*)>1;