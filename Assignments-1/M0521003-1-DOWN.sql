-- [M0521003][Adi Prasetya]
-- Migration DOWN Version 1

USE library;

ALTER TABLE book_authors
	DROP CONSTRAINT [FK_book_authors_book_id];

ALTER TABLE book_authors
	DROP CONSTRAINT [PK_book_authors_author_name];

ALTER TABLE book
	DROP CONSTRAINT [FK_book_publisher_name];

DROP TABLE book_authors;
DROP TABLE publisher;
DROP TABLE book;
