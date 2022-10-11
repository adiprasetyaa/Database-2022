-- [M0521003][Adi Prasetya]
-- Migration UP Version 2

USE library;

CREATE TABLE book_copies(
	book_id				INT NOT NULL,		
	branch_id			INT NOT NULL,
	no_of_copies		INT
);

CREATE TABLE book_loans(
	book_id				INT NOT NULL,
	branch_id			INT NOT NULL,
	card_no				INT NOT NULL,
	date_out			DATE,
	due_date			DATE
);

CREATE TABLE library_branch(
	branch_id			INT NOT NULL,
	branch_name			NVARCHAR(30),
	address				NTEXT
);

CREATE TABLE borrowed(
	card_no				INT NOT NULL,
	fullname			NVARCHAR(50),
	address				NTEXT,
	phone				INT
);

ALTER TABLE library_branch
	ADD CONSTRAINT [PK_library_branch_branch_id] PRIMARY KEY ([branch_id]);

ALTER TABLE borrowed 
	ADD CONSTRAINT [PK_borrowed] PRIMARY KEY ([card_no]);

ALTER TABLE book_copies
	ADD CONSTRAINT [FK_book_copies_book_id] FOREIGN KEY ([book_id]) REFERENCES book ([book_id]);

ALTER TABLE book_copies
	ADD CONSTRAINT [FK_book_copies_branch_id] FOREIGN KEY ([branch_id]) REFERENCES library_branch([branch_id]);

ALTER TABLE book_loans
	ADD CONSTRAINT [FK_book_loans_book_id] FOREIGN KEY ([book_id]) REFERENCES book([book_id]);

ALTER TABLE book_loans
	ADD CONSTRAINT [FK_book_loans_branch_id] FOREIGN KEY ([branch_id]) REFERENCES library_branch([branch_id]);

ALTER TABLE book_loans
	ADD CONSTRAINT [FK_book_loans_card_no] FOREIGN KEY ([card_no]) REFERENCES borrowed ([card_no]);