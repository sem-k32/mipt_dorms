-- вывести лучших по среднему баллу студентов, проживающих в общежитии
WITH great_st AS(
    SELECT max(average_grade) max_grade, school
    FROM student s
    WHERE exists(SELECT * FROM residing_student r_s WHERE r_s.student_id = s.student_id)
    GROUP BY school
)
SELECT student_id, average_grade
FROM student s
WHERE EXISTS(SELECT * FROM great_st WHERE great_st.school = s.school AND great_st.max_grade = s.average_grade)
ORDER BY average_grade DESC;

-- посчитаем, сколько в 1,3 и 7 общежитии предметов быта качества "хорошо" и "отлично"
SELECT count(*) num_of_items
FROM rooms_appliance
WHERE domitery_number IN (1, 3, 7)
GROUP BY quality
HAVING quality != 'Bad';

-- выведем все общежития, которые появились в 21 веке, отсортированные по убыванию стоимости жилья
SELECT dom_number,
       CASE
           WHEN room_type = FALSE THEN 'коридорное'
           ELSE 'квартирное'
           END,
       reside_fee
FROM dormitory
WHERE foundation_year >= '1999-12-30'
ORDER BY reside_fee DESC;

-- для каждого жильца 9 общежития выведем соседа, поселившегося в комнату до (не позже) его самого
SELECT name,
       surname,
       lag(housing_date, 1, 'first_tenant') OVER (PARTITION BY (dom_number, room_number) ORDER BY housing_date) prev_neigbour
FROM tenant
WHERE dom_number = 9;

-- выведем топ 5 должников-студентов в общежитиях
WITH alm_done AS (
    SELECT name,
       surname,
       debt,
       dense_rank() OVER (PARTITION BY dom_number ORDER BY debt DESC) as rating
    FROM tenant t
    WHERE exists(SELECT * FROM residing_student r_s WHERE r_s.tenant_id = t.tenant_id)
)
SELECT * FROM alm_done
WHERE rating <= 5;

-- найдём, сколько жильцы заплатили за общежитие с момента поселения
SELECT name, surname,
       (extract(year FROM age(now(),housing_date)) * 12 + extract(month FROM age(now(),housing_date)))
           * (SELECT reside_fee FROM dormitory d WHERE t.dom_number = d.dom_number) as overall_payment
FROM tenant t
ORDER BY name, surname;

