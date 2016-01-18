drop table employee;
drop table contract_type;
drop table role_type;
drop table customer;
drop table Equipment; 
drop table Equipment_type;
drop table Membership;
drop table Membership_type;

CREATE TABLE Contract_type(
	id int AUTO_INCREMENT,
	name varchar(150),
	PRIMARY KEY (id)
);

CREATE TABLE Role_type (
  id INT AUTO_INCREMENT,
  name VARCHAR(150),
  PRIMARY KEY (id)
);

CREATE TABLE Employee (
  id INT AUTO_INCREMENT,
  name VARCHAR(100),
  surname VARCHAR(100),
  login VARCHAR(100),
  password VARCHAR(100),
  date_of_employment DATE,
  contract_type_id INT,
  role_type_id INT,
  salary_hour INT,
  PRIMARY KEY (id),
  CONSTRAINT `contract_type_id_f` FOREIGN KEY (contract_type_id) REFERENCES Contract_type (id),
  CONSTRAINT `role_type_id_f` FOREIGN KEY (role_type_id) REFERENCES ROLE_TYPE (id)
);

CREATE TABLE Customer(
	id int AUTO_INCREMENT,
	name varchar(100),
	surname varchar(100),
	address varchar(300),
	PRIMARY KEY (id)
);

CREATE TABLE Equipment_type(
	id int AUTO_INCREMENT,
	name varchar(100),
	PRIMARY KEY (id)
);

CREATE TABLE Equipment(
	id int AUTO_INCREMENT,
	serial_number varchar(100),
	name varchar(100),
	type_id int,
	purchase_date date,
	last_service_date date,
	is_working boolean,
	PRIMARY KEY (id),
	CONSTRAINT `type_id_f` FOREIGN KEY (type_id) 
		REFERENCES Equipment_type (id)
);

CREATE TABLE Membership_type(
	id int AUTO_INCREMENT,
	name varchar(100),
	length_days int,
	PRIMARY KEY (id)
);

CREATE TABLE Membership(
	id int AUTO_INCREMENT,
	customer_id int,
	membership_type_id int,
	start_date date,
	price decimal,
	PRIMARY KEY (id),
	CONSTRAINT `Membership_type_id_f` FOREIGN KEY (membership_type_id) 
		REFERENCES Membership_type (id)
);


INSERT INTO `Role_type` (`id`, `name`) VALUES ('1', 'admin');
INSERT INTO `Role_type` (`id`, `name`) VALUES ('2', 'user');
INSERT INTO `Contract_type` (`id`, `name`) VALUES ('1', 'random');
INSERT INTO `Employee` (`id`, `name`, `surname`, `login`, `password`, `date_of_employment`, 
`contract_type_id`, `role_type_id`, `salary_hour`) 
VALUES ('1', 'admin', 'admin', 'admin', 'admin', '2016-01-07', '1', '1', '1'), 
('2', 'user', 'user', 'user', 'user', '2016-01-27', '1', '2', '2');