--Создаем 2 таблицы
create table onboarding.T1
(
Serial_number int not null primary key,
Product varchar(255) not null
);

create table onboarding.T1_Audit
(
audit_lsn INT not null identity primary key,
dt datetime not null default(sysdatetime()),
login_name sysname not null default(original_login()),
Serial_number INT not null,
Product varchar(255) not null
);

--Создаем триггер
create TRIGGER trg_T1_insert_audit on onboarding.T1 after insert
as
insert into onboarding.T1_Audit(Serial_number, Product)
select Serial_number, Product
from inserted;
go

--Добавляем данные в таблицу onboarding.T1
insert into onboarding.T1 (Serial_number, Product)
values
	(001, 'Smartphone'),
	(002,'Telephone'),
	(003,'Pilesos'),
	(004,'Monitor'),
	(005,'Printer'),
	(006,'Holodilnic')

--Вызываем таблицу onboarding.T1_Audit. В ней будут данные автоматически занесенные триггером TRIGGER trg_T1_insert_audit
select audit_lsn, dt, login_name, Serial_number, Product
from onboarding.T1_Audit

--14 коммит
