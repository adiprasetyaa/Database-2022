USE [TransportasiUdara];

SELECT [KOTA].[Kota],COUNT([PENERBANGAN].[KdBandaraTujuan]) AS [JumlahPesawat] FROM [KOTA]
INNER JOIN [BANDARA] ON [KOTA].[IdKota] = [BANDARA].[IdKota]
INNER JOIN [PENERBANGAN] ON [BANDARA].[KdBandara] = [PENERBANGAN].[KdBandaraTujuan]
WHERE [PENERBANGAN].[WaktuLanding] >= '00:00:00' AND [PENERBANGAN].[WaktuLanding] < '12:00:00' 
GROUP BY [KOTA].[Kota]
HAVING COUNT([PENERBANGAN].[WaktuLanding]) > 4;
