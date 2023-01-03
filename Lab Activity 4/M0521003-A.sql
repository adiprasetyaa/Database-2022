-- M0521003
-- Adi Prasetya

-- [SOAL 1]
-- Procedure
CREATE OR ALTER PROCEDURE [BookLoans_Overdue](@tanggal AS DATE)
AS
BEGIN
	SELECT [BORROWER].[Name],[BOOK_LOANS].[DueDate]
	FROM [BORROWER] INNER JOIN [BOOK_LOANS] ON [BOOK_LOANS].[CardNo] = [BORROWER].[CardNo]
	WHERE DATEDIFF(day,[BOOK_LOANS].[DueDate],@tanggal) >= 0
END;

--Contoh Perintah untuk Eksekusi Procedure
EXEC [BookLoans_Overdue] @tanggal = N'2022-09-17'

--[SOAL 2]
-- User define function
CREATE OR ALTER FUNCTION [BookLoans_Borrower] (@CardNumber AS INT)
RETURNS TABLE AS
RETURN(
	SELECT [Book].[Title], [BOOK_LOANS].[DateOut], [BOOK_LOANS].[DueDate] FROM [BOOK] 
	INNER JOIN [BOOK_LOANS] ON [Book].[BookId] = [BOOK_LOANS].[BookId] 
	INNER JOIN [BORROWER] ON [BORROWER].[CardNo] = [BOOK_LOANS].[CardNo]
	WHERE [BORROWER].[CardNo] = @CardNumber
);

-- Contoh perintah untuk eksekusi Function
SELECT * FROM [BookLoans_Borrower](5)

-- [SOAL 3]
-- Trigger
CREATE OR ALTER TRIGGER [BookLoans_Compute] ON [BOOK_LOANS]
AFTER INSERT, UPDATE AS 
BEGIN
	 UPDATE [BOOK_LOANS] SET [Duration] = DATEDIFF(DAY, DateOut, DueDate)
END

-- Contoh perintah untuk mengeksekusi Trigger
ENABLE TRIGGER [BookLoans_Compute] ON [BOOK_LOANS]
GO