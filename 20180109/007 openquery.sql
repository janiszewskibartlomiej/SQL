-- OPENQUERY
-- konfiguracja systemu
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE WITH OVERRIDE

EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE WITH OVERRIDE

-- dostêpne sterowniki danych
EXEC xp_enum_oledb_providers
-- OPENQUERY z SQL Server
SELECT *
	FROM OPENROWSET(
	'SQLNCLI11',
	'SERVER=mssql01.dcsweb.pl,51433; Database=1449_northwind;uid=1449_kurs;pwd=123abcZ!!',
	'SELECT * FROM Customers') AS Tabela
-- 
