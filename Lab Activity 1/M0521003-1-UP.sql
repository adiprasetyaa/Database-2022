-- [M0521003][Adi Prasetya]
-- Migration UP Version 1

USE library;

CREATE TABLE book_authors(
	author_name			NVARCHAR(50) NOT NULL,
	book_id				INT NOT NULL
);


CREATE TABLE publisher(
	fullname			NVARCHAR(60) NOT NULL,
	adress				NVARCHAR(70),
	phone				INT
);

CREATE TABLE book(
	book_id				INT NOT NULL,
	title				NVARCHAR(75),
	publisher_name		NVARCHAR(60) NOT NULL
);


ALTER TABLE book
	ADD CONSTRAINT [PK_book_book_id] PRIMARY KEY ([book_id]);

ALTER TABLE publisher
	ADD CONSTRAINT [PK_publisher_fullname] PRIMARY KEY ([fullname]);

ALTER TABLE book_authors
	ADD CONSTRAINT [PK_book_authors_author_name] PRIMARY KEY([author_name]);

ALTER TABLE book
	ADD CONSTRAINT [FK_book_publisher_name] FOREIGN KEY ([publisher_name]) REFERENCES publisher ([fullname]);

ALTER TABLE book_authors
	ADD CONSTRAINT [FK_book_authors_book_id] FOREIGN KEY ([book_id]) REFERENCES book ([book_id]);
	