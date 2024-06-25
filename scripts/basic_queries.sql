-- обнуляем долг
UPDATE tenant SET debt = 0 WHERE tenant_id = 6;
-- переводим студента в другую ФШ
UPDATE student SET school='ФРТК' WHERE student_id = 3;
-- увольняем работника
UPDATE personal SET dismissal_date = now() WHERE position = 'Уборка';
-- обновляем качество вещи
UPDATE rooms_appliance SET quality = 'Worn-out' WHERE room_num = 122 AND domitery_number = 9;
-- обновляем данные по общежитию
UPDATE dormitory SET foundation_year = '1981-05-21' WHERE dom_number = 8;

-- выселяем всех раздолбов
WITH droping_students AS(
    DELETE FROM student WHERE average_grade <= 0.4
           RETURNING *
)
DELETE FROM residing_student WHERE student_id = droping_students.student_id;

-- очищаем устаревшие данные по персоналу
DELETE FROM personal WHERE dismissal_date <= '2000-12-30';
DELETE FROM rooms_appliance WHERE quality = 'Bad' AND domitery_number = 3;

-- селим студента в общежитие
INSERT INTO residing_student VALUES (6, 6, FALSE);

-- ищем всех крупных должников
SELECT tenant_id, name, surname FROM tenant WHERE debt >= 50;