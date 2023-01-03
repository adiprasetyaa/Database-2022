-- Saya, Adi Prasetya, dengan NIM
-- M0521003, bersumpah demi Tuhan YME bahwa saya mengerjakan soal
-- ujian ini berdasarkan hasil pencarian dan pemikiran saya sendiri dan tidak
-- berkonsultasi pada teman lain melalui media apapun. Saya siap menerima sanksi
-- moral apabila saya terbukti melanggar sumpah tersebut"

-- SOAL A

-- SOAL B
SELECT [ARTIST].[Name], [ARTIST].[ID],COUNT([SONG].[ID]) AS JumlahLagu
FROM ARTIST INNER JOIN ALBUM ON [ARTIST].[ID] = [ALBUM].[ArtistID]
INNER JOIN SONG ON [ALBUM].[ID] = [SONG].[AlbumID]
WHERE [ALBUM].[ReleaseYear] < 2010
GROUP BY [ARTIST].[Name], [ARTIST].[ID]
ORDER BY [ARTIST].[Name];

-- SOAL C
SELECT [GENRE].[ID],[GENRE].[Name], COUNT([SONG].[Title]) AS [JumlahLagu]
FROM [SONG] JOIN [SONG_GENRE] ON [SONG].[ID] = [SONG_GENRE].[SongID]
JOIN [GENRE] ON [SONG_GENRE].[GenreID] = [GENRE].[ID]
GROUP BY [GENRE].[ID],[GENRE].[Name]
ORDER BY [GENRE].[Name];

-- SOAL D
SELECT [ARTIST].[ID], [ARTIST].[Name] [ArtistName], [GENRE].[ID],[GENRE].[Name] [Genre], COUNT([SONG].[Title]) AS [JumlahLagu]
FROM [ARTIST] JOIN [ALBUM] ON [ARTIST].[ID] = [ALBUM].[ArtistID]
JOIN [SONG] ON [SONG].[AlbumID] = [ALBUM].[ID] 
JOIN [SONG_GENRE] ON [SONG].[ID] = [SONG_GENRE].[SongID]
JOIN [GENRE] ON [SONG_GENRE].[GenreID] = [GENRE].[ID]
GROUP BY [ARTIST].[ID], [ARTIST].[Name], [GENRE].[ID],[GENRE].[Name]
ORDER BY  [ARTIST].[ID], [ARTIST].[Name], [GENRE].[ID],[GENRE].[Name]

-- SOAL E
SELECT TOP (5) [SONG].[ID], [SONG].[Title] [SongTitle], COUNT([SONG].[ID]) AS [JumlahStreaming]
FROM [SONG] JOIN [STREAM] ON [SONG].[ID] = [STREAM].[SongID]
GROUP BY [SONG].[ID], [SONG].[Title];

-- SOAL F
SELECT TOP (5) [ALBUM].[ID], [ALBUM].[Name],[ALBUM].[ReleaseYear], COUNT([SONG].[ID]) AS [JumlahStreaming]
FROM [STREAM] JOIN [SONG] ON [SONG].[ID] = [STREAM].[SongID]
JOIN [ALBUM] ON [ALBUM].[ID] = [SONG].[AlbumID]
WHERE [ALBUM].[ReleaseYear] > 2010 AND [ALBUM].[ReleaseYear] < 2022
GROUP BY [ALBUM].[ID], [ALBUM].[Name],[ALBUM].[ReleaseYear]
ORDER BY [JumlahStreaming] DESC;

-- SOAL G
SELECT TOP (3) [ARTIST].[ID], [ARTIST].[Name] [ArtistName], COUNT([SONG].[ID]) AS [JumlahStreaming]
FROM [SONG] JOIN [STREAM] ON [SONG].[ID] = [STREAM].[SongID]
GROUP BY [SONG].[ID], [SONG].[Title];