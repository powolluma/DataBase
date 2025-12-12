-- Подключение базы данных
USE mydb;

-- Таблица с студентами
INSERT INTO Student (Surname, Name, Address, Tel) VALUES
('Иванов', 'Иван', 'Ленина 10', '79223334455'),
('Петров', 'Петр', 'Пушкина 78', '79334445566'),
('Сидоров', 'Сергей', 'Гагарина 5', NULL),
('Абрамов', 'Алексей', 'Ленинградская 12', '79227778899'),
('Авдеев', 'Андрей', 'Садовая 3', '74561237890'),
('Борисов', 'Борис', 'Лесная 15', '72345678901');

-- Таблица с оценками
INSERT INTO Matks (Subject, Date_mark, Mark, Student_id_Student1) VALUES
('Математика', '2025-03-10', 5, 1),
('Математика', '2025-03-10', 2, 2),
('Математика', '2025-03-10', 3, 3),
('Математика', '2025-03-10', 4, 4),
('Физика', '2025-03-12', 4, 1),
('Информатика', '2025-03-11', 5, 4),
('Математика', '2025-03-12', 5, 5);

-- 1. Вывести всю информацию из таблицы Student
SELECT * FROM Student;

-- 2. Вывести пары Surname – tel из таблицы Student
SELECT Surname, Tel FROM Student;

-- 3. Выведите список студентов, у которых отсутствует в данных номер телефона
SELECT * FROM Student WHERE Tel IS NULL OR Tel = '';

-- 4. Вывеститройки Surname – Subject — Mark
SELECT s.Surname, m.Subject, m.Mark
FROM Student s
JOIN Matks m ON s.id_Student = m.Student_id_Student1;

-- 5. Вывести список студентов, у которых по предмету ―Математика‖ оценка 2
SELECT s.Surname, s.Name
FROM Student s
JOIN Matks m ON s.id_Student = m.Student_id_Student1
WHERE m.Subject = 'Математика' AND m.Mark = 2;

-- 6. Вывести фамилию и первую букву от имени через пробел, тех студентов, фамилии которых начинаются на «а» и содержат не менее одной буквы «в»
SELECT CONCAT(Surname, ' ', LEFT(Name, 1), '.') AS 'Фамилия и инициал'
FROM Student
WHERE Surname LIKE 'А%' AND Surname LIKE '%в%';

-- 7. Вывести фамилии студентов и номера телефонов, чьи телефоны содержат только цифры от 2-5 и 7
SELECT Surname, Tel
FROM Student
WHERE Tel REGEXP '^[2-57]+$';

-- 8. Выведите список фамилий студентов, проживающих в д.78
SELECT Surname
FROM Student
WHERE Address LIKE '%78%';

-- 9. Выведите всю информацию о студентах, чьи фамилии Иванов, Петров, Сидоров
SELECT *
FROM Student
WHERE Surname IN ('Иванов', 'Петров', 'Сидоров');

-- 10. Выведите фамилии студентов по алфавиту от «Иванова» до «Сидорова»
SELECT Surname
FROM Student
WHERE Surname BETWEEN 'Иванов' AND 'Сидоров'
ORDER BY Surname;

-- 11. Выведите фамилии студентов, у которых есть хотя бы одна оценка по Математике >=3 (без повторений)
SELECT DISTINCT s.Surname
FROM Student s
JOIN Matks m ON s.id_Student = m.Student_id_Student1
WHERE m.Subject = 'Математика' AND m.Mark >= 3;

-- 12. Переведите каждую оценку в сто бальную систему*. Выведите два столбца: оценка по пяти бальной системе,оценка по сто бальной системе (без повторений).
SELECT DISTINCT Mark AS 'Оценка (5 баллов)',
       CASE Mark
           WHEN 2 THEN 40
           WHEN 3 THEN 60
           WHEN 4 THEN 80
           WHEN 5 THEN 100
       END AS 'Оценка (100 баллов)'
FROM Matks
ORDER BY Mark;
