DECLARE @SQL varchar(1024)
SET @SQL = ''

SELECT @SQL = @SQL + 'Kill ' + Convert(varchar, SPId) + ';'
FROM MASTER..SysProcesses
WHERE DBId = DB_ID('TOASt-Test') AND SPId <> @@SPId
and spid IN (SELECT blocked FROM master.dbo.sysprocesses)

--You can see the kill Processes ID
 
SELECT @SQL
 
--Kill the Processes
 
EXEC(@SQL)
