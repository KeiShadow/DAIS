CREATE TABLE Student2 (
login CHAR(6) PRIMARY KEY,
fname VARCHAR(30) NOT NULL,
lname VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
tallness INT NOT NULL);Alter procedure AddStudent2(
@p_fname varchar (30),
@p_lname varchar(50),
@p_tallness varchar (50))
as
begin
 begin try
  Declare @new_login char(6);
  Declare @p_Email varchar(50);
  SET @new_login = SUBSTRING(@p_lname,1,3)+'000';
  SET @p_Email = @new_login+'@vsb.cz';

  insert into Student2 VALUES(@new_login,@p_fname,@p_lname,@p_Email, @p_tallness);
  print 'Student se jmenem '+ @p_fname + ' byl pridan';
  
 end try
 begin catch
  print 'chyba';
 end catch
end

exec AddStudent2 'petr','noga',1;


select * from Student2
