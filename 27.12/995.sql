-- Калькулятор
CALL CalculatorProc(4,5,'+', @result);
SELECT @result AS CalculatorResult;

-- Выборка авторов из таблицы
CALL DYNTABProc('CA');

-- Разбиение строки
CALL ParseStringProc('SQL Server 2000');
