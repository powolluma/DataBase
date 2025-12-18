USE powolluma;  -- база данных

DROP PROCEDURE IF EXISTS GetRentsByClient;  

DELIMITER $$  -- меняем разделитель

CREATE PROCEDURE GetRentsByClient(IN clientID INT)
BEGIN
    SELECT * 
    FROM `аренды`
    WHERE `id_Клиент` = clientID;
END$$

DELIMITER ;  -- возвращаем стандартный разделитель

-- Вызов процедуры
CALL GetRentsByClient(1);
