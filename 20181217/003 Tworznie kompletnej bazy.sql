-- tworzenie bazy danych - wszystko z bazy MASTER
USE master
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'praca')
	BEGIN
		-- przej�cie bazy na wy��czno�� i usuni�cie
		ALTER DATABASE Praca SET SINGLE_USER WITH ROLLBACK IMMEDIATE
		DROP DATABASE Praca
	END
CREATE DATABASE Praca

USE Praca

CREATE TABLE Pracownik
(id int IDENTITY(1,1) NOT NULL,
Aktywny bit DEFAULT 1,
Imi� nvarchar(50),
Nazwisko nvarchar(50),
PESEL char(11) UNIQUE,
Miejscowo�� int DEFAULT 1,
DataUrodzenia date,
DataZatrudnienia date DEFAULT Getdate(),
Stanowisko int DEFAULT 1 NOT NULL)
GO
CREATE TABLE Stanowiska
(id int IDENTITY (1,1),
Stanowisko nvarchar(50))
GO
CREATE TABLE Miejscowo�ci
(id int NOT NULL,
Miejscowo�� nvarchar(50))
GO
-- kontrola poprawno�ci danych
ALTER TABLE Pracownik
	WITH CHECK ADD CONSTRAINT S_DataZatrudnienia CHECK (DataZatrudnienia <= getdate())
GO
	-- SELECT * FROM sys.check_constraints -- istniej�ce CHECKi
ALTER TABLE Pracownik
	WITH CHECK ADD CONSTRAINT ck_PracownikPesel
	CHECK (PESEL like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
-- relacje - nadanie PK
ALTER TABLE Pracownik ADD CONSTRAINT
	PK_Pracownik PRIMARY KEY (id)
ALTER TABLE Stanowiska ADD CONSTRAINT
	PK_Stanowiska PRIMARY KEY (id)
ALTER TABLE Miejscowo�ci ADD CONSTRAINT
	PK_Miejscowo�ci PRIMARY KEY (id)
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
	FK_Pracownik_Miejscowo�ci FOREIGN KEY
	(Miejscowo��) REFERENCES Miejscowo�ci (id)
	ON UPDATE No ACTION
	ON DELETE No ACTION
-- BACKUP
BACKUP DATABASE Praca TO DISK ='praca_kopia.bak'
-- dodawanie rekord�w
-- kolejno�� dodawania !
