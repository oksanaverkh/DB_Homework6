CREATE DATABASE homework6;

USE homework6;

-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DELIMITER //
CREATE FUNCTION sec_trans(n INT)
RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
DECLARE count INT DEFAULT 0;
DECLARE sec INT DEFAULT 0;
DECLARE min INT DEFAULT 0;
DECLARE hours INT DEFAULT 0;
DECLARE days INT DEFAULT 0;
WHILE count < 3 DO
    IF (count = 0) THEN
        SET sec = n%60;
        SET n = FLOOR(n/60);
        SET count=count+1;
    ELSEIF (count = 1) THEN
        SET min = n%60;
        SET n = FLOOR(n/60);
        SET count=count+1;
    ELSEIF (count = 2) THEN
        SET hours = n%24;
		SET days = FLOOR(n/24);
        SET count=count+1;
	END IF;
END WHILE;
RETURN CONCAT(days, ' days', hours, ' hours', min, ' min', sec, ' sec');
END //
DELIMITER ;

SELECT sec_trans(123456);

-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10
DELIMITER //
CREATE FUNCTION is_even(num INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
DECLARE n INT DEFAULT 1;
DECLARE res VARCHAR(100) DEFAULT ' ';
WHILE n <= num DO
    IF (n%2 = 0) THEN
        SET res = CONCAT(res, n, ' ');
	END IF;
    SET n = n + 1;
END WHILE;
RETURN res;
END //
DELIMITER ;

SELECT is_even(20);



