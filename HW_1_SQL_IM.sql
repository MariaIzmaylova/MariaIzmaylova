--1) Создать таблицу employees и наполнить таблицу 70 строками

create table employess (
    id serial primary key,
    employee_name varchar(50) not null 
);

insert into employess (employee_name)
values ('John Smith'), ('Mary Johnson'),
       ('William Davis'), ('Emily Wilson'),
       ('Daniel Lee'), ('Jessica Brown'),
       ('David Garcia'), ('Olivia Miller'),
       ('Matthew Johnson'), ('Sophia Clark'),
       ('Michael Williams'), ('Emma Davis'),
       ('Christopher Perez'), ('Isabella Hernandez'),
       ('Joseph Taylor'), ('Ava Mitchell'),
       ('Kevin Martinez'), ('Mia Anderson'),
       ('Andrew Lopez'), ('Abigail Gonzalez'),
       ('Nicholas Baker'), ('Madison Parker'),
       ('Anthony Rodriguez'), ('Charlotte Davis'),
       ('Robert Perez'), ('Chloe Wilson'),
       ('Brian Adams'), ('Ella Thomas'),
       ('John Nguyen'), ('Natalie Lee'),
       ('Thomas Jackson'), ('Grace Turner'),
       ('David Hernandez'), ('Lily Parker'),
       ('Steven Wilson'), ('Avery Roberts'),
       ('Richard Martin'), ('Victoria Ramirez'),
       ('Charles Hall'), ('Hannah Wood'),
       ('Timothy Taylor'), ('Aaliyah Clark'),
       ('Paul Thompson'), ('Addison Scott'),
       ('Mark Allen'), ('Audrey Hill'),
       ('James Wright'), ('Evelyn Garcia'),
       ('Benjamin Walker'), ('Aria Adams'),
       ('George Young'), ('Lillian Mitchell'),
       ('Frank Baker'), ('Brooklyn Phillips'),
       ('Henry Wright'), ('Elizabeth Hernandez'),
       ('Jackson Davis'), ('Sofia Turner'),
       ('Peter Evans'), ('Leah Anderson'),
       ('Lucas Martinez'), ('Stella White'),
       ('Scott Green'), ('Katherine Lewis'),
       ('Erica Wilson'), ('Samuel King'),
       ('Aaliyah Ramirez'), ('Zachary Hill'),
       ('Bella Flores'), ('Jared Scott');

      
--2) Создать таблицу salary и наполнить таблицу salary 15 строками

drop table salary cascade;
create table salary (
    id serial primary key,
    monthly_salary int not null
);

insert into salary (monthly_salary)
values (1000), (1100), (1200),
       (1300), (1400), (1500),
       (1600), (1700), (1800),
       (1900), (2000), (2100),
       (2200), (2300), (2400);
      
--3) Создать таблицу employee_salary и наполнить таблицу employee_salary 40 строками
      
create table employee_salary (id serial primary key, 
				employee_id int not null unique,
				salary_id int not null);

insert into employee_salary (employee_id, salary_id)
values (1, 1), (3, 1), (2, 2), (4, 1),
       (5, 3), (6, 4), (8, 3), (7, 2),
       (10, 4), (9, 5), (13, 6), (12, 5),
       (11, 4), (15, 6), (14, 5), (18, 7),
       (16, 9), (17, 10), (22, 10), (21, 9),
       (23, 8), (24, 7), (25, 3), (26, 11),
       (27, 12), (28,13), (29, 14), (30, 15),
       (31,15), (32,15), (71, 5), (72, 4),
       (73, 4), (74, 8), (75, 8), (76, 3),
       (77, 4), (78, 8), (79, 10), (80, 11);
      
--4) Создать таблицу roles, поменять тип столба role_name с int на varchar(30), наполнить таблицу roles 20 строками      


create table roles (
    id serial primary key,
    role_name int not null unique
);

alter table roles alter column role_name type varchar(30);

insert into roles (role_name)
values ('Junior Python developer'), ('Middle Python developer'), ('Senior Python developer'),
       ('Junior Java developer'), ('Middle Java developer'), ('Senior Java developer'),
       ('Junior JavaScript developer'), ('Middle JavaScript developer'), ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'), ('Middle Manual QA engineer'), ('Senior Manual QA engineer'),
       ('Project Manager'), ('Designer'), ('HR'), ('CEO'), ('Sales manager'), ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'), ('Senior Automation QA engineer');
      
      
--5) Создать таблицу roles_employee, наполнить таблицу roles_employee 40 строками
      
create table roles_employee (
    id serial primary key,
    employee_id int not null unique references employess(id),
    role_id int not null references roles(id)
);

insert into roles_employee (employee_id, role_id) 
			values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
					(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
					(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
					(16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
					(21, 1), (22, 2), (23, 3), (24, 4), (25, 5),
					(26, 6), (27, 7), (28, 8), (29, 9), (30, 10),
					(31, 11), (32, 12), (33, 13), (34, 14), (35, 15),
					(36, 16), (37, 17), (38, 18), (39, 19), (40, 20);
				

select * from employess;				
select * from salary;				
select * from employee_salary;				
select * from roles;
select * from roles_employee;

