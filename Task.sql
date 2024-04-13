create view vw_joinStudents
as
select * from Students where[Age] > 25

create view vw_joinStuentsDatasst2
as
select st.FullName as'student',ct.Name as 'City', co.Name 'Country' from Students st
inner join Cities ct
on st.CityId = ct.Id
join Countries co
on ct.CountryId = co.Id

select * from vw_joinStuentsDatasst2


create view vw_joinStudentDatas22
as
select st.FullName as'student',ct.Name as 'City', co.Name 'Country' from Students st
inner join Cities ct
on st.CityId = ct.Id
join Countries co
on ct.CountryId = co.Id

select * from vw_joinStudentDatas22


create function dbo.showWord()
returns nvarchar(25)
as
begin
return 'P418'
end
 select dbo.showWord()

 declare @result nvarchar(25) = (select dbo.showword())
  print @result

create function dbo.showWordWithParametr(@text nvarchar(25))
returns nvarchar(25)
as
begin
return @text
end

select dbo.showWordWithParametr('Aqshin') as 'Name'
select dbo.showWordWithParametr('Ali')
select dbo.showWordWithParametr('Haci')

create function dbo.getStudentsAvgAgeById(@Id int)
returns int
as
begin
 return (select Avg(Age) from Students where [Id]>@Id)
 end
 select dbo.getStudentsAvgAgeById(3)

select * from Students



declare @avgAge = (select dbo.getStudentsAvgAgeById(3))

select * from getStudentsByContition(@avgAge)

create function dbo.getStudentsByContition(@avgAge int)
returns table
as
return (select * from Students where [Age] > @avgAge)



create procedure usp_showText
as
print 'salam'


usp_showText
exec usp_showText


create procedure usp_showTextWithParametr
@text nvarchar(25)
as
print @text

exec usp_showTextWithParametr 'salam'

select * from Students
 
 create procedure usp_deleteStudentbyId
 @Id int
 as
 delete from Students where [Id]=@Id

 exec usp_deleteStudentbyId 4

 select * from Employees

 create procedure usp_deleteEmployeeById
 @Id int
 as
 delete from Employees where [Id]=@Id


 exec usp_deleteEmployeeById 1


 create procedure usp_createEmployee
 @name nvarchar(25),
 @surname nvarchar(25),
 @email nvarchar(125)
 as
 begin
 insert into Employees([Name],[Surname],[Email])
 values (@name,@surname,@email)
 end

 exec usp_createEmployee 'Ali','Huseynov','ali@gmail.com'

select * from Students

create function dbo.getStudentsAvgAge()
returns int
as
begin
 return (select Avg(Age) from Students)
 end

 create procedure usp_deleteStudentsByAge
 as
 begin
 declare @avgAge int = (select dbo.getStudentsAvgAge())
 delete from Students where [Age]>@avgAge

 end
 exec usp_deleteStudentsByAge

