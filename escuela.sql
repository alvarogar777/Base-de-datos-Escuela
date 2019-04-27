create database escuela
go
use escuela
go
create table Department (
	DepartmentID int primary key,
	Name varchar(50) not null,
	Budget Decimal(10,2) not null,
	StartDate Date not null,
	Administrator int not null
);
go
create table Course(
	CourseID int primary key,
	Title varchar(50) not null,
	Credits int,
	DepartmentID int,
	constraint fk_Department foreign key(DepartmentID) references Department(DepartmentID),
);
go
create table OnlineCourse(
	CourseID int primary key ,
	URL varchar(75) not null,
	constraint fk_CourseOnlineCourse foreign key(CourseID) references Course(CourseID),
);
go
create table OnsiteCourse(
	CourseID int primary key,
	Location varchar(100) not null,
	Days varchar(50),
	Time Datetime,
	constraint fk_CourseOnsiteCourse foreign key(CourseID) references Course(CourseID),
);
go
create table Person(
	PersonId int primary key,
	LastName varchar(100) not null,
	FirstName varchar(100) not null,
	Birthday date,
	EnrollmentDate Datetime,
)
go
create table StudentGrade (
	EnrollmentID int primary key,
	CourseID int not null,
	StudentID int not null,
	Grade int not null,
	constraint fk_CourseStudentGrade foreign key(CourseID) references Course(CourseID),
	constraint fk_PersonStudentGrade foreign key(StudentID) references Person(PersonId),
);
go
create table CourseInstructor(
	CourseID int ,
	PersonID int ,
	primary key(CourseID,PersonID),
	constraint fk_CourseCourseInstructor foreign key(CourseID) references Course(CourseID),
	constraint fk_PersonCourseInstructor foreign key(PersonId) references Person(PersonID)
);
go
create table OfficeAssignment(
	InstructorID int primary key,
	Location varchar(100),
	Timestamp Datetime,
	constraint fk_PersonOfficeAssignment foreign key(InstructorId) references Person(PersonID),
);

