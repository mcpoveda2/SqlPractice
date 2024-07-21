create database if not exists sales;
use sales;

#Varchar 
#char	
#Enum
#on delete cascade

DROP TABLE sales;

CREATE TABLE IF NOT EXISTS sales(
	purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
	PRIMARY KEY(purchase_number),
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
    # ON DELETE CASCADE -- Si se borra una columna de la padre,
    # la columnas dentro del hijo con el mismo key seran eliminado
);

##Alter

## ALTER TABLE sales
## ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;


CREATE TABLE IF NOT EXISTS customers(
	customer_id INT NOT NULL  AUTO_INCREMENT,
	first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
	email_address int,
    number_of_complaints varchar(255),
    primary key (customer_id)  

);

DROP TABLE companies;

CREATE TABLE IF NOT EXISTS items(
	item_code VARCHAR(255),  
    item VARCHAR(255),  
    unit_price NUMERIC(10,2),  
    company_id VARCHAR(255),
    PRIMARY KEY(item_code)
);

CREATE TABLE IF NOT EXISTS companies(
	company_id VARCHAR(255),  
	company_name VARCHAR(255),  
	headquarters_phone_number INT(12),
    PRIMARY KEY(company_id)
); 


