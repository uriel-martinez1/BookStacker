USE master
GO

--drop database if it exists
IF DB_ID('bookfly') IS NOT NULL
BEGIN
	ALTER DATABASE bookfly SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE bookfly;
END

CREATE DATABASE bookfly
GO

USE bookfly
GO

--create tables
CREATE TABLE users {
	user_id int IDENTITY(1,1) NOT NULL,
	first_name nvarchar(50) NOT NULL,
	last_name nvarchar(50) NOT NULL, 
	email nvarchar(500) NOT NULL, 
	username nvarchar(50) NOT NULL UNIQUE,
	password_hash nvarchar(200) NOT NULL,
	salt nvarchar(200) NOT NULL, 
	user_role nvarchar(50) NOT NULL, 
	isAdmin BIT DEFAULT 0,
	isActive BIT DEFAULT 1, 
	created_date DATETIME DEFAULT GETUTCDATE(),
	last_updated DATETIME NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id),
}

GO

CREATE TABLE books {
	book_id int IDENTITY (1,1) NOT NULL,
	book_name nvarchar(200) NOT NULL, 
	book_pages int NOT NULL,
	author_name nvarchar(200) NOT NULL,
	CONSTRAINT PK_book PRIMARY KEY (book_id),
}
