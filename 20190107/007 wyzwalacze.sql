CREATE Database Wyzwalacze
GO
USE Wyzwalacze
CREATE TABLE Pracownicy
(id int IDENTITY(1,1),
Imiê nvarchar(50),
Nazwisko nvarchar(50))
GO
CREATE TABLE MyLog
(id int IDENTITY(1,1),
Opis nvarchar(50),
Czas datetime DEFAULT GETDATE())
GO
CREATE PROCEDURE PracownikDodaj
@imiê nvarchar(50),
@nazwisko nvarchar(50)
AS
INSERT INTO Pracownicy (Imiê, Nazwisko) VALUES (@imiê, @nazwisko)
GO
CREATE PROCEDURE LogDodaj
@opis nvarchar(50)
AS
INSERT INTO MyLog (Opis) VALUES (@opis)
GO
EXEC PracownikDodaj @imiê = 'Jan', @nazwisko =  'Kowalski'
EXEC PracownikDodaj @imiê = 'Anna', @nazwisko =  'Nowak'
EXEC PracownikDodaj @imiê = 'Maria', @nazwisko =  'Kowalska'
GO
-- wyzwalacz reaguj¹cy na INSERT
CREATE TRIGGER ObserwatorIN
	ON Pracownicy
	FOR INSERT
AS
EXEC LogDodaj 'Coœ siê doda³o'
GO
EXEC PracownikDodaj @imiê = 'Tadeusz', @nazwisko =  'Zet'
GO
-- wyzwalacz reaguj¹cy na INSERT
CREATE TRIGGER ObserwatorUP
	ON Pracownicy
	FOR UPDATE
AS
EXEC LogDodaj 'Coœ siê zaktualizowa³o'
GO
UPDATE Pracownicy SET Nazwisko = 'Ziet' WHERE Imiê = 'Tadeusz'
GO
-- wyzwalacz reaguj¹cy na DELETE
CREATE TRIGGER ObserwatorDEL
	ON Pracownicy
	FOR DELETE
AS
EXEC LogDodaj 'Coœ siê skasowa³o'
GO
DELETE FROM Pracownicy WHERE Nazwisko = 'Ziet'
GO
-- TRIGGER - obejœcie dla SELECTA
CREATE PROCEDURE RejestracjaSELECTa
AS
SELECT * FROM Pracownicy
EXEC LogDodaj 'Coœ siê odczyta³o'
GO
EXEC RejestracjaSELECTa
