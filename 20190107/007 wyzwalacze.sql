CREATE Database Wyzwalacze
GO
USE Wyzwalacze
CREATE TABLE Pracownicy
(id int IDENTITY(1,1),
Imi� nvarchar(50),
Nazwisko nvarchar(50))
GO
CREATE TABLE MyLog
(id int IDENTITY(1,1),
Opis nvarchar(50),
Czas datetime DEFAULT GETDATE())
GO
CREATE PROCEDURE PracownikDodaj
@imi� nvarchar(50),
@nazwisko nvarchar(50)
AS
INSERT INTO Pracownicy (Imi�, Nazwisko) VALUES (@imi�, @nazwisko)
GO
CREATE PROCEDURE LogDodaj
@opis nvarchar(50)
AS
INSERT INTO MyLog (Opis) VALUES (@opis)
GO
EXEC PracownikDodaj @imi� = 'Jan', @nazwisko =  'Kowalski'
EXEC PracownikDodaj @imi� = 'Anna', @nazwisko =  'Nowak'
EXEC PracownikDodaj @imi� = 'Maria', @nazwisko =  'Kowalska'
GO
-- wyzwalacz reaguj�cy na INSERT
CREATE TRIGGER ObserwatorIN
	ON Pracownicy
	FOR INSERT
AS
EXEC LogDodaj 'Co� si� doda�o'
GO
EXEC PracownikDodaj @imi� = 'Tadeusz', @nazwisko =  'Zet'
GO
-- wyzwalacz reaguj�cy na INSERT
CREATE TRIGGER ObserwatorUP
	ON Pracownicy
	FOR UPDATE
AS
EXEC LogDodaj 'Co� si� zaktualizowa�o'
GO
UPDATE Pracownicy SET Nazwisko = 'Ziet' WHERE Imi� = 'Tadeusz'
GO
-- wyzwalacz reaguj�cy na DELETE
CREATE TRIGGER ObserwatorDEL
	ON Pracownicy
	FOR DELETE
AS
EXEC LogDodaj 'Co� si� skasowa�o'
GO
DELETE FROM Pracownicy WHERE Nazwisko = 'Ziet'
GO
-- TRIGGER - obej�cie dla SELECTA
CREATE PROCEDURE RejestracjaSELECTa
AS
SELECT * FROM Pracownicy
EXEC LogDodaj 'Co� si� odczyta�o'
GO
EXEC RejestracjaSELECTa
