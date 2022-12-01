--Создаю таблицу с магазинами
create table onboarding.Shop (ID int not null identity(1, 1))
	alter table onboarding.Shop add constraint PK_onboarding_Statements primary key clustered (ID)
	alter table onboarding.Shop add ShopName varchar(255) not null
	alter table onboarding.Shop add ShopAddress varchar(255) null
	alter table onboarding.Shop add constraint UNIQUE_Address unique (ShopAddress)
	alter table onboarding.Shop add Date date not null
	alter table onboarding.Shop add Work date null
	alter table onboarding.Shop add Revenue money null
	alter table onboarding.Shop add constraint CHECK_Revenue check (Revenue > 50000)

--Создаю таблицу с графиком работы магазинов
create table onboarding.Shop_work_schedule (ID int not null identity(1, 1))
	alter table onboarding.Shop_work_schedule add constraint PK_onboarding_Statements primary key clustered (ID)
	alter table onboarding.Shop_work_schedule add ID_Shop int not null
	alter table onboarding.Shop_work_schedule add constraint FK_Shop_work_schedule_ID_Shop foreign key (ID_Shop) references onboarding.Shop(ID)
	alter table onboarding.Shop_work_schedule add ShopName varchar(255) not null
	alter table onboarding.Shop_work_schedule add Work_schedule varchar(255) not null

--Заполняем таблицу с магазинами
insert into onboarding.Shop (ShopName, ShopAddress, Date, Work, Revenue)
values
	('Пятерочка', 'Чебоксары', '2022.11.20', 1, 150000),
	('Магнит', 'НовоЧебоксарск', '2022.11.20', 1, 200000),
	('Фасоль', 'Цивильск', '2022.11.20', 1, 300000),
	('Spar', 'Канаш', '2022.11.20', 1, 180000),
	('Авокадо', 'Алатырь', '2022.11.20', 1, 110000),
	('Пятерочка', 'Чебоксары1', '2022.11.21', 1, 150000),
	('Магнит', 'НовоЧебоксарск1', '2022.11.21', 1, 200000),
	('Фасоль', 'Цивильск1', '2022.11.21', 1, 300000),
	('Spar', 'Канаш1', '2022.11.21', 1, 180000),
	('Авокадо', 'Алатырь1', '2022.11.21', 1, 110000),
	('Пятерочка', 'Чебоксары2', '2022.11.22', 1, 150000),
	('Магнит', 'НовоЧебоксарск2', '2022.11.22', 1, 200000),
	('Фасоль', 'Цивильск2', '2022.11.22', 1, 300000),
	('Spar', 'Канаш2', '2022.11.22', 1, 180000),
	('Авокадо', 'Алатырь2', '2022.11.22', 1, 110000),
	('Пятерочка', 'Чебоксары3', '2022.11.20', 1, 150000),
	('Магнит', 'НовоЧебоксарск3', '2022.11.20', 1, 200000),
	('Фасоль', 'Цивильск3', '2022.11.20', 1, 300000),
	('Spar', 'Канаш3', '2022.11.23', 1, 180000),
	('Авокадо', 'Алатырь3', '2022.11.23', 1, 110000)


--Испытывал два одинаковых значения для проверки UNIQUE. Результат: работает. Также два NULL значения unique не принимает
select ID, ShopName, ShopAddress, Date, Work, Revenue
from onboarding.shop

update onboarding.Shop set ShopAddress = 'Чебоксары' where ID = 50
update onboarding.Shop set ShopAddress = 'Чебоксары' where ID = 55

select ID, ShopName, ShopAddress, Date, Work, Revenue
from onboarding.shop

--Заполняем таблицу с графиком работы магазинов
insert into onboarding.Shop_work_schedule (ID_Shop, ShopName, Work_schedule)
values
	('50', 'Пятерочка', 'с 8:00 до 22:00'),
	('51','Магнит', 'с 8:30 до 21:30'),
	('52','Фасоль', 'с 9:00 до 23:00'),
	('53','Spar', 'с 8:15 до 22:15'),
	('54','Авокадо', 'с 8:45 до 22:45'),
	('55','Пятерочка', 'с 8:00 до 22:00'),
	('56','Магнит', 'с 8:30 до 21:30'),
	('57','Фасоль', 'с 9:00 до 23:00'),
	('58','Spar', 'с 8:15 до 22:15'),
	('59','Авокадо', 'с 8:45 до 22:45'),
	('60','Пятерочка', 'с 8:00 до 22:00'),
	('61','Магнит', 'с 8:30 до 21:30'),
	('62','Фасоль', 'с 9:00 до 23:00'),
	('63','Spar', 'с 8:15 до 22:15'),
	('64','Авокадо', 'с 8:45 до 22:45'),
	('65','Пятерочка', 'с 8:00 до 22:00'),
	('66','Магнит', 'с 8:30 до 21:30'),
	('67','Фасоль', 'с 9:00 до 23:00'),
	('68','Spar', 'с 8:15 до 22:15'),
	('69','Авокадо', 'с 8:45 до 22:45')

--Испытывал удаление в onboarding.Shop строки с ID = 50 для проверки даст ли база данных его удалить при условии что на него ссылается внешний ключ из таблицы onboarding.Shop_work_schedule. Результат: при таком условии база не разрешает удалить строку
delete from onboarding.Shop where ID = 50
