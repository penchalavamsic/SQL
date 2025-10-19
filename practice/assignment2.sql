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
    
	