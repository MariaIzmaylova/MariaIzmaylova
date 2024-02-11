select * from employess;				
select * from salary;				
select * from employee_salary;				
select * from roles;
select * from roles_employee;


-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами

select employee_name, monthly_salary
from employess e
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id;

--2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary
from employess e
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_id, employee_name, monthly_salary
from employee_salary es 
left join employess e on e.id = es.employee_id
join salary s on s.id = es.salary_id
where employee_name is NULL;

--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_id, employee_name, monthly_salary
from employee_salary es 
left join employess e on e.id = es.employee_id
join salary s on s.id = es.salary_id
where employee_name is null and monthly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП

select employee_name, salary_id
from employess e
left join employee_salary es on e.id = es.employee_id
where salary_id is null;

--6. Вывести всех работников с названиями их должности

select e.employee_name , r.role_name
from employess e 
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id;

--7. Вывести имена и должность только Java разработчиков

select e.employee_name , r.role_name
from employess e 
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id
where role_name like '%Java developer%';

--8. Вывести имена и должность только Python разработчиков

select employee_name, role_name
from employess e 
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров

select employee_name, role_name
from employess e 
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров

select employee_name, role_name
from employess e 
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id
where role_name like '%Manual QA%';

--11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name
from employess e
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id
where role_name like '%Automation%';

--12. Вывести имена и зарплаты Junior специалистов

select employee_name, role_name, monthly_salary
from employess e
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id
where role_name like '%Junior%';

--13. Вывести имена и зарплаты Middle специалистов

select employee_name, role_name, monthly_salary
from employess e
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id
where role_name like '%Middle%';

--14. Вывести имена и зарплаты Senior специалистов

select employee_name, role_name, monthly_salary
from employess e
join roles_employee re on e.id = re.employee_id
join roles r on r.id = re.role_id
join employee_salary es on e.id = es.employee_id
join salary s on s.id = es.salary_id
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков

select role_name, monthly_salary
from roles r
join roles_employee re on r.id = re.employee_id 
join employee_salary es on re.employee_id = es.employee_id
join salary s on s.id = es.salary_id
where role_name like '%Java developer%';

--16. Вывести зарплаты Python разработчиков

select role_name, monthly_salary
from roles r
join roles_employee re on r.id = re.employee_id 
join employee_salary es on re.employee_id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%Python%';

--17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name, role_name, monthly_salary
from employess e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id  = r.id 
join employee_salary es on r.id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%Junior Python%';

--18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name, role_name, monthly_salary
from employess e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id  = r.id 
join employee_salary es on r.id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%Middle JavaScript%';

--19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name, role_name, monthly_salary
from employess e 
join roles_employee re on e.id = re.employee_id
join roles r on re.role_id  = r.id 
join employee_salary es on r.id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%Senior Java developer%';

--20. Вывести зарплаты Junior QA инженеров

select role_name, monthly_salary
from roles r 
join roles_employee re on r.id = re.role_id  
join employee_salary es on re.employee_id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%Junior%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) as averege_salary_jun
from roles r 
join roles_employee re on r.id = re.role_id 
join employee_salary es on re.employee_id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%Junior%'

--22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) as sum_of_salary_JS
from roles r 
join roles_employee re on r.id = re.role_id 
join employee_salary es on re.employee_id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%JavaScript developer%';

--23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) as sum_of_salary_JS
from roles r 
join roles_employee re on r.id = re.role_id 
join employee_salary es on re.employee_id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) as sum_of_salary_JS
from roles r 
join roles_employee re on r.id = re.role_id 
join employee_salary es on re.employee_id = es.employee_id 
join salary s on es.salary_id = s.id
where role_name like '%QA%';

--25. Вывести количество QA инженеров
select count(*) as number_of_qa
from roles r 
join roles_employee re on r.id = re.role_id 
join employess e on re.employee_id  = e.id 
where role_name like '%QA%';

--26. Вывести количество Middle специалистов

select count(*) as number_of_qa
from roles r 
join roles_employee re on r.id = re.role_id 
join employess e on re.employee_id  = e.id 
where role_name like '%Middle%';

--27. Вывести количество разработчиков

select count(*) as number_of_qa
from roles r 
join roles_employee re on r.id = re.role_id 
join employess e on re.employee_id  = e.id 
where role_name like '%developer%';

--28. Вывести фонд (сумму) зарплаты разработчиков
select sum(monthly_salary) as summ_of_developers
from roles r 
join roles_employee re on r.id = re.role_id 
join employee_salary es on re.employee_id = es.employee_id 
join salary s on es.salary_id = s.id 
where role_name like '%developer%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name, role_name, monthly_salary
from employess e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary
from employess e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where monthly_salary between 1700 and 2300
order by monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary
from employess e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where monthly_salary < 2300
order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary
from employess e 
join roles_employee re on e.id = re.employee_id 
join roles r on re.role_id = r.id 
join employee_salary es on e.id = es.employee_id 
join salary s on es.salary_id = s.id 
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;
