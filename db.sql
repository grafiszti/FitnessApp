CREATE TABLE Contract_type(
	id int AUTO_INCREMENT,
	name varchar(150),
	PRIMARY KEY (id)
);

CREATE TABLE Employee (
	id int AUTO_INCREMENT,
	name varchar(100),
	surname varchar(100),
	date_of_employment date,
	contract_type_id int,
	salary_hour int,
	PRIMARY KEY (id),
	CONSTRAINT `contract_type_id_f` FOREIGN KEY (contract_type_id) 
		REFERENCES Contract_type (id)
);

CREATE TABLE Customer(
	id int AUTO_INCREMENT,
	name varchar(100),
	surname varchar(100),
	adress varchar(300),
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


/*
 drop table employee;
 drop table contract_type;
 drop table customer;
 drop table Equipment;
 drop table Equipment_type;
 drop table Membership;
 drop table Membership_type;
 */
 


