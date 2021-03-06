-- tworzenie bazy danych - wszystko z bazy MASTER
USE master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'praca')
	BEGIN
		-- przejęcie bazy na wyłączność i usunięcie
		ALTER DATABASE Praca SET SINGLE_USER WITH ROLLBACK IMMEDIATE
		DROP DATABASE Praca
	END
CREATE DATABASE Praca

USE Praca

CREATE TABLE Pracownik
(id int IDENTITY(1,1) NOT NULL,
Aktywny bit DEFAULT 1,
Imię nvarchar(50),
Nazwisko nvarchar(50),
PESEL char(11) UNIQUE,
Miejscowość int DEFAULT 1,
DataUrodzenia date,
DataZatrudnienia date DEFAULT Getdate(),
Stanowisko int DEFAULT 1 NOT NULL)
GO
CREATE TABLE Stanowiska
(id int IDENTITY (1,1),
Stanowisko nvarchar(50))
GO
CREATE TABLE Miejscowości
(id int NOT NULL,
Miejscowość nvarchar(50))
GO
-- kontrola poprawności danych
ALTER TABLE Pracownik
	WITH CHECK ADD CONSTRAINT S_DataZatrudnienia CHECK (DataZatrudnienia <= getdate())
GO
	-- SELECT * FROM sys.check_constraints -- istniejące CHECKi
ALTER TABLE Pracownik
	WITH CHECK ADD CONSTRAINT ck_PracownikPesel
	CHECK (PESEL like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
-- relacje - nadanie PK
ALTER TABLE Pracownik ADD CONSTRAINT
	PK_Pracownik PRIMARY KEY (id)
ALTER TABLE Stanowiska ADD CONSTRAINT
	PK_Stanowiska PRIMARY KEY (id)
ALTER TABLE Miejscowości ADD CONSTRAINT
	PK_Miejscowości PRIMARY KEY (id)
-- relacje - nadanie PK-FK
GO
ALTER TABLE Pracownik ADD CONSTRAINT
	FK_Pracownik_Stanowiska FOREIGN KEY
	(Stanowisko) REFERENCES Stanowiska (id)
	ON UPDATE No ACTION
	ON DELETE No ACTION
-- SELECT * FROM sys.key_constraints -- wykaz kluczy 
-- SELECT * FROM sys.foreign_keys -- klucze obce
-- SELECT * FROM sys.foreign_key_columns -- kolumny kluczy
GO
ALTER TABLE Pracownik ADD CONSTRAINT
	FK_Pracownik_Miejscowości FOREIGN KEY
	(Miejscowość) REFERENCES Miejscowości (id)
	ON UPDATE No ACTION
	ON DELETE No ACTION
-- BACKUP
BACKUP DATABASE Praca TO DISK ='praca_kopia.bak'
-- dodawanie rekordów
-- kolejność dodawania !
GO
SET IDENTITY_INSERT Stanowiska ON			-- wymuszenie ID
INSERT INTO Stanowiska (id, Stanowisko) VALUES (1, 'Prezes')
INSERT INTO Stanowiska (id, Stanowisko) VALUES (2, 'Dyrektor')
INSERT INTO Stanowiska (id, Stanowisko) VALUES (3, 'Kierownik')
INSERT INTO Stanowiska (id, Stanowisko) VALUES (4, 'Pracownik')
GO
INSERT INTO Stanowiska (id, Stanowisko) VALUES (5, 'Brygadzista')
INSERT INTO Stanowiska (id, Stanowisko) VALUES (6, 'Konserwator')
INSERT INTO Stanowiska (id, Stanowisko) VALUES (7, 'Kadrowa')
SET IDENTITY_INSERT Stanowiska OFF
GO
-- miejscowości -> LINKED SERVER MSSQL
INSERT INTO Miejscowości
            (id, Miejscowość)
SELECT       id, Miejscowość
FROM        [MSSQL01.DCSWEB.PL,51433].[1449_isa].[1449_kurs].[Miejscowości]
-- pracownicy -> LINKED SERVER MySQL
SET IDENTITY_INSERT Pracownik ON	
INSERT INTO Pracownik
		(id, Aktywny, Imię, Nazwisko, PESEL, Stanowisko, Miejscowość, DataZatrudnienia)
SELECT   id, 1,       Imię, Nazwisko, PESEL, Stanowisko, Miejscowość, GETDATE()
FROM
(SELECT id, Imię, Nazwisko, PESEL, Stanowisko, Miejscowość, Grupa
  FROM [MSSQL01.DCSWEB.PL,51433].[1449_isa].[1449_kurs].[DanePracowników]
UNION
SELECT id, Imię, Nazwisko, PESEL, Stanowisko, Miejscowość, Grupa
	FROM OPENQUERY
	([MY_MYSQL], 'SELECT * FROM siplus_northwind.DanePracowników')) AS X
SET IDENTITY_INSERT Pracownik OFF	