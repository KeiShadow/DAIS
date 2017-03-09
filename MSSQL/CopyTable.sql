alter procedure CopyTable(@schema VARCHAR(50),@tablename VARCHAR(50))
as
begin
--kopirovani schematu
exec CopyTableStructure @schema, @tablename;

--kopirovani dat
 declare @prikazI NVARCHAR(1000)
 set @prikazI ='Insert INTO '+@tablename+'_old SELECT * from '+@tablename;
 exec sp_executesql @prikazI
 end

 exec CopyTable 'dbo','Student'

 select * from Student_old
 Select *from INFORMATION_SCHEMA.COLUMNS  where TABLE_SCHEMA = 'dbo' and TABLE_NAME = 'Student'
 drop table student_old
