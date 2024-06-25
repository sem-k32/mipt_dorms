-- триггер, который увеличивает номер курса у студентов при любом изменении таблицы Student, если 1 сентября уже наступило
CREATE OR REPLACE FUNCTION course_num_increment_trigger_func() RETURNS TRIGGER AS $$
    DECLARE
        cur_month DATE := EXTRACT(month FROM current_date);
    BEGIN
        IF cur_date >= EXTRACT(month FROM make_date(2023, 9, 1)) THEN
            PERFORM UPDATE student SET course = course + 1;
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER course_num_increment_trigger AFTER UPDATE OR DELETE OR INSERT ON student 
FOR EACH ROW EXECUTE FUNCTION course_num_increment_trigger_func();


-- тригер, который уменьшает на один кол-во нарушений, если в таблице Residing_student у него появилась флюрография
CREATE OR REPLACE FUNCTION fluorography_admission_trigger_func() RETURNS TRIGGER AS $$
    DECLARE
        --stud_id INT;
    BEGIN
        IF NEW.have_fluorography = TRUE THEN
            PERFORM UPDATE student SET violation_number = violation_number - 1
             WHERE student_id = NEW.student_id AND violation_number > 0;
        END if;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER fluorography_admission_trigger AFTER UPDATE ON residing_student 
FOR EACH ROW EXECUTE FUNCTION fluorography_admission_trigger_func();
