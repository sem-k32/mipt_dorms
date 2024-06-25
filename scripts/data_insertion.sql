INSERT INTO Dormitory VALUES (1, 'г. Долгопрудный, ул. Первомайская, д. 34/5', FALSE, 4, 100, NULL);
INSERT INTO Dormitory VALUES (2, 'г. Долгопрудный, ул. Первомайская, д. 32', FALSE, 4, 100, NULL);
INSERT INTO Dormitory VALUES (3, 'г. Долгопрудный, ул. Первомайская, д. 30, к. 3', FALSE, 5, 100, NULL);
INSERT INTO Dormitory VALUES (6, 'г. Долгопрудный, Московское шоссе, д. 21 к. 6', FALSE, 5, 100, NULL);
INSERT INTO Dormitory VALUES (7, 'г. Долгопрудный, ул. Первомайская, д. 30, к. 7', FALSE, 5, 100, NULL);
INSERT INTO Dormitory VALUES (9, 'г. Долгопрудный, ул. Первомайская, д. 28А', TRUE, 17, 200, '2009-09-01');

INSERT INTO apartment VALUES (101, 1, 1);
INSERT INTO apartment VALUES (110, 1, 1);
INSERT INTO apartment VALUES (311, 3, 1);
INSERT INTO apartment VALUES (104, 3, 1);
INSERT INTO apartment VALUES (230, 7, 1);
INSERT INTO apartment VALUES (112, 7, 1);
INSERT INTO apartment VALUES (122, 9, 2);
INSERT INTO apartment VALUES (225, 6, 2);

INSERT INTO appliance VALUES (1, 'Холодильник');
INSERT INTO appliance VALUES (2, 'Плита');
INSERT INTO appliance VALUES (3, 'Кондиционер');
INSERT INTO appliance VALUES (4, 'Пылесос');
INSERT INTO appliance VALUES (5, 'Сушилка');
INSERT INTO appliance VALUES (6, 'Ноутбук');
INSERT INTO appliance VALUES (7, 'Чайник');

INSERT INTO rooms_appliance VALUES (101, 1, 1, 'Worn-out');
INSERT INTO rooms_appliance VALUES (101, 1, 4, 'Perfect');
INSERT INTO rooms_appliance VALUES (311, 3, 7, 'Worn-out');
INSERT INTO rooms_appliance VALUES (311, 3, 1, 'Worn-out');
INSERT INTO rooms_appliance VALUES (311, 3, 5, 'Perfect');
INSERT INTO rooms_appliance VALUES (122, 9, 6, 'Perfect');
INSERT INTO rooms_appliance VALUES (230, 7, 5, 'Worn-out');
INSERT INTO rooms_appliance VALUES (112, 7, 1, 'Bad');

INSERT INTO Tenant VALUES (1, 101, 1, 'Вася', 'Петров', 0, '2022-09-02');
INSERT INTO Tenant VALUES (2, 110, 1, 'Иван', 'Иванов', 67, '2022-09-07');
INSERT INTO Tenant VALUES (3, 311, 3, 'Анастасия', 'Кузнецова', 67, '2022-09-03');
INSERT INTO Tenant VALUES (4, 104, 3, 'Максим', 'Смирнов', 67, '2022-09-03');
INSERT INTO Tenant VALUES (5, 230, 7, 'Екатерина', 'Петрова', 28, '2022-08-15');
INSERT INTO Tenant VALUES (6, 112, 7, 'Дмитрий', 'Сурдин', 49, '2022-08-18');
INSERT INTO Tenant VALUES (7, 122, 9, 'Алексей', 'Козлов', 49, '2022-08-31');

INSERT INTO Student VALUES (1, 1, 6, 'ФАКТ', 0.47, 0);
INSERT INTO Student VALUES (2, 2, 3, 'ФПМИ', 0.53, 1);
INSERT INTO Student VALUES (3, 2, 3, 'ФПМИ', 0.89, 0);
INSERT INTO Student VALUES (4, 2, 1, 'ЛФИ', 0.99, 5);
INSERT INTO Student VALUES (5, 4, 8, 'ФБМФ', 0.72, 0);
INSERT INTO Student VALUES (6, 1, 2, 'ФРТК', 0.61, 0);
INSERT INTO Student VALUES (7, 5, 1, 'ИНБИКСТ', 0.73, 0);

INSERT INTO residing_student VALUES (1, 1, TRUE);
INSERT INTO residing_student VALUES (2, 2, TRUE);
INSERT INTO residing_student VALUES (3, 3, TRUE);
INSERT INTO residing_student VALUES (4, 4, TRUE);
INSERT INTO residing_student VALUES (5, 5, TRUE);

INSERT INTO personal VALUES (1, 1, 'Titus', 'Patano', 'Администарция', '2011-06-15', NULL, 1000);
INSERT INTO personal VALUES (2, 1, 'Daise', 'Litzsinger', 'Охрана', '2017-12-18', NULL, 300);
INSERT INTO personal VALUES (3, 1, 'Nikifor', 'Gifford', 'Охрана', '2016-11-17', '2017-11-17', 300);
INSERT INTO personal VALUES (4, 3, 'Keenan', 'Ramsel', 'Уборка', '2012-02-08', NULL, 200);
INSERT INTO personal VALUES (5, 3, 'Agnew', 'Aspacio', 'Мусор', '2018-08-06', '2018-11-15', 125);
INSERT INTO personal VALUES (6, 9, 'Bradyn', 'Habana', 'Администрация', '2014-07-27', '2016-02-11', 1500);
INSERT INTO personal VALUES (7, 9, 'Amyntas', 'Shahan', 'Ремонт', '2013-10-12', NULL, 600);




