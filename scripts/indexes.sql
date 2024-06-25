-- чаще всего общагу ищут по номеру
CREATE INDEX dom_num_index ON dormitory(dom_number);

-- людей чаще всего ищут по имени и фамилии
CREATE INDEX personal_pers_inf ON personal(name, surname);
CREATE INDEX tenant_pers_inf ON tenant(name, surname);

-- студента легко искать по номеру группы и факультету
CREATE INDEX student_ind ON student(group_num, school);

-- для квартир создаём индекс по их номеру
CREATE INDEX appartment_num_ind ON appartment(room_num);