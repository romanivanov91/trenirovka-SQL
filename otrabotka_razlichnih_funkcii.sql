--Здесь отрабатываю различные функции на таблице с магазинами
-- format - преобразовываем формат даты в различные значения. https://learn.microsoft.com/ru-ru/dotnet/standard/base-types/standard-numeric-format-strings - это сайт расшифровкой буквенного формата
select format(Date, 'd', 'en-US' ) 'US English',
		format(Date, 'd', 'en-gb' ) 'Great Britain English',
		format(Date, 'd', 'de-de' ) 'German',
		format(Date, 'd', 'zh-cn' ) 'Chinese Simplified (PRC)'
from onboarding.Shop

select format(onboarding.Shop.Date, 'D', 'en-US' ) 'US English',
		format(onboarding.Shop.Date, 'D', 'en-gb' ) 'Great Britain English',
		format(onboarding.Shop.Date, 'D', 'de-de' ) 'German',
		format(onboarding.Shop.Date, 'D', 'zh-cn' ) 'Chinese Simplified (PRC)'
from onboarding.Shop

-- format преобразуем выручку в число с 4 цифрами после запятой
select format(Revenue, 'F4', 'En-US')
from onboarding.Shop

-- like - возвращаем те магазины которые находятся в Чебоксарах
select ShopName
from onboarding.Shop
where ShopAddress like 'Чебоксары%'

-- Функции YEAR, MONTH и DAY - извлекаем из даты год, месяц, день
select day(Date) as d, month(Date) as m, YEAR(Date) as y
from onboarding.Shop

--Создаю пользовательскую функцию
create function onboarding.RevenueMax (@Revenue_value as money, @threshold_value as money)
returns bit
as
	begin
			declare @bul bit
			if @Revenue_value >= @threshold_value
				set @bul = 1
			else
				set @bul = 0
		return @bul
	end

--Применяю функцию на таблице с магазинами для вывода магазинов с дневной выручкой выше 150000
select ShopName, Revenue
from onboarding.Shop
where onboarding.RevenueMax(Revenue, 150000)
