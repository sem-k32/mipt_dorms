-- функция, которая по номеру студента выдаёт информационную строку, аггрегирующую
-- информацию по нему из таблицы students
CREATE OR REPLACE FUNCTION student_info(stud_id INT) RETURNS TEXT AS
$$
    DECLARE
        stud_name TEXT;
        res TEXT;
    BEGIN 
        -- ищем имя студента
        SELECT t.name
        INTO STRICT stud_name 
        FROM tenant t
        WHERE EXISTS(SELECT * FROM residing_student r_s WHERE r_s.student_id = stud_id AND t.tenant_id = r_s.tenant_id);

        SELECT 'Student ' || stud_name || ' of group ' || group_num || ', ' || school || ' school' || 
               ' has average grade ' || average_grade || ' and ' || violation_number || ' violations'
        INTO STRICT res
        FROM student
        WHERE student_id = stud_id
        LIMIT 1;

        RETURN res;
    -- обрабатываем исключение, если такого студента не существует
    exception
        WHEN no_data_found THEN
            RAISE NOTICE 'No such student with id %', stud_id;
    END;
$$
LANGUAGE plpgsql;

-- функция возвращает общую месячную выручку для переданных в аргумент общежитий
CREATE OR REPLACE FUNCTION revenue_per_doms (doms INT[]) RETURNS FLOAT AS $$
    DECLARE
        num_of_doms INT := array_length(doms, 1);
        -- вспомогательная переменная для хранения id текущей общаги
        cur_dom INT;
        -- вспомогательная переменная для хранения кол-ва жителей данной общаги
        cur_tenant_num INT;
        -- вспомогательная переменная для хранения стоимости жилья данной общаги
        cur_dom_fee INT;
        res FLOAT := 0;
    BEGIN
        IF num_of_doms is NULL THEN
            RETURN 0.0;
        END IF;
        
        FOR i IN 1..num_of_doms LOOP
            cur_dom := doms[i];
            cur_dom_fee := 0;
            cur_tenant_num := 0;

            SELECT count(*) INTO STRICT cur_tenant_num
            FROM tenant
            WHERE dom_number = cur_dom;

            <<possible_exception_block>>
            BEGIN
                SELECT reside_fee INTO STRICT cur_dom_fee
                FROM dormitory
                WHERE dom_number = cur_dom;
            EXCEPTION
                WHEN no_data_found THEN
                    RAISE EXCEPTION 'There is no such domitory with num %', cur_dom; 
            END possible_exception_block;

            res := res + cur_dom_fee * cur_tenant_num;
        END LOOP;   

        RETURN res;
    END;
$$ LANGUAGE plpgsql;