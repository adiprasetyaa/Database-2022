---- M0521023_Gentur Sahadewa

--USE [master];

-- Menggunakan database bikestores untuk mencoba input parameter
USE [bikestores];

DROP FUNCTION IF EXISTS [BikeStore_GetTotalPrice];

---- Buat function BikeStore_GetTotalPrice di sini

CREATE OR ALTER FUNCTION [BikeStore_GetTotalPrice] (
	@HargaBarang FLOAT, 
	@jmlBarang INT,
	@Diskon FLOAT --Menggunakan FLOAT, bukan DECIMAL agar bisa diterapkan di database bikestores
)
RETURNS FLOAT
AS
BEGIN
	RETURN @HargaBarang * @jmlBarang * (1 - @Diskon)
END;


SELECT 
[order_items].[order_id],
[order_items].[item_id], 
[order_items].[quantity],
[order_items].[list_price],
[order_items].[discount],
dbo.[BikeStore_GetTotalPrice](list_price, quantity, discount) AS [Price_After_Discount]

FROM [sales].[order_items];