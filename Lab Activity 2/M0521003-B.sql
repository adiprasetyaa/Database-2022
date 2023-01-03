-- [M0521003]
-- [ADI PRASETYA]

-- Tulis SQL query untuk menjawab nomor 1
SELECT [BOOK].[Title],[PUBLISHER].[Address]
FROM [BOOK]
INNER JOIN [PUBLISHER] ON [BOOK].[PublisherName] = [PUBLISHER].[Name]
ORDER BY [BOOK].[Title] ASC;

-- Tulis SQL query untuk menjawab nomor 2
SELECT [BOOK].[Title], COUNT([BOOK_AUTHORS].[BookId]) AS [TotalWritter] FROM [BOOK]
INNER JOIN [BOOK_AUTHORS] ON [BOOK].[BookId] = [BOOK_AUTHORS].[BookId]
GROUP BY [BOOK].[Title]
ORDER BY [BOOK].[Title] ASC;

-- Tulis SQL query untuk menjawab nomor 3
SELECT TOP(5) [BORROWER].[Name], COUNT([BOOK_LOANS].[CardNo]) AS [TotalLoans] FROM [BOOK_LOANS]
INNER JOIN [BORROWER] ON [BOOK_LOANS].[CardNo] = [BORROWER].[CardNo]
GROUP BY [BORROWER].[Name]
ORDER BY [TotalLoans] DESC;

-- Tulis SQL query untuk menjawab nomor 4
SELECT [BOOK].[Title],[LIBRARY_BRANCH].[BranchName],[BOOK_COPIES].[No_Of_Copies]-[TOTAL] AS [StockLeft] FROM [BOOK_COPIES]
INNER JOIN(
	SELECT [BOOK_COPIES].[BranchId], [BOOK_COPIES].[BookId], COUNT([BOOK_LOANS].[BookId]) AS [TOTAL] FROM [BOOK_COPIES]
	LEFT JOIN [BOOK_LOANS] ON [BOOK_COPIES].[BookId] = [BOOK_LOANS].[BookId] AND [BOOK_COPIES].[BranchId] = [BOOK_LOANS].[BranchId]
	GROUP BY [BOOK_COPIES].[BranchId],[BOOK_COPIES].[BookId]
) AS [TOTAL] ON [BOOK_COPIES].[BookId] = [TOTAL].[BookId] AND [BOOK_COPIES].[BranchId] = [TOTAL].[BranchId]

INNER JOIN [BOOK] ON [BOOK].[BookId] = [BOOK_COPIES].BookId
INNER JOIN [LIBRARY_BRANCH] ON [LIBRARY_BRANCH].[BranchId] = [BOOK_COPIES].[BranchId]
ORDER BY [LIBRARY_BRANCH].[BranchName] ASC, [BOOK].[Title];

-- Tulis SQL query untuk menjawab nomor 5
SELECT TOP(5)[BORROWER].[Name],[BOOK_LOANS].[CardNo], SUM(DATEDIFF(DAY, [BOOK_LOANS].[DueDate],'2022-10-26')*5000)[PenaltyPayment]
FROM [BOOK_LOANS] JOIN [BORROWER] ON [BOOK_LOANS].[CardNo]=[BORROWER].[CardNo]
WHERE [BOOK_LOANS].[DueDate] < '2022-10-26'
GROUP BY [BOOK_LOANS].[CardNo], [BORROWER].[Name]
ORDER BY [PenaltyPayment] DESC;
