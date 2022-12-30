--SELECT щось FROM звідкись

SELECT id, first_name, last_name FROM users;

---- Результатом роботи команди SELECT ЗАВЖДИ є таблиця

SELECT first_name, last_name FROM users;

SELECT * FROM users
WHERE id = 2000;

SELECT * FROM users
WHERE gender = 'male';

SELECT * FROM users
WHERE gender = 'male' AND is_subscribe;

/*
1. Отримати всіх юзерів, в яких id парний

2. Отримати всіх юзерів жіночого роду, які не підписані на наші новини.


*/

SELECT * FROM users
WHERE id % 2 = 0;

SELECT * FROM users
WHERE gender = 'female' AND is_subscribe = false;


---- масив мейлів всіх підписаних юзерів

SELECT email FROM users
WHERE is_subscribe;


-----------------

SELECT * FROM users
WHERE first_name = 'William';

SELECT * FROM users
WHERE first_name IN ('John', 'William', 'Clark');


/* 

Знайти всіх користувачів, в яких id 1, 10, 100, 1000
*/

SELECT * FROM users
WHERE id IN (1, 10, 100, 1000);


--- Знайти всіх, в кого id між 1800 і 2000

SELECT * FROM users
WHERE id > 1800 AND id < 2000;


SELECT * FROM users
WHERE id BETWEEN 1800 AND 2000;



--------------


SELECT * FROM users
WHERE first_name LIKE 'K%';


--- % - будь-яка кількість будь-яких літер
--- _ - 1 будь-який символ


---- ім'я з 5 літер


SELECT * FROM users
WHERE first_name LIKE '_____';


-- знайти користувачів, ім'я яких закінчується на літеру "а"
SELECT * FROM users
WHERE first_name LIKE '%a';


UPDATE users
SET weight = 60
WHERE id BETWEEN 1900 AND 1950;


-----встановити вагу 70 кг для всіх, в кого id ділиться на 5

UPDATE users
SET weight = 70
WHERE id % 5 = 0;

DELETE FROM users
WHERE id = 1
RETURNING *;



---------------------


SELECT * FROM users
WHERE birthday < '2004-01-01';


SELECT first_name, extract("years" from age(birthday)) FROM users;

SELECT * FROM users
WHERE extract("years" from age(birthday)) > 25;


/*
Вивести мейли всіх юзерів чоловічого роду, яким більше 18 і менше 60 років.

*/


SELECT email FROM users
WHERE gender = 'male' AND
(extract("years" from age(birthday)) BETWEEN 18 AND 60);


/*
1. Отримати всіх користувачів, які народились у жовтні

2. Отримати мейли всіх користувачів, які народились 1 листопада

3. Всім користувачам, яким більше ніж 60 років, встановити зріст 2 метри.

4. Всім користувачам чоловічого роду віком від 30 до 50 встановити вагу 80кг.

*/


----1
SELECT * FROM users
WHERE extract('month' from birthday) = 10;


---2
SELECT email FROM users
WHERE extract('day' from birthday) = 1 AND extract('month' from birthday) = 11;

---3
UPDATE users
SET height = 2.0
WHERE extract('years' from age(birthday)) > 60;

---4
UPDATE users
SET weight = 80
WHERE (extract('years' from age(birthday)) BETWEEN 30 AND 50) 
AND gender = 'male';