USE [1449_isa]
GO
	IF EXISTS (SELECT * FROM sys.tables WHERE name = 'DanePracownik�w') DROP TABLE DanePracownik�w
GO
--
CREATE TABLE DanePracownik�w
	(id int,
	Imi� nvarchar(50),
	Nazwisko nvarchar(50),
	PESEL char(11),
	Stanowisko tinyint,
	Miejscowo�� int,
	Grupa char(1))
GO
-- tworzenie tabeli miejscowo�ci
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Miejscowo�ci') DROP TABLE Miejscowo�ci
GO
CREATE TABLE Miejscowo�ci
	(id int,
	Miejscowo�� nvarchar(50))
GO
-- dodawanie miejscowo�ci
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (1, 'Gda�sk')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (2, 'Gdynia')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (3, 'S�upsk')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (4, 'Tczew')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (5, 'Wejherowo')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (6, 'Rumia')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (7, 'Starogard Gda�ski')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (8, 'Chojnice')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (9, 'Malbork')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (10, 'Kwidzyn')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (11, 'Sopot')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (12, 'L�bork')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (13, 'Pruszcz Gda�ski')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (14, 'Reda')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (15, 'Ko�cierzyna')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (16, 'Byt�w')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (17, 'Ustka')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (18, 'Kartuzy')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (19, 'Cz�uch�w')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (20, 'Puck')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (21, 'Miastko')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (22, 'Sztum')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (23, 'W�adys�awowo')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (24, 'Nowy Dw�r Gda�ski')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (25, 'Czersk')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (26, 'Prabuty')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (27, 'Pelplin')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (28, 'Skarszewy')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (29, 'Gniew')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (30, '�ukowo')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (31, 'Czarne')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (32, 'Dzierzgo�')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (33, 'Brusy')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (34, 'Debrzno')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (35, 'Nowy Staw')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (36, '�eba')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (37, 'K�pice')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (38, 'Sk�rcz')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (39, 'Hel')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (40, 'Czarna Woda')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (41, 'Jastarnia')
INSERT INTO Miejscowo�ci (id, Miejscowo��) VALUES (42, 'Krynica Morska')

GO
-- dodawnie pracownik�w
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (1,'Adam','Andrzejewski',2,22,'51113029756','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (2,'Adam','Jankowski',3,33,'34050025768','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (3,'Adam','Jasi�ski',2,31,'18290852638','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (4,'Agata','Gajewska',3,23,'27011272149','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (5,'Agata','Kubiak',2,10,'87132996816','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (6,'Agata','Pawlak',3,15,'93172181382','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (7,'Agata','Wysocka',2,23,'38082183843','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (8,'Agnieszka','Zaj�c',2,34,'28261850286','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (9,'Aleksandra','Szulc',2,25,'15212803321','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (10,'Andrzej','Szewczyk',3,20,'14092159564','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (11,'Andrzej','Zi�kowski',3,5,'86203456861','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (12,'Aneta','Jakubowska',3,22,'88070886861','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (13,'Miros�aw','Czerwi�ski',4,2,'11143044941','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (14,'Piotr','Adamczyk',4,34,'59211430940','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (15,'Robert','W�odarczyk',7,19,'47181161001','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (16,'Sebastian','Chmielewski',5,21,'60073768256','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (17,'Sylwia','Ka�mierczak',6,2,'53213249441','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (18,'Wanda','Czarnecka',7,8,'70100841789','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (19,'Wies�awa','Tomaszewska',4,19,'67122825495','A')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (20,'Anna','Krajewska',3,27,'76060533478','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (21,'Bo�ena','Baranowska',2,30,'93081211428','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (22,'Czes�aw','Wr�bel',3,3,'32011616249','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (23,'Danuta','Piotrowska',2,8,'61280564795','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (24,'Dorota','Maciejewska',3,21,'22181170753','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (25,'Dorota','Tomaszewska',1,39,'63220987456','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (26,'Edward','Szulc',4,27,'21261348965','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (27,'Edyta','Nowakowska',5,29,'27092100700','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (28,'Edyta','Nowicka',7,32,'18110850908','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (29,'Ewa','Duda',4,31,'35143414494','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (30,'Ewelina','Malinowska',7,5,'73061572669','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (31,'Genowefa','Cie�lak',4,20,'36060953474','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (32,'Genowefa','Lis',5,28,'45070554655','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (33,'Gra�yna','G�rska',7,20,'60092500314','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (34,'Gra�yna','Mazur',7,1,'42240608115','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (35,'Grzegorz','Borkowski',5,35,'51183421388','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (36,'Henryk','B�k',4,3,'27060853039','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (37,'Henryk','Kowalski',5,28,'91012440201','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (38,'Irena','W�jcik',6,2,'50270764086','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (39,'Iwona','Urba�ska',4,17,'74061465337','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (40,'Monika','Szewczyk',4,3,'96160310145','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (41,'Piotr','Malinowski',4,28,'62113871972','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (42,'Roman','Kwiatkowski',6,23,'51270371266','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (43,'Stanis�aw','Kowalski',4,2,'41063108620','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (44,'Tomasz','Kucharski',5,1,'44110097291','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (45,'Wanda','Krawczyk',4,37,'61243067461','B')
INSERT INTO DanePracownik�w (id, Imi�, Nazwisko, Stanowisko, Miejscowo��, PESEL, Grupa) VALUES (46,'W�adys�aw','Piotrowski',6,3,'91093606688','B')

