--
-- DOWN - abaikan jika errornya "does not exist" atau sejenisnya
--

USE [perpustakaan]; -- Masukkan nama database di sini

ALTER ROLE [r_bookmgr] DROP MEMBER [minh];
ALTER ROLE [r_librarymgr] DROP MEMBER [gabe];
ALTER ROLE [r_loanmgr] DROP MEMBER [dave];
ALTER ROLE [r_loanmgr] DROP MEMBER [chris];
ALTER ROLE [superuser] DROP MEMBER [cliffe];

DROP ROLE [r_bookmgr];
DROP ROLE [r_librarymgr];
DROP ROLE [r_loanmgr];
DROP ROLE [superuser];

DROP USER [cliffe];
DROP USER [minh];
DROP USER [gabe];
DROP USER [dave];
DROP USER [chris];

USE [perpustakaan];

DROP LOGIN [perpustakaan_cliffe];
DROP LOGIN [perpustakaan_minh];
DROP LOGIN [perpustakaan_gabe];
DROP LOGIN [perpustakaan_dave];
DROP LOGIN [perpustakaan_chris];

--
-- UP -- kerjakan di sini
--


USE [master];

-- [MEMBUAT LOGIN] --
CREATE LOGIN [perpustakaan_cliffe] WITH PASSWORD = 'Cliffe1234';
CREATE LOGIN [perpustakaan_minh] WITH PASSWORD = 'Minh1234';
CREATE LOGIN [perpustakaan_gabe] WITH PASSWORD ='Gabe1234';
CREATE LOGIN [perpustakaan_dave] WITH PASSWORD = 'Dave1234';
CREATE LOGIN [perpustakaan_chris] WITH PASSWORD = 'Chris1234';

USE [perpustakaan]; -- Masukkan nama database di sini

-- Setup user, permission, dan role di sini

-- [MEMBUAT USER] --
CREATE USER [cliffe] FOR LOGIN [perpustakaan_cliffe];
CREATE USER [minh] FOR LOGIN [perpustakaan_minh];
CREATE USER [gabe] FOR LOGIN [perpustakaan_gabe];
CREATE USER [dave] FOR LOGIN [perpustakaan_dave];
CREATE USER [chris] FOR LOGIN [perpustakaan_chris];

-- [MEMBUAT ROLES] --

-- Membuat Role dan Permission dari [SUPER USER
CREATE ROLE [superuser];
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::[dbo] TO [superuser];
-- Menambahkan member ke dalam roles [SUPER USER]
ALTER ROLE [superuser] ADD MEMBER [cliffe];

-- Membuat Roles dan Permission dari [BOOK MANAGER]
CREATE ROLE [r_bookmgr];
GRANT SELECT, INSERT, UPDATE, DELETE ON [BOOK] TO  [r_bookmgr];
GRANT SELECT, INSERT, UPDATE, DELETE ON [BOOK_AUTHORS] TO  [r_bookmgr];
GRANT SELECT, INSERT, UPDATE, DELETE ON [PUBLISHER] TO  [r_bookmgr];
-- Menambahkan member ke dalam roles [BOOK MANAGER]
ALTER ROLE [r_bookmgr] ADD MEMBER [minh];

-- Membuat Roles dan Permission dari [LIBRARY MANAGER]
CREATE ROLE [r_librarymgr];
GRANT SELECT, INSERT, UPDATE, DELETE ON [LIBRARY_BRANCH] TO [r_librarymgr];
GRANT SELECT, INSERT, UPDATE, DELETE ON [BOOK_COPIES] TO [r_librarymgr];
GRANT SELECT ON [BOOK] TO [r_librarymgr];
-- Menambahkan member ke dalam roles [MANAGER PERPUSTAKAAN]
ALTER ROLE [r_librarymgr] ADD MEMBER [gabe];

-- Membuat Roles dan Permission dari [MANAGER PINJAMAN]
CREATE ROLE [r_loanmgr];
GRANT SELECT, INSERT, UPDATE, DELETE ON [BORROWER] TO [r_loanmgr];
GRANT SELECT, INSERT, UPDATE, DELETE ON [BOOK_LOANS] TO [r_loanmgr];
GRANT SELECT ON [BOOK] TO [r_loanmgr];
GRANT SELECT ON [LIBRARY_BRANCH] TO [r_loanmgr];
GRANT SELECT ON [BOOK_COPIES] TO [r_loanmgr];
-- Menambahkan member ke dalam roles
ALTER ROLE [r_loanmgr] ADD MEMBER [dave];
ALTER ROLE [r_loanmgr] ADD MEMBER [chris];
