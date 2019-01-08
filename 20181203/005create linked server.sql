
EXEC master.dbo.sp_addlinkedserver 
@server = 'MSSQL01.DCSWEB.PL,51433', 
@srvproduct='SQL Server'
EXEC master.dbo.sp_addlinkedsrvlogin 
@rmtsrvname='MSSQL01.DCSWEB.PL,51433',
@useself='False',
@locallogin=NULL,
@rmtuser='1449_kurs',
@rmtpassword='123abcZ!!'


