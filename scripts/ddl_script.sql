CREATE TABLE Dormitory
(
    dom_number INTEGER PRIMARY KEY,
    address VARCHAR(100),
    room_type BOOLEAN,
    number_of_floors INTEGER,
    reside_fee NUMERIC(5,2),
    foundation_year DATE
);

CREATE TABLE Apartment
(
    room_num INTEGER,
    domitery_number INTEGER,
    number_of_rooms INTEGER,

    CONSTRAINT PK_apart PRIMARY KEY (room_num, domitery_number),
    CONSTRAINT FK_dom_ref FOREIGN KEY (domitery_number) REFERENCES Dormitory(dom_number)
);

CREATE TABLE Appliance
(
    appliance_id INTEGER PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Rooms_appliance
(
    room_num INTEGER,
    domitery_number INTEGER,
    appliance_id INTEGER,
    quality VARCHAR(10) CHECK ( quality = 'Perfect' OR quality = 'Worn-out' OR quality = 'Bad' ),

    CONSTRAINT FK_room_dom_ref FOREIGN KEY (room_num, domitery_number) REFERENCES Apartment(room_num, domitery_number),
    CONSTRAINT FK_appl_ref FOREIGN KEY (appliance_id) REFERENCES Appliance(appliance_id)
);

CREATE TABLE Personal
(
    personal_id INTEGER PRIMARY KEY,
    dom_number INTEGER REFERENCES Dormitory(dom_number),
    name VARCHAR(20),
    surname VARCHAR(20),
    position VARCHAR(20),
    enrol_date DATE,
    dismissal_date DATE,
    salary NUMERIC(7,2)
);

CREATE TABLE Tenant
(
    tenant_id INTEGER PRIMARY KEY,
    room_number INTEGER,
    dom_number INTEGER,
    name VARCHAR(20),
    surname VARCHAR(20),
    debt NUMERIC(10,2),
    housing_date DATE,

    CONSTRAINT FK_apart_ref FOREIGN KEY (room_number, dom_number) REFERENCES Apartment(room_num, domitery_number)
);

CREATE TABLE Student
(
    student_id INTEGER PRIMARY KEY,
    course INTEGER CHECK ( course >= 0 AND course <= 6 ),
    group_num INTEGER,
    school VARCHAR(10),
    average_grade NUMERIC(2,2),
    violation_number INTEGER
);

CREATE TABLE Residing_student
(
    student_id INTEGER REFERENCES Student(student_id),
    tenant_id INTEGER REFERENCES Tenant(tenant_id),
    have_fluorography BOOLEAN,

    CONSTRAINT PK_stud_ten PRIMARY KEY (student_id, tenant_id)
);