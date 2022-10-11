-- [M0521003][Adi Prasetya]
-- Migration DOWN Version 3

USE library;

ALTER TABLE book
	DROP CONSTRAINT [FK_book_publisher_id];

ALTER TABLE book
	DROP COLUMN [publisher_id];

ALTER TABLE publisher
	DROP CONSTRAINT [PK_publisher_publisher_id];

ALTER TABLE publisher
	DROP COLUMN [publisher_id];

ALTER TABLE publisher 
	ADD CONSTRAINT [PK_publisher_fullname] PRIMARY KEY ([fullname]);

ALTER TABLE book
	ADD [publisher_name] NVARCHAR(60);

ALTER TABLE book
	ADD CONSTRAINT [FK_book_publisher_name] FOREIGN KEY ([publisher_name]) REFERENCES publisher ([fullname]);