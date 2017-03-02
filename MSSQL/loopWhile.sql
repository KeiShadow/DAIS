Alter procedure loopWhile
as 
begin
 Declare @i INT;
 SET @i = 1;
 while @i <=10
  Begin
   print @i;
   SET @i = @i + 1;
  end
end

exec loopWhile;