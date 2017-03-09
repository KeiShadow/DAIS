--Kurzor 
create procedure CopyTableStructure(@schema VARCHAR(50),@tablename VARCHAR(50))
as
begin
declare @name VARCHAR(1000)
declare @typ VARCHAR(1000)
declare @Mlength VARCHAR(1000)
declare @prikaz NVARCHAR(1000)
SET @prikaz= 'CREATE TABLE '+@tablename+'_old ('
declare c cursor for
 Select COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH from INFORMATION_SCHEMA.COLUMNS  where TABLE_SCHEMA = @schema and TABLE_NAME = @tablename
 open c
  fetch next from c into @name, @typ,@Mlength
  while @@FETCH_STATUS =0
  begin
	 set @prikaz = @prikaz + @name+' '+ @typ +'('+@Mlength+'), ';
  -- print @name +', '+ @typ+', '+@Mlength
   fetch next from c into @name, @typ,@Mlength
  end  
  close c;
  deallocate c;
   set @prikaz= @prikaz +');'
   print @prikaz;
   exec sp_executesql @prikaz;
 end

 exec CopyTableStructure 'dbo','student'

 select * from _oldstudent;