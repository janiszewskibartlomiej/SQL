-- import danych z pliku XML - pojedyncza komórka
SELECT CONVERT(xml, BulkColumn, 2) as XmlDocs
FROM
OPENROWSET (BULK 'C:\SQL\a001z020102.xml', SINGLE_BLOB) AS T1
-- XML do SQL
DECLARE @xmldata XML
SELECT @xmldata = CONVERT(XML, BulkColumn, 2) FROM
OPENROWSET (BULK 'C:\SQL\a001z020102.xml', SINGLE_BLOB) AS T1

SELECT 
	X.element.value('kod_waluty[1]','char(3)') as kod_waluty,
	X.element.value('../data_publikacji[1]','varchar(10)') as data_publikacji,
	X.element.value('kurs_sredni[1]','varchar(10)') as kurs_sredni
FROM
	@xmldata.nodes('/tabela_kursow/pozycja') AS X(element)