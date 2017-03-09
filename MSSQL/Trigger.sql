create trigger StatistikyI
 ON Student
AFTEr INSERT
as
 begin
  Update Statistiky SET pocetOperaci = pocetOperaci+1 Where operace = 'insert';
 end

 create trigger StatistikyU
 ON statistiky
AFTER update
as
 begin
  Update Statistiky SET pocetOperaci = pocetOperaci+1 Where operace = 'update';
 end

 
 create trigger StatistikyD
 ON statistiky
 
AFTEr delete
as
 begin
  Update Statistiky SET pocetOperaci = pocetOperaci+1 Where operace = 'delete';
 end


 select * from statistiky
insert into Student VALUES('abc124','abc','def','abc@vsb.cz')
select * from Student

drop trigger StatistikyI

 


INSERT INTO statistiky values('insert',0)
INSERT INTO statistiky values('update',0)
INSERT INTO statistiky values('delete',0)
