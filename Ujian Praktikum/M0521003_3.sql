-- Saya, Adi Prasetya, dengan NIM
-- M0521003, bersumpah demi Tuhan YME bahwa saya mengerjakan soal
-- ujian ini berdasarkan hasil pencarian dan pemikiran saya sendiri dan tidak
-- berkonsultasi pada teman lain melalui media apapun. Saya siap menerima sanksi
-- moral apabila saya terbukti melanggar sumpah tersebut"

USE [SPOTIFY];

ALTER ROLE [r_app_manager] DROP MEMBER [jim];
ALTER ROLE [r_artist_manager] DROP MEMBER [joe];
ALTER ROLE [r_stream_manager] DROP MEMBER [john];

DROP ROLE [r_app_manager];
DROP ROLE [r_artist_manager];
DROP ROLE [r_stream_manager];

DROP USER [jim];
DROP USER [joe];
DROP USER [john];

DROP LOGIN [spotify_jim];
DROP LOGIN [spotify_joe];
DROP LOGIN [spotify_john];

-- [ SOAL A ]
-- [ MEMBUAT LOGIN ]
CREATE LOGIN [spotify_jim] WITH PASSWORD = 'Jim12345';
CREATE LOGIN [spotify_joe] WITH PASSWORD = 'Joe12345';
CREATE LOGIN [spotify_john] WITH PASSWORD = 'John12345';

-- [ MEMBUAT USER ]
CREATE USER [jim] FOR LOGIN [spotify_jim];
CREATE USER [joe] FOR LOGIN [spotify_joe];
CREATE USER [john] FOR LOGIN [spotify_john];

-- [ SOAL B ]
-- [ MEMBUAT ROLES ]
-- [a]
CREATE ROLE [r_app_manager];
GRANT SELECT, INSERT, UPDATE, DELETE ON [GENRE] TO [r_app_manager];
GRANT SELECT, INSERT, UPDATE, DELETE ON [USER] TO [r_app_manager];

-- [b]
CREATE ROLE [r_artist_manager];
GRANT SELECT, UPDATE, DELETE ON [ARTIST] TO [r_artist_manager];
GRANT SELECT, UPDATE, DELETE ON [ALBUM] TO [r_artist_manager];
GRANT SELECT, UPDATE, DELETE ON [SONG] TO [r_artist_manager];
GRANT SELECT, UPDATE, DELETE ON [SONG_GENRE] TO [r_artist_manager];
GRANT SELECT ON [GENRE] TO [r_artist_manager];

-- [c]
CREATE ROLE [r_stream_manager];
GRANT SELECT, INSERT, UPDATE ON [STREAM] TO [r_stream_manager];
GRANT SELECT ON [SONG] TO [r_stream_manager];
GRANT SELECT ON [USER] TO [r_stream_manager];

-- [ SOAL C]
ALTER ROLE [r_app_manager] ADD MEMBER [jim];
ALTER ROLE [r_artist_manager] ADD MEMBER [joe];
ALTER ROLE [r_stream_manager] ADD MEMBER [john];



