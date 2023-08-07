-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);
SELECT * FROM student

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student ADD COLUMN middle_name varchar;

-- 3. Удалить колонку middle_name
ALTER TABLE student DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student RENAME COLUMN birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
ALTER TABLE student ADD PRIMARY KEY(student_id);
INSERT INTO student VALUES(1, 'Ivan', 'Ivanov', '2000-08-12', '8-800-900-10-20');
INSERT INTO student VALUES(2, 'Petr', 'Petrov', '2000-12-02', '8-700-600-56-53');
INSERT INTO student VALUES(3, 'Katya', 'Smirnova', '1999-11-12', '6-433-111-23-24');
-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student RESTART IDENTITY;
