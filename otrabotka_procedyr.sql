--создаю хранимую процедуру которая выводит из таблицы с магазинами адреса которых которых совпадают с вводной переменной @AddresName
create proc onboarding.shop_address
	@AddresName as varchar(255),
	@numrows as int output
as

select shopName, ShopAddress, Revenue
from onboarding.Shop
where ShopAddress like CONCAT(@AddresName, '%')

SET @numrows = @@rowcount
go

--Вывод магазинов в городе алатырь
declare @rc as int;
EXEC onboarding.shop_address
@AddresName = 'Алатырь',
@numrows = @rc OUTPUT;
SELECT @rc AS numrows;
