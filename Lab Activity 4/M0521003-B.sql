-- M0521003
-- Adi Prasetya

-- [SOAL 1]
-- Menggunakan [Master]
USE [master];

--[SOAL 2]
-- User define function
CREATE OR ALTER FUNCTION M0521003_GetTotalPrice(@hargaBarang INT, @jumlahBarangYgDiPesan INT, @diskon FLOAT)
RETURNS FLOAT AS
BEGIN
	DECLARE @price AS FLOAT
	SET @price = @hargaBarang*@jumlahBarangYgDiPesan*(1-@diskon)
	RETURN  @hargaBarang*@jumlahBarangYgDiPesan*(1-@diskon)
END;


SELECT *,
dbo.M0521003_GetTotalPrice(list_price, quantity, discount) AS [Final_Price]
FROM sales.order_items;