alter procedure AddStudent(
@p_login char(6),
@p_fname varchar(30),
@p_lname varchar(50),
@p_email varchar(50))
as
begin
 begin try
  insert into Student VALUES(@p_login,@p_fname,@p_lname,@p_email);
  print 'Student se jmenem '+ @p_fname + ' byl pridan';
  
 end try
 begin catch
  print 'Student se jmenem '+@p_fname + ' jiz v tabulce existuje';
 end catch
end

exec AddStudent 'nog030','Petr','Noga','nog0030@vsb.cz';

select * from Student
