DELIMITER $$

CREATE PROCEDURE calc_profit()
BEGIN
    -- Переменные для выборки 
    DECLARE v_fname VARCHAR(20);
    DECLARE v_lname VARCHAR(40);
    DECLARE v_phone CHAR(12);
    DECLARE v_title VARCHAR(80);
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_advance DECIMAL(10,2);
    DECLARE v_sales INT;

    DECLARE done INT DEFAULT 0; -- Флаг конца курсора
    DECLARE total_profit DECIMAL(15,2) DEFAULT 0; -- Переменная дла подсчета итога

    -- Курсов для выборки данных
    DECLARE curs CURSOR FOR
        SELECT a.au_fname, a.au_lname, a.phone,
               t.title, t.price, t.advance, t.ytd_sales
        FROM titleauthor ta
        JOIN authors a ON ta.au_id = a.au_id
        JOIN titles t ON ta.title_id = t.title_id
        WHERE a.state <> 'CA';

    -- Обработчик конца курсора
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Открытие курсора
    OPEN curs;

    -- Цикл выборки курсора
    read_loop: LOOP
        FETCH curs INTO
            v_fname, v_lname, v_phone,
            v_title, v_price, v_advance, v_sales;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Подсчет итога
        SET total_profit = total_profit + (v_price * v_sales - v_advance);
    END LOOP;

    -- Закрытие курсора
    CLOSE curs;

    -- Результат
    SELECT 'Итого прибыли:' AS Info, total_profit AS Profit;
END$$

DELIMITER ;

-- Вызов процедуры 
CALL calc_profit();