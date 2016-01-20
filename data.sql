DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Contract_type;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS Equipment_type;
DROP TABLE IF EXISTS Membership;
DROP TABLE IF EXISTS Membership_type;

CREATE TABLE Contract_type (
  id   INT AUTO_INCREMENT,
  name VARCHAR(150),
  PRIMARY KEY (id)
);

CREATE TABLE Role_type (
  id   INT AUTO_INCREMENT,
  name VARCHAR(150),
  PRIMARY KEY (id)
);

CREATE TABLE Employee (
  id                 INT AUTO_INCREMENT,
  login              VARCHAR(100),
  password           VARCHAR(100),
  name               VARCHAR(100),
  surname            VARCHAR(100),
  date_of_employment DATE,
  contract_type_id   INT,
  salary_hour        INT,
  role_type_id       INT DEFAULT 2,
  PRIMARY KEY (id),
  CONSTRAINT `contract_type_id_f` FOREIGN KEY (contract_type_id)
  REFERENCES Contract_type (id),
  CONSTRAINT `role_type_id_f` FOREIGN KEY (role_type_id) REFERENCES ROLE_TYPE (id)
);

CREATE TABLE Customer (
  id      INT AUTO_INCREMENT,
  name    VARCHAR(100),
  surname VARCHAR(100),
  address VARCHAR(300),
  PRIMARY KEY (id)
);

CREATE TABLE Equipment_type (
  id   INT AUTO_INCREMENT,
  name VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE Equipment (
  id                INT AUTO_INCREMENT,
  serial_number     VARCHAR(100),
  name              VARCHAR(100),
  type_id           INT,
  purchase_date     DATE,
  last_service_date DATE,
  is_working        BOOLEAN,
  PRIMARY KEY (id),
  CONSTRAINT `type_id_f` FOREIGN KEY (type_id)
  REFERENCES Equipment_type (id)
);

CREATE TABLE Membership_type (
  id          INT AUTO_INCREMENT,
  name        VARCHAR(100),
  length_days INT,
  price       DECIMAL,
  PRIMARY KEY (id)
);

CREATE TABLE Membership (
  id                 INT AUTO_INCREMENT,
  customer_id        INT,
  membership_type_id INT,
  start_date         DATE,
  PRIMARY KEY (id),
  CONSTRAINT `Membership_type_id_f` FOREIGN KEY (membership_type_id)
  REFERENCES Membership_type (id)
);

INSERT INTO `Role_type` (`id`, `name`) VALUES ('1', 'ADMIN');
INSERT INTO `Role_type` (`id`, `name`) VALUES ('2', 'USER');

/* rodzaje umów */
INSERT INTO `Contract_type` (`name`) VALUES ('Permanent'), ('Contractor'), ('Self employed');

INSERT INTO `Employee` (`name`, `surname`, `login`, `password`, `date_of_employment`, `contract_type_id`, `role_type_id`, `salary_hour`)
VALUES ('admin', 'admin', 'admin', 'admin', '2016-01-07', '1', '1', '1'),
  ('user', 'user', 'user', 'user', '2016-01-27', '1', '2', '2');

/* pracownicy */
INSERT INTO `Employee` (`name`, `surname`, `date_of_employment`, `contract_type_id`, `salary_hour`)
VALUES ('Libby', 'Green', '2015-11-17', 1, 15), ('Quemby', 'Hughes', '2015-11-03', 2, 14),
  ('Bryar', 'Weiss', '2014-07-02', 3, 12), ('India', 'Hebert', '2014-10-27', 2, 11),
  ('Wanda', 'Mcgee', '2015-01-18', 2, 19), ('Anika', 'Reid', '2015-12-10', 1, 12),
  ('Dara', 'Riddle', '2015-01-21', 2, 12), ('Oren', 'Bishop', '2014-10-10', 3, 15),
  ('Isabelle', 'Lindsay', '2015-07-04', 2, 18), ('Frances', 'Holloway', '2015-10-08', 3, 9);
INSERT INTO `Employee` (`name`, `surname`, `date_of_employment`, `contract_type_id`, `salary_hour`)
VALUES ('Amethyst', 'Parrish', '2015-11-25', 3, 12), ('Aquila', 'Weiss', '2014-06-05', 1, 17),
  ('Leslie', 'Justice', '2015-11-23', 3, 8), ('Cade', 'Serrano', '2015-12-22', 3, 20),
  ('Hayes', 'Washington', '2015-11-30', 1, 10), ('Leigh', 'Byers', '2015-09-10', 3, 18),
  ('Charissa', 'Ryan', '2015-05-15', 3, 13), ('Daquan', 'Maddox', '2015-09-18', 1, 16),
  ('Chaney', 'Tyler', '2015-05-08', 3, 10), ('Lane', 'Hebert', '2015-08-16', 3, 20);
INSERT INTO `Employee` (`name`, `surname`, `date_of_employment`, `contract_type_id`, `salary_hour`)
VALUES ('Akeem', 'Mcknight', '2015-03-29', 1, 9), ('Brenda', 'Morin', '2015-10-23', 3, 10),
  ('Gage', 'Mcdowell', '2015-02-12', 3, 16), ('Ina', 'Rivas', '2014-06-12', 2, 8),
  ('Graiden', 'Carter', '2015-05-12', 1, 10), ('Jena', 'Oneil', '2015-07-12', 1, 12),
  ('Alan', 'Whitney', '2014-12-29', 3, 9), ('Marcia', 'Hubbard', '2014-09-16', 2, 14),
  ('Nyssa', 'Langley', '2014-07-06', 3, 16), ('Hakeem', 'Rivers', '2014-08-03', 3, 20);
INSERT INTO `Employee` (`name`, `surname`, `date_of_employment`, `contract_type_id`, `salary_hour`)
VALUES ('Cleo', 'Snyder', '2014-07-07', 1, 13), ('Julian', 'Harmon', '2015-03-26', 3, 14),
  ('Heidi', 'Carpenter', '2014-06-02', 2, 20), ('Harriet', 'Frost', '2014-11-21', 2, 8),
  ('Brittany', 'Adams', '2015-11-07', 2, 9), ('Melinda', 'Lowe', '2015-03-20', 1, 16),
  ('Blossom', 'Flowers', '2015-01-02', 2, 12), ('Astra', 'Eaton', '2015-12-13', 3, 18),
  ('Maile', 'Jackson', '2014-08-26', 3, 8), ('Brenden', 'Maldonado', '2015-02-01', 2, 13);

/* klienci */
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Joy', 'Jones', '6465 Odio. Avenue'), ('Imelda', 'Burns', 'Ap #160-1962 Odio. Ave'),
  ('Camilla', 'Nieves', '927-7623 Arcu. Ave'),
  ('Mariam', 'Rivers', 'P.O. Box 355, 4477 Mauris Rd.'),
  ('Beatrice', 'Sullivan', '754-2250 Scelerisque, Ave'),
  ('Xenos', 'Rowe', 'P.O. Box 276, 3049 Ligula. Rd.'),
  ('Troy', 'Meyers', 'Ap #884-9286 Lobortis. Rd.'),
  ('Hall', 'Witt', 'P.O. Box 539, 7029 Massa. St.'),
  ('Aurelia', 'Alford', '227-5534 Posuere Avenue'), ('August', 'Walton', '536-2743 Integer Avenue');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Glenna', 'Hurst', 'Ap #142-247 Rutrum, Road'),
  ('Lee', 'Obrien', 'P.O. Box 831, 6847 Tellus, St.'), ('Chiquita', 'Lopez', '6305 Vivamus Street'),
  ('Orson', 'Meyer', '1080 Pellentesque Rd.'), ('Ryder', 'Villarreal', '9202 Lacinia St.'),
  ('Connor', 'Bass', '1379 Aliquam Av.'), ('Alma', 'Carpenter', '484-2641 Eu Avenue'),
  ('Penelope', 'Michael', '6417 Lorem Ave'), ('Jena', 'Duffy', '270-6270 Nibh. Rd.'),
  ('Kim', 'Robinson', '6399 Nulla Road');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Cleo', 'Slater', '3653 Ipsum. Avenue'), ('Amena', 'Medina', '236-1488 Ante. Ave'),
  ('Caryn', 'Macdonald', 'P.O. Box 224, 7363 Ante. Road'),
  ('Hanae', 'Hawkins', '617-4263 Nibh Street'), ('Sarah', 'Sellers', '650-430 Leo, Rd.'),
  ('Kaitlin', 'Stanton', '139-416 Odio St.'), ('Indigo', 'Sosa', '812-9427 Vulputate, Road'),
  ('Keefe', 'Roy', '484-6817 Id, Rd.'), ('Rooney', 'Wall', 'Ap #959-5538 Magna. Avenue'),
  ('Ryan', 'Cline', '361-6240 Orci. Av.');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Lucius', 'Wolfe', '8791 Metus. Avenue'), ('Isadora', 'Walsh', '572-3666 Ac Ave'),
  ('Davis', 'Knox', '650-939 Vulputate Ave'), ('Pearl', 'Brennan', 'Ap #918-1767 Amet Av.'),
  ('Camille', 'Carver', '4763 Mauris St.'), ('Graiden', 'Mccall', '706-8530 Non, St.'),
  ('Hop', 'Grimes', 'Ap #224-8222 Proin Rd.'), ('Judah', 'Le', '7324 Varius Road'),
  ('Emery', 'Little', '569-7406 Risus. Ave'),
  ('Colleen', 'Mclaughlin', 'Ap #731-4289 Vestibulum Avenue');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Gemma', 'Clay', 'Ap #383-8910 Porttitor Road'), ('Alisa', 'Wong', '172-5838 Ut, St.'),
  ('Dolan', 'Eaton', '858-363 A, Rd.'), ('Sonia', 'West', '7937 Proin Rd.'),
  ('Deborah', 'Carr', 'Ap #910-3378 Fringilla Avenue'),
  ('Jayme', 'Lamb', 'Ap #796-8677 Venenatis Avenue'),
  ('Whilemina', 'Lara', 'P.O. Box 477, 201 Urna. Street'),
  ('Elaine', 'Merrill', 'P.O. Box 737, 7133 In Street'),
  ('Ryder', 'Elliott', 'P.O. Box 168, 5694 Blandit St.'),
  ('Nomlanga', 'Riddle', 'P.O. Box 129, 2818 Sapien, Ave');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Randall', 'Rodriquez', 'P.O. Box 239, 7902 Quisque St.'),
  ('Colorado', 'Roman', '7150 A Ave'), ('Rebecca', 'Burgess', '8828 Dapibus Av.'),
  ('Yoshi', 'Medina', '1204 Et St.'), ('Drake', 'Nixon', 'Ap #662-7652 Montes, Rd.'),
  ('Uma', 'Spence', 'Ap #675-7539 Non Avenue'), ('Joel', 'Robinson', '5739 Dictum. Rd.'),
  ('Timon', 'Gilmore', 'Ap #619-8297 Nunc, Rd.'),
  ('Arden', 'Jennings', 'P.O. Box 162, 7977 Amet St.'),
  ('Briar', 'Walsh', 'Ap #411-4589 Nulla St.');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Stuart', 'Stevenson', '2739 Primis Rd.'),
  ('Idona', 'Bean', 'P.O. Box 307, 9327 Nibh. Street'), ('Suki', 'Gilbert', '5085 Duis Street'),
  ('Tyler', 'Valdez', 'Ap #972-7174 Pede, Av.'), ('Jemima', 'Freeman', '3494 Vulputate Street'),
  ('Regina', 'Fields', '269 Elementum Av.'), ('Wang', 'Rodriquez', '1224 Mi, Street'),
  ('Cathleen', 'Roth', '5953 Ac Av.'), ('Hilary', 'Finley', 'Ap #757-185 Magnis Ave'),
  ('Vanna', 'Callahan', '487-2214 Tempus Rd.');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Indira', 'Scott', 'P.O. Box 529, 4052 Quam Street'), ('Kevin', 'Johnston', '3079 Et Rd.'),
  ('Colt', 'Becker', 'P.O. Box 574, 8438 Accumsan Rd.'),
  ('Hanna', 'Jenkins', 'P.O. Box 753, 7901 Lacus. Avenue'),
  ('Quinn', 'Brennan', 'Ap #496-7686 Phasellus Rd.'), ('Troy', 'Walsh', '5500 Donec Av.'),
  ('Herman', 'Jenkins', '927-1361 Sollicitudin Avenue'),
  ('Preston', 'Gay', 'P.O. Box 448, 3220 Suspendisse St.'),
  ('Sara', 'Olsen', '764-9220 Quisque Road'), ('Matthew', 'Foster', '986-7617 Neque. Street');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('Aubrey', 'Delgado', 'Ap #820-1357 Semper Rd.'), ('Tyrone', 'Hanson', '9682 Mollis Av.'),
  ('Sydnee', 'Phillips', 'Ap #732-3043 Lorem St.'), ('Martena', 'Skinner', '4686 Litora Avenue'),
  ('Jenette', 'Collier', '531-2020 Maecenas Rd.'), ('Iliana', 'Kennedy', '408-9591 In Street'),
  ('Fulton', 'Cardenas', 'P.O. Box 253, 4623 Eu, St.'), ('Wilma', 'Hopkins', '7600 Sed Ave'),
  ('Daquan', 'Price', '519-1771 Orci St.'), ('Buffy', 'Espinoza', 'Ap #559-5919 In St.');
INSERT INTO `Customer` (`name`, `surname`, `address`)
VALUES ('May', 'Finch', '2639 Nunc Av.'), ('Aladdin', 'Clay', '3647 Non St.'),
  ('Charde', 'Fuller', 'P.O. Box 530, 5328 Non, Road'),
  ('Audra', 'Baxter', '151-9752 Dignissim Road'), ('Nicole', 'Dodson', '886-7025 Venenatis Street'),
  ('Pascale', 'Decker', '183-3443 Gravida Road'),
  ('Vernon', 'Schwartz', 'P.O. Box 846, 6241 Risus. Avenue'),
  ('Yuli', 'Nelson', 'Ap #634-6972 Rutrum, Road'),
  ('Sharon', 'Benjamin', 'Ap #765-7217 Ut, Avenue'),
  ('Kiara', 'Abbott', 'P.O. Box 117, 5766 Aliquam, Street');


INSERT INTO Membership_type (`name`, `length_days`, `price`)
VALUES ('Student30', 30, 80),
  ('Student90', 90, 220),
  ('Open30', 30, 100),
  ('Open90', 90, 270),
  ('Open120', 120, 360);

INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (1, 5, '2014-11-08'), (2, 1, '2014-10-02'), (3, 1, '2014-12-30'), (4, 2, '2014-07-17'),
  (5, 2, '2014-11-09'), (6, 3, '2014-11-10'), (7, 1, '2014-12-13'), (8, 3, '2014-12-04'),
  (9, 2, '2014-08-09'), (10, 1, '2014-06-21');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (11, 1, '2014-09-22'), (12, 5, '2014-08-23'), (13, 2, '2014-10-27'), (14, 4, '2014-10-25'),
  (15, 5, '2014-11-04'), (16, 2, '2014-10-29'), (17, 1, '2014-12-24'), (18, 5, '2014-09-17'),
  (19, 3, '2014-12-23'), (20, 3, '2014-11-12');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (21, 3, '2014-11-25'), (22, 5, '2014-12-08'), (23, 5, '2014-07-13'), (24, 5, '2014-12-20'),
  (25, 2, '2014-06-13'), (26, 4, '2014-08-24'), (27, 4, '2014-11-02'), (28, 5, '2014-11-13'),
  (29, 5, '2014-08-22'), (30, 5, '2014-07-14');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (31, 4, '2014-12-26'), (32, 5, '2014-09-10'), (33, 5, '2014-10-22'), (34, 4, '2014-09-04'),
  (35, 2, '2014-11-18'), (36, 3, '2014-06-14'), (37, 5, '2014-10-20'), (38, 3, '2014-10-29'),
  (39, 4, '2014-08-09'), (40, 1, '2014-07-29');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (51, 1, '2014-11-27'), (52, 5, '2014-08-29'), (53, 5, '2014-12-10'), (54, 4, '2014-09-09'),
  (55, 1, '2014-11-25'), (56, 3, '2014-11-14'), (57, 5, '2014-07-10'), (58, 5, '2014-11-27'),
  (59, 3, '2014-09-16'), (60, 4, '2014-06-18');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (61, 3, '2014-10-01'), (62, 1, '2014-08-14'), (63, 3, '2014-12-14'), (64, 2, '2014-12-09'),
  (65, 4, '2014-10-30'), (66, 5, '2014-12-12'), (67, 1, '2014-09-02'), (68, 1, '2014-08-20'),
  (69, 3, '2014-07-11'), (70, 1, '2014-10-28');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (71, 4, '2014-07-23'), (72, 5, '2014-12-06'), (73, 2, '2014-11-12'), (74, 1, '2014-07-04'),
  (75, 4, '2014-09-21'), (76, 2, '2014-06-17'), (77, 5, '2014-06-21'), (78, 5, '2014-10-23'),
  (79, 4, '2014-11-18'), (80, 1, '2014-07-31');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (81, 2, '2014-09-30'), (82, 1, '2014-08-01'), (83, 5, '2014-09-03'), (84, 3, '2014-10-13'),
  (85, 1, '2014-07-24'), (86, 5, '2014-10-15'), (87, 3, '2014-08-17'), (88, 2, '2014-12-26'),
  (89, 4, '2014-08-10'), (90, 5, '2014-11-12');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (91, 3, '2014-11-13'), (92, 3, '2014-07-27'), (93, 4, '2014-10-10'), (94, 1, '2014-10-04'),
  (95, 3, '2014-09-27'), (96, 5, '2014-11-11'), (97, 3, '2014-12-28'), (98, 4, '2014-07-13'),
  (99, 4, '2014-10-11'), (100, 4, '2014-11-04');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (1, 5, '2015-07-08'), (2, 1, '2015-11-01'), (3, 3, '2015-06-13'), (4, 3, '2015-06-30'),
  (5, 1, '2015-04-27'), (6, 3, '2015-09-22'), (7, 1, '2015-03-29'), (8, 2, '2015-02-26'),
  (9, 5, '2015-08-03'), (10, 1, '2015-06-07');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (11, 1, '2015-08-01'), (12, 4, '2015-06-25'), (13, 3, '2015-02-21'), (14, 2, '2015-10-02'),
  (15, 3, '2015-08-09'), (16, 2, '2015-04-27'), (17, 3, '2015-12-01'), (18, 4, '2015-04-18'),
  (19, 3, '2015-07-01'), (20, 2, '2015-04-02');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (21, 5, '2015-08-29'), (22, 5, '2015-06-02'), (23, 5, '2015-04-24'), (24, 5, '2015-10-16'),
  (25, 1, '2015-08-07'), (26, 3, '2015-02-25'), (27, 2, '2015-09-05'), (28, 1, '2015-10-26'),
  (29, 4, '2015-03-30'), (30, 3, '2015-07-02');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (31, 5, '2015-07-19'), (32, 3, '2015-02-24'), (33, 4, '2015-08-23'), (34, 5, '2015-07-28'),
  (35, 2, '2015-03-26'), (36, 4, '2015-06-10'), (37, 4, '2015-04-15'), (38, 5, '2015-10-02'),
  (39, 1, '2015-03-21'), (40, 5, '2015-02-14');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (41, 5, '2015-07-27'), (42, 1, '2015-02-26'), (43, 3, '2015-07-09'), (44, 2, '2015-10-30'),
  (45, 2, '2015-11-17'), (46, 1, '2015-06-25'), (47, 3, '2015-11-14'), (48, 2, '2015-06-23'),
  (49, 4, '2015-05-01'), (50, 5, '2015-03-22');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (51, 1, '2015-04-29'), (52, 5, '2015-04-03'), (53, 4, '2015-03-21'), (54, 4, '2015-10-26'),
  (55, 1, '2015-05-05'), (56, 1, '2015-11-30'), (57, 4, '2015-12-11'), (58, 5, '2015-08-02'),
  (59, 2, '2015-08-19'), (60, 2, '2015-05-02');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (61, 2, '2015-06-16'), (62, 3, '2015-10-07'), (63, 1, '2015-03-19'), (64, 5, '2015-04-20'),
  (65, 3, '2015-07-09'), (66, 1, '2015-09-29'), (67, 1, '2015-09-23'), (68, 2, '2015-09-02'),
  (69, 1, '2015-06-16'), (70, 3, '2015-08-06');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (71, 4, '2015-08-22'), (72, 5, '2015-08-17'), (73, 4, '2015-02-11'), (74, 5, '2015-12-10'),
  (75, 1, '2015-04-24'), (76, 4, '2015-11-10'), (77, 1, '2015-05-30'), (78, 3, '2015-12-15'),
  (79, 5, '2015-07-31'), (80, 4, '2015-12-01');
INSERT INTO `Membership` (`customer_id`, `membership_type_id`, `start_date`)
VALUES (91, 4, '2015-09-06'), (92, 5, '2015-05-30'), (93, 1, '2015-08-03'), (94, 3, '2015-05-06'),
  (95, 3, '2015-12-08'), (96, 1, '2015-11-23'), (97, 4, '2015-04-28'), (98, 1, '2015-10-19'),
  (99, 1, '2015-10-02'), (100, 2, '2015-11-15');
