CREATE DATABASE schoolmanagementsystem;
USE schoolmanagementsystem;

CREATE TABLE bank_accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    account_number BIGINT,
    balance DECIMAL(10, 2)
);	
