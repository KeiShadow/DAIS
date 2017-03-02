alter procedure PAddStudent(
@p_login char(6),
@p_fname varchar(30),
@p_lname varchar(50),
@p_email varchar(50))
as
begin
 begin try
 Declare @p_try varchar(50);
 SET @p_try='ok';
  insert into Student VALUES(@p_login,@p_fname,@p_lname,@p_email);
  print @p_try;
  
 end try
 begin catch
  SET @p_try='Error';
  print @p_try;
 end catch
end

exec PAddStudent 'nog030','Petr','Noga','nog0030@vsb.cz';

select * from Student
