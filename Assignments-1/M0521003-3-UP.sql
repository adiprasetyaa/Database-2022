-- [M0521003][Adi Prasetya]
-- Migration UP Version 3

USE library;

ALTER TABLE publisher
	ADD [publisher_id] INT NOT NULL;

ALTER TABLE book
	DROP CONSTRAINT [FK_book_publisher_name];

ALTER TABLE book
	DROP COLUMN [publisher_name];

ALTER TABLE publisher
	DROP CONSTRAINT [PK_publisher_fullname];

ALTER TABLE publisher 
	ADD CONSTRAINT [PK_publisher_publisher_id] PRIMARY KEY ([publisher_id]);

ALTER TABLE book
	ADD [publisher_id] INT;

ALTER TABLE book
	ADD CONSTRAINT [FK_book_publisher_id] FOREIGN KEY ([publisher_id]) REFERENCES publisher ([publisher_id]);
