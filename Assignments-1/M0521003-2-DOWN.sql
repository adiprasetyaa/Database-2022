-- [M0521003][Adi Prasetya]
-- Migration DOWN Version 2

USE library;

ALTER TABLE book_loans
	DROP CONSTRAINT [FK_book_loans_card_no];

ALTER TABLE book_loans
	DROP CONSTRAINT [FK_book_loans_book_id];

ALTER TABLE book_loans
	DROP CONSTRAINT [FK_book_loans_branch_id];

ALTER TABLE book_copies
	DROP CONSTRAINT [FK_book_copies_book_id];

ALTER TABLE book_copies
	DROP CONSTRAINT [FK_book_copies_branch_id];

DROP TABLE borrowed;
DROP TABLE book_loans;
DROP TABLE book_copies;
DROP TABLE library_branch;