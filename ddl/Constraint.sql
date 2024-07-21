drop table sales;
drop table customers;
drop table items;
drop table companies;

########PRIMARY KEY
#	PRIMARY KEY(purchase_number),
    
#########FOREIGN KEY
#    FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE

## ALTER TABLE sales
## ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

#########UNIQUE
# UNIQUE KEY(email_address)

#DROP UNIQUE KEY
#Alter Table customers
#drop INDEX email_address

########DEFAULT
#ALTER TABLE customers 
#Change Column number_of_complaints number_of_complaints INT default 0;

#DROP DEFAULT
#alter Table customers
#ALTER COLUMN number_of_complaints DROP DEFAULT;


###### NOT NULL 	

##ALTER TABLE companies
#MODIFY headquarters_phone_number VARCHAR(255) NULL;

#Alter TABLE companies 
#Change column headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;


ALTER TABLE customers
ADD UNIQUE KEY (email_address);

drop table customers;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)

);



ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

ALTER TABLE customers 
Change Column number_of_complaints number_of_complaints INT default 0;

INSERT INTO customers (first_name, last_name, gender, email_address)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com');

Select * from customers;

CREATE TABLE IF NOT EXISTS companies(
	company_id VARCHAR(255),  
	company_name VARCHAR(255),  
	headquarters_phone_number VARCHAR(255)
); 
ALTER TABLE companies
ADD PRIMARY KEY(company_id);

ALTER TABLE companies
ADD UNIQUE KEY(headquarters_phone_number);

ALTER TABLE companies
Change column headquarters_phone_number headquarters_phone_number VARCHAR(255) Default "X";

drop Table companies;

Alter TABLE companies 
Change column headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

