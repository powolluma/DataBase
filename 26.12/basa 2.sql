-- Использование Диаграммы построенной
USE realestatedb;

-- Вывод всех таблиц
SHOW TABLES;

-- Вывод структур таблиц
DESCRIBE `цены аренды`;

-- Вывод проверки первичных ключей
ALTER TABLE `цены аренды`
ADD CONSTRAINT PK_цены PRIMARY KEY (id_цены);

-- Вывод проверки внешних ключей
SELECT
  TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'realestatedb'
  AND REFERENCED_TABLE_NAME IS NOT NULL;

-- Заполнение клиентов
INSERT INTO клиент (id_клиента, ФИО, Телефон)
VALUES
(1, 'Иванов И.И.', '111'),
(2, 'Петров П.П.', '222'),
(3, 'Сидоров С.С.', '333'),
(4, 'Кузнецов К.К.', '444'),
(5, 'Морозов М.М.', '555');

-- Заполнение Отдела агентов
INSERT INTO `отделы агентов` (Номер_Отдела, Отдел)
VALUES
('01', 'Отдел Агентов ТОП'),
('02', 'Крутой отдел агентов'),
('03', 'Туро-отдел Агентов'),
('04', 'Отдел Продаж'),
('05', 'Маркетинговый отдел');

-- Заполнение договоров
INSERT INTO договор (id_договора, id_клиента, id_агента, Дата_заключения)
VALUES
(1, 1, 1, '2025-01-10'),
(2, 2, 2, '2025-02-15'),
(3, 3, 3, '2025-03-20'),
(4, 4, 4, '2025-04-25'),
(5, 5, 5, '2025-05-30');

-- Заполнение Цены аренды
INSERT INTO `цены аренды` (id_цены, id_агента, Цена, Срок_сдачи_аренды)
VALUES
(1, 1, 30000, DATE_ADD(CURDATE(), INTERVAL 1 MONTH)),
(2, 2, 50000, DATE_ADD(CURDATE(), INTERVAL 2 MONTH)),
(3, 3, 120000, DATE_ADD(CURDATE(), INTERVAL 3 MONTH)),
(4, 4, 40000, DATE_ADD(CURDATE(), INTERVAL 1 MONTH)),
(5, 5, 80000, DATE_ADD(CURDATE(), INTERVAL 2 MONTH));

-- Вывод таблиц
SHOW TABLES;
DESCRIBE агенты;
DESCRIBE договор;
DESCRIBE клиент;
DESCRIBE `отделы агентов`;
DESCRIBE `цены аренды`;

