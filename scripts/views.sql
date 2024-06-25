-- простое представление для допуска к данным сотрудников
CREATE OR REPLACE VIEW personal_public_data (name, surname, dom_num_work, position) AS
SELECT name, surname, dom_number, position
FROM personal;

-- простое представление для допуска к данным жильцов
CREATE OR REPLACE VIEW tenants_publick_data (name, surname, dom_number, room_number, debt) AS
SELECT name, surname, dom_number, room_number, "*...*" || right(CAST(debt to TEXT), 1) || " RUB"
FROM tenant;

-- простое представление для общежития
CREATE OR REPLACE VIEW dormitory_publick_data(dom_number, address, reside_fee, room_type) AS
SELECT dom_number, address, reside_fee,
    CASE WHEN room_type = TRUE THEN "appartment_type" ELSE "coridor_type" END CASE
FROM dormitory;


-- представление для просмотра общего долга и кол-ва студентов-должников за проживание студентов по физтех-школам
CREATE OR REPLACE VEIW obligers_aggregate_data AS
SELECT sum(t.debt) as common_debt, count(*) as num_of_obligers
FROM tenant t INNER JOIN residing_student r_s USING (tenant_id) INNER JOIN student s USING (student_id)
WHERE t.debt > 0
GROUP BY s.school;

-- представление для выявления комнат, где есть вещи нисшего качества, подлежащие замене
CREATE OR  REPLACE VIEW bad_items_per_room_list AS
SELECT apr.room_num, apr.domitery_number, apr.floor, apl.name,
       count(*) OVER (PARTITION BY apr.room_num, apr.domitery_number) as num_of_bad_items
FROM appartment apr INNER JOIN rooms_appliance r_a USING (room_num, domitery_number)
                    INNER JOIN appliance apl USING (appliance_id)
WHERE r_a.quality = 'Bad';

-- представление-описание сотрудников по общежитиям с аггрегированной информацией
CREATE OR REPLACE VIEW personal_in_doms_data AS
SELECT d.dom_number, count(*) as num_of_workers,
       count(DISTINCT p.position)  as num_of_diffrent_positions,
       avg(p.salary) as average_salary,
       max(p.salary) - min(p.salary) as salary_gap
FROM dormitory d INNER JOIN personal p USING(dom_number)
GROUP BY d.dom_number
ORDER BY d.dom_number;




