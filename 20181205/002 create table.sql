USE log_u
GO
CREATE TABLE log_user
(id int IDENTITY(1,1),
Czas datetime DEFAULT GETDATE(),
Operacja tinyint DEFAULT 1,
Opis nvarchar(32) DEFAULT '',
Uwagi nvarchar(255),
StatusOperacji bit DEFAULT 0)
GO
ALTER TABLE log_user 
	ADD U¿ytkownik nvarchar(32)