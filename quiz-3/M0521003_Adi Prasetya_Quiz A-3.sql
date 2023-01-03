--
-- NAMA  : ADI PRASETYA
-- NIM 	 : M0521003
-- KELAS : INFORMATIKA A
-- [QUIZ A - 3] 
-- Mengimplementasikan Relational Model Transportasi Udara ke engine basis data.

-- Buat database jika belum tersedia dg sintaks di bawah ini :
-- CREATE DATABASE [TransportasiUdara];

-- Jika database sudah dibuat maka akan memakai USE
USE [TransportasiUdara];

CREATE TABLE [PESAWAT](
	[NoLambung]			NVARCHAR(6) NOT NULL,
	[ThPengadaan]		INT NOT NULL,
	[Jenis]				NVARCHAR(50) NOT NULL,
	[Kapasitas]			INT NOT NULL,
	[JamPenggunaan]		INT NOT NULL,
	[KdAirways]			NVARCHAR(10) NOT NULL
);

ALTER TABLE [PESAWAT]
	ADD CONSTRAINT [PK_PESAWAT_NoLambung] PRIMARY KEY ([NoLambung]);

CREATE TABLE [AIRWAYS](
	[KdAirways]			NVARCHAR(10) NOT NULL,
	[Nama]				NVARCHAR(50) NOT NULL,
	[ThBerdiri]			INT NOT NULL,
	[Pemilik]			NVARCHAR(25) NOT NULL,
	[Market]			FLOAT NOT NULL,
	[Telp]				NVARCHAR(9) NOT NULL
);

ALTER TABLE [AIRWAYS]
	ADD CONSTRAINT [PK_AIRWAYS_KdAirways] PRIMARY KEY ([KdAirways]);

CREATE TABLE [KOTA](
	[IdKota]			NVARCHAR(5) NOT NULL,
	[Kota]				NVARCHAR(30) NOT NULL
);

ALTER TABLE [KOTA]
	ADD CONSTRAINT [PK_KOTA_IdKota] PRIMARY KEY ([IdKota]);

CREATE TABLE [RUTE](
	[KdRute]			NVARCHAR(4) NOT NULL,
	[JenisRute]			NVARCHAR(15) NOT NULL,
	[IdKotaDari]		NVARCHAR(5) NOT NULL,
	[IdKotaTujuan]		NVARCHAR(5) NOT NULL
);

ALTER TABLE [RUTE]
	ADD CONSTRAINT [PK_RUTE_KdRute] PRIMARY KEY ([KdRute]);

CREATE TABLE [BANDARA](
	[KdBandara]			NVARCHAR(3) NOT NULL,
	[ThMulaiOperasi]	INT NOT NULL,
	[Nama]				NVARCHAR(50) NOT NULL,
	[LuasArea]			INT NOT NULL,
	[JmlTerminal]		INT NOT NULL,
	[JmlGate]			INT NOT NULL,
	[Kapasitas]			INT NOT NULL,
	[JenisBandara]		NVARCHAR(25) NOT NULL,
	[IdKota]			NVARCHAR(5) NOT NULL
);

ALTER TABLE [BANDARA]
	ADD CONSTRAINT [PK_BANDARA_KdBandara] PRIMARY KEY ([KdBandara]);

CREATE TABLE [PENERBANGAN](
	[KdPenerbangan]		NVARCHAR(20) NOT NULL,
	[MulaiBoarding]		TIME(7),
	[WaktuTakeOff]		TIME(7),
	[WaktuLanding]		TIME(7),
	[KdBandaraDari]		NVARCHAR(3) NOT NULL,
	[KdBandaraTujuan]	NVARCHAR(3) NOT NULL,
	[KdPesawat]			NVARCHAR(6) NOT NULL
);

ALTER TABLE [PENERBANGAN]
	ADD CONSTRAINT [PK_PENERBANGAN_KdPenerbangan] PRIMARY KEY ([KdPenerbangan]);

CREATE TABLE [KOTA_CABANG_AIRWAYS](
	[KdAirways]			NVARCHAR(10) NOT NULL,
	[Kota]				NVARCHAR(5) NOT NULL
);

--COMPOSITE
ALTER TABLE [KOTA_CABANG_AIRWAYS]
	ADD CONSTRAINT [PK_KOTA_CABANG_AIRWAYS] PRIMARY KEY ([KdAirways],[Kota]);


CREATE TABLE [BANDARA_CABANG_AIRWAYS](
	[KdAirways]			NVARCHAR(10) NOT NULL,
	[KdBandara]			NVARCHAR(3) NOT NULL,
	[ThDibuka]			INT NOT NULL
);

--COMPOSITE
ALTER TABLE [BANDARA_CABANG_AIRWAYS]
	ADD CONSTRAINT [PK_BANDARA_CABANG_AIRWAYS] PRIMARY KEY ([KdAirways],[KdBandara]);

CREATE TABLE [TERDIRI_RUTE](
	[KdRute]			NVARCHAR(4) NOT NULL,
	[KdRuteDigunakan]	NVARCHAR(4) NOT NULL
);

--COMPOSITE
ALTER TABLE [TERDIRI_RUTE]
	ADD CONSTRAINT [PK_TERDIRI_RUTE] PRIMARY KEY ([KdRute],[KdRuteDigunakan]);

CREATE TABLE [LAYANAN](
	[KdAirways]			NVARCHAR(10) NOT NULL,
	[KdRute]			NVARCHAR(4) NOT NULL,
	[RuteTerbeli]		INT NOT NULL
);

--COMPOSITE
ALTER TABLE [LAYANAN]
	ADD CONSTRAINT [PK_LAYANAN] PRIMARY KEY ([KdAirways],[KdRute]);


CREATE TABLE [TERBANG_RUTE](
	[KdPenerbangan]		NVARCHAR(20) NOT NULL,
	[KdRute]			NVARCHAR(4) NOT NULL	
);

--COMPOSITE
ALTER TABLE [TERBANG_RUTE]
	ADD CONSTRAINT [PK_TERBANG_RUTE] PRIMARY KEY ([KdPenerbangan],[KdRute]);

-- [FOREIGN KEY] --
ALTER TABLE [PESAWAT]
	ADD CONSTRAINT [FK_PESAWAT_KdAirways] FOREIGN KEY ([KdAirways]) REFERENCES [AIRWAYS]([KdAirways]);

ALTER TABLE [RUTE]
	ADD CONSTRAINT [FK_RUTE_IdKotaTujuan] FOREIGN KEY ([IdKotaTujuan]) REFERENCES [KOTA]([IdKota]);

ALTER TABLE [RUTE]
	ADD CONSTRAINT [FK_RUTE_IdKotaDari] FOREIGN KEY ([IdKotaDari]) REFERENCES [KOTA]([IdKota]);

ALTER TABLE [PENERBANGAN]
	ADD CONSTRAINT [FK_PENERBANGAN_KdBandaraDari] FOREIGN KEY ([KdBandaraDari]) REFERENCES [BANDARA]([KdBandara]);

ALTER TABLE [PENERBANGAN]
	ADD CONSTRAINT [FK_PENERBANGAN_KdBandaraTujuan] FOREIGN KEY ([KdBandaraTujuan]) REFERENCES [BANDARA]([KdBandara]);

ALTER TABLE [PENERBANGAN]
	ADD CONSTRAINT [FK_PENERBANGAN_KdPesawat] FOREIGN KEY ([KdPesawat]) REFERENCES [PESAWAT]([NoLambung]);

ALTER TABLE [BANDARA]
	ADD CONSTRAINT [FK_BANDARA_IdKota] FOREIGN KEY ([IdKota]) REFERENCES [KOTA]([IdKota]);


--INSERT DATA FOR [AIRWAYS] TABLE
INSERT INTO [AIRWAYS] ([KdAirways],[Nama],[ThBerdiri],[Pemilik],[Market],[Telp]) VALUES 
(N'GIA', N'Garuda Indonesia',1970,N'Negara',0.50, N'021889977'),
(N'BTK', N'Batik Air',2000,N'Swasta',0.20, N'021237012'),
(N'JT', N'Lion Air',1995,N'Swasta',0.30, N'021464656');

--INSERT DATA FOR [KOTA] TABLE
INSERT INTO [KOTA] ([IdKota],[Kota]) VALUES 
(N'SL', N'Surakarta'),
(N'YG', N'Yogyakarta'),
(N'DP', N'Denpasar'),
(N'JAK', N'Jakarta'),
(N'SMR', N'Semarang'),
(N'SBY', N'Surabaya'),
(N'BDG', N'Bandung');

--INSERT DATA FOR [BANDARA] TABLE
INSERT INTO [BANDARA]([KdBandara],[ThMulaiOperasi],[Nama],[LuasArea],[JmlTerminal],[JmlGate],[Kapasitas],[JenisBandara],[IdKota]) VALUES
(N'SOC',1990,N'Adisumarmo',50,2,6,5000,N'Nasional',N'SL'),
(N'JOG',1980,N'Adisucipto',90,2,8,7000,N'International',N'YG'),
(N'YIA',2018,N'Yogya International',220,3,20,20000,N'International',N'YG'),
(N'SRG',2000,N'Ahmad Yani',35,2,4,4000,N'Nasional',N'SMR'),
(N'CGK',1965,N'Soekarno Hatta',207,4,20,50000,N'International',N'JAK'),
(N'BDO',1999,N'Husein Sastranegara',40,2,5,4500, N'Nasional',N'BDG'),
(N'SUB',1975,N'Juanda',150,3,9,10000, N'International',N'SBY'),
(N'DEN',1980,N'Ngurah Rai',330,4,18,30000,N'International',N'DP'),
(N'HLP',1945,N'Halim Perdanakusuma',55,2,4,5000,N'International',N'SL');


--INSERT DATA FOR [PESAWAT] TABLE
INSERT INTO [PESAWAT]([NoLambung],[ThPengadaan],[Jenis],[Kapasitas],[JamPenggunaan],[KdAirways]) VALUES 
(N'PK-101', 2000, N'Airbus', 300, 623589, N'JT'),
(N'PK-102', 2005, N'ATR', 10,89006, N'BTK'),
(N'PK-103', 2015, N'Airbus', 250,64262, N'GIA'),
(N'PK-104', 2019, N'Airbus', 300, 73848, N'GIA'),
(N'PK-114', 2009, N'Boeing', 225, 98458548, N'GIA'),
(N'PK-105', 2019, N'Airbus', 400, 64647, N'JT'),
(N'PK-106', 2020, N'Boeing', 300,6654, N'JT'),
(N'PK-107', 1996, N'Boeing', 400, 1234569, N'BTK');

--INSERT DATA FOR [RUTE] TABLE
INSERT INTO [RUTE] ([KdRute],[JenisRute],[IdKotaDari],[IdKotaTujuan]) 
VALUES (N'R001',N'Direct', N'JAK',N'DP'),
(N'R002',N'Indirect', N'SL',N'DP'),
(N'R003',N'Indirect', N'SMR',N'DP'),
(N'R004',N'Direct', N'YG',N'JAK'),
(N'R005',N'Direct', N'SL',N'JAK'),
(N'R006',N'Direct', N'JAK',N'BDG'),
(N'R007',N'Direct', N'SMR',N'JAK'),
(N'R008',N'Direct', N'DP',N'SBY');

--INSERT DATA FOR [PENERBANGAN] TABLE
INSERT INTO [PENERBANGAN] ([KdPenerbangan],[MulaiBoarding],[WaktuTakeOff],[WaktuLanding],[KdBandaraDari],[KdBandaraTujuan],[KdPesawat]) VALUES 
(N'GIA 234', '10:00', '10:45','13:00', N'CGK', N'DEN', N'PK-103'),
(N'GIA 356', '06:00', '06:45','07:15', N'SOC', N'CGK', N'PK-103'),
(N'GIA 123', '07:00', '08:00','09:15', N'SOC', N'CGK', N'PK-104'),
(N'GIA 543', '09:00', '10:00','11:30', N'SOC', N'CGK', N'PK-114'),
(N'JT 334',  '08:30', '09:20','10:10', N'SRG', N'CGK', N'PK-103'),
(N'JT 706',  '12:00', '13:00','14:25', N'CGK', N'DEN', N'PK-103'),
(N'JT 750',  '07:15', '08:00','09:00', N'YIA', N'CGK', N'PK-103'),
(N'JT 330',  '06:30', '07:30','08:45', N'JOG', N'CGK', N'PK-103'),
(N'BTK 100', '06:00', '07:00','09:45', N'CGK', N'DEN', N'PK-103'),
(N'BTK 110', '13:00', '13:30','13:49', N'HLP', N'BDO', N'PK-103'),
(N'JT 890',  '20:00', '20:00','20:30', N'DEN', N'SUB', N'PK-103');

--INSERT DATA FOR [KOTA_CABANG_AIRWAYS] TABLE
INSERT INTO [KOTA_CABANG_AIRWAYS]([KdAirways],[Kota]) VALUES
(N'JT',N'SL'),
(N'JT',N'YG'),
(N'JT',N'DP'),
(N'JT',N'JAK'),
(N'JT',N'SMR'),
(N'BTK',N'SBY'),
(N'BTK',N'BDG'),
(N'GIA',N'SL'),
(N'GIA',N'YG'),
(N'GIA',N'JAK'),
(N'GIA',N'DP');

--INSERT DATA FOR [BANDARA_CABANG AIRWAYS] TABLE 
INSERT INTO [BANDARA_CABANG_AIRWAYS] ([KdAirways],[KdBandara],[ThDibuka]) VALUES
(N'GIA', N'SOC', 2000),
(N'GIA', N'CGK', 1990),
(N'GIA', N'JOG', 1995),
(N'GIA', N'YIA', 2018),
(N'GIA', N'SUB', 1995),
(N'BTK', N'CGK', 2007),
(N'BTK', N'YIA', 2020),
(N'BTK', N'SUB', 2000),
(N'JT', N'CGK', 2000),
(N'JT', N'YIA', 2018),
(N'JT', N'SUB', 2000),
(N'JT', N'DEN', 2000),
(N'JT', N'SOC', 2001),
(N'JT', N'HLP', 2016),
(N'JT', N'JOG', 2000);

--INSERT DATA FOR [TERDIRI_RUTE] TABLE
INSERT INTO [TERDIRI_RUTE] ([KdRute],[KdRuteDigunakan]) VALUES
(N'R002', N'R005'),
(N'R002', N'R001'),
(N'R003', N'R007'),
(N'R003', N'R001');


--INSERT DATA FOR [LAYANAN] TABLE
INSERT INTO [LAYANAN] ([KdAirways],[KdRute],[RuteTerbeli]) VALUES 
(N'GIA', N'R001', 800),
(N'GIA', N'R002', 70),
(N'GIA', N'R005', 300),
(N'JT', N'R001', 200),
(N'JT', N'R002', 150),
(N'JT', N'R003', 135),
(N'JT', N'R004', 300),
(N'JT', N'R007', 500),
(N'BTK', N'R001', 1000),
(N'BTK', N'R006', 30);

--INSERT DATA FOR [TERBANG_RUTE] TABLE
INSERT INTO [TERBANG_RUTE] ([KdPenerbangan],[KdRute]) VALUES
(N'GIA 234', N'R001'),
(N'GIA 234', N'R002'),
(N'GIA 356', N'R005'),
(N'GIA 356', N'R002'),
(N'GIA 123', N'R005'),
(N'GIA 543', N'R005'),
(N'JT 334' , N'R007'),
(N'JT 334' , N'R003'),
(N'JT 706' , N'R001'),
(N'JT 706' , N'R003'),
(N'JT 650' , N'R004'),
(N'JT 330' , N'R004'),
(N'BTK 100', N'R001'),
(N'BTK 110', N'R006');
