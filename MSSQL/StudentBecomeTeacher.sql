Alter PROCEDURE StudentBecomeTeacher (@p_login CHAR(6)
,@p_departman INT)
as
begin
 begin try
	DEclare @p_fname varchar(30);
	DEclare @p_lname varchar(50);
	DEclare @p_email varchar(50);
  SELECT @p_fname = fname, @p_lname=lname, @p_email = email FROM STUDENT where login = @p_login;
  INSERT INTO Teacher VALUES(@p_login,@p_fname,@p_lname,@p_email,@p_departman,'');
  DELETE FROM Student WHERE @p_login = login;
  Print 'OK';
 end try
 begin catch
  print 'Error'
 end catch
end

exec StudentBecomeTeacher 'nog030',1;
select * from teacher;