USE [master]
GO
/****** Object:  Database [ams]    Script Date: 16-06-2022 2.20.52 PM ******/
CREATE DATABASE [ams]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ams', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ams.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ams_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ams_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ams] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ams].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ams] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ams] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ams] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ams] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ams] SET ARITHABORT OFF 
GO
ALTER DATABASE [ams] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ams] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ams] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ams] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ams] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ams] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ams] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ams] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ams] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ams] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ams] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ams] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ams] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ams] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ams] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ams] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ams] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ams] SET RECOVERY FULL 
GO
ALTER DATABASE [ams] SET  MULTI_USER 
GO
ALTER DATABASE [ams] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ams] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ams] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ams] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ams] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ams] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ams', N'ON'
GO
ALTER DATABASE [ams] SET QUERY_STORE = OFF
GO
USE [ams]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Attendance_id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_id] [varchar](15) NOT NULL,
	[Date] [date] NULL,
	[loginTime] [datetime] NULL,
	[logoutTime] [datetime] NULL,
	[leaveId] [int] NULL,
	[AttendanceStatus] [nchar](1) NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[Attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpId] [varchar](15) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[SupervisorId] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[leave]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leave](
	[leaveId] [int] IDENTITY(1,1) NOT NULL,
	[empId] [varchar](15) NULL,
	[leave_apply_date] [date] NULL,
	[leave_start_date] [date] NULL,
	[num_leave_days] [int] NULL,
	[leave_reason] [varchar](200) NULL,
	[leave_status_id] [int] NULL,
 CONSTRAINT [PK_leave] PRIMARY KEY CLUSTERED 
(
	[leaveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[leave_status]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[leave_status](
	[leave_status_id] [int] NOT NULL,
	[leave_status] [varchar](10) NULL,
 CONSTRAINT [PK_leave_status] PRIMARY KEY CLUSTERED 
(
	[leave_status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[userId] [varchar](15) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[userTypeId] [int] NOT NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_type]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_type](
	[userTypeId] [int] NOT NULL,
	[userType] [varchar](20) NULL,
 CONSTRAINT [PK_user_type] PRIMARY KEY CLUSTERED 
(
	[userTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[applyLeave]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[applyLeave]
@empId varchar(15), @leaveStartDate date,
@num_leave_days int, @leave_reason varchar(200)
as
begin
	declare @leaveApplyDate date;
	set @leaveApplyDate = GETDATE();
	insert into leave (empId, leave_apply_date, leave_start_date, num_leave_days, leave_reason, leave_status_id)
	values (@empId, @leaveApplyDate, @leaveStartDate, @num_leave_days, @leave_reason, 0);
end
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[createUser]
@userId varchar(15), @pswd varchar(20), @userTypeId int
as
begin
	declare @n int, @m int;
	set @n = (select COUNT(userId) from login where userId = @userId);
	set @m = (select count(e.EmpId) from Employee e where e.EmpId = @userId)
	--Insertion can`t be done of non existing employee and the employee who is allready in login table
	if(@n =0 and @m = 1)
	begin
		insert into login values(@userId, @pswd, @userTypeId);
	end
end
GO
/****** Object:  StoredProcedure [dbo].[dayAndHolidayInMonth]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dayAndHolidayInMonth]
@year varchar(4), @month varchar(2)
as
begin
	declare  @weekends int, @days int;
	set @weekends = 0;
	DECLARE @DATE DATE = @year + '-' + @month + '-01'
	declare @numOfDays int;
	if(MONTH(GETDATE()) = @month and YEAR(GETDATE()) = @year)
		begin
			set @numOfDays = DAY(GETDATE())
		end
	else
		begin
			set @numOfDays = DAY(DATEADD(ms,-2,DATEADD(MONTH, DATEDIFF(MONTH,0,@DATE)+1,0)))
		end
	set @days = @numOfDays
	while(@numOfDays > 0)
	BEGIN
		if(DATEPART(WEEKDAY, @DATE) = 1 or DATEPART(WEEKDAY, @DATE) = 7)
		begin
			set @weekends += 1
		end
		set @DATE = DATEADD(DAY, 1, @DATE)
		set @numOfDays = @numOfDays - 1
	END
	select @days as 'days', @weekends as 'weekends'
end
GO
/****** Object:  StoredProcedure [dbo].[daysAndHolidaysFromCurrDate]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[daysAndHolidaysFromCurrDate]
@empId varchar(15)
as
begin
declare @startDate date, @days int, @holidays int, @tDays int;

set @startDate = (select Top(1) date from Attendance
where Employee_id = @empId
order by Date);

set @days = (select datediff(day, @startDate, getDate()));
set @tDays = @days;
set @holidays = 0;
while(@days > 0)
begin
	if (datepart(weekday, @startDate) = 1 or DATEPART(WEEKDAY, @startDate) = 7)
	begin
		set @holidays += 1
	end
	set @startDate = DATEADD(day, 1, @startDate);
	set @days -= 1;
end
if(@tDays is null)
begin
	set @tDays = 0;
end

select @tDays as TotalDays, @holidays as Holidays;
end
GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[deleteUser]
@userId varchar(15)
as
begin
	delete from login
	where userId = @userId
end
GO
/****** Object:  StoredProcedure [dbo].[doLogin]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Login SP
CREATE proc [dbo].[doLogin]
@empId varchar(15)
as
begin
	declare @currDate date, @currTime time, @attendance_stat nchar(1);
	set @currDate = GETDATE();
	set @currTime = (select CAST(SYSDATETIME() AS TIME));
	set @attendance_stat =( select atd.AttendanceStatus from Attendance atd 
						   where atd.Date = @currDate and atd.Employee_id = @empId);
	print(@attendance_stat);
	if(@attendance_stat is NULL)
		begin
			insert into Attendance (Employee_id, Date, loginTime, AttendanceStatus)
			values(@empId, @currDate, @currTime, 'i');
		end
end
GO
/****** Object:  StoredProcedure [dbo].[doLogout]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[doLogout]
@empId varchar(15)
as
begin
	declare @currDate date, @currTime time, @attendance_stat nchar(1);
	set @currDate = GETDATE();
	set @currTime = CURRENT_TIMESTAMP;

	set @attendance_stat =( select atd.AttendanceStatus from Attendance atd 
						   where atd.Date = @currDate and atd.Employee_id = @empId);
	print(@attendance_stat);
	if(@attendance_stat = 'i')
		begin
			update Attendance 
			set logoutTime = @currTime, AttendanceStatus = 'p'
			where Date = @currDate and Employee_id = @empId;
		end
end
GO
/****** Object:  StoredProcedure [dbo].[getAllEmp]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllEmp]
as
begin
	select * from Employee;
end
GO
/****** Object:  StoredProcedure [dbo].[getAllEmployeeAttendanceReport]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllEmployeeAttendanceReport]
@year varchar(4), @month varchar(2)
as
begin
	select e.EmpId,(e.FirstName +' ' + e.LastName) as 'Name', a.present, b.leave from
	(select atd.Employee_id as 'empId',  COUNT(atd.AttendanceStatus) as 'present'
		from Attendance atd
		where atd.AttendanceStatus = 'p' and MONTH(atd.Date) = @month and YEAR(atd.Date) = @year
		group by atd.Employee_id) a
	full outer join
	(
	select atd.Employee_id as 'empId',  COUNT(atd.AttendanceStatus) as 'leave'
		from Attendance atd
		where atd.AttendanceStatus = 'l' and MONTH(atd.Date) = @month and YEAR(atd.Date) = @year and atd.Date <= GETDATE()
		group by atd.Employee_id
	) b
	on a.empId = b.empId
	right join Employee e on e.EmpId = a.empId
end
GO
/****** Object:  StoredProcedure [dbo].[getAllLeave]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllLeave]
as
begin
	select l.leaveId, l.empId,(e.FirstName + ' ' + e.LastName ) as 'Name', l.leave_apply_date, l.leave_start_date, l.num_leave_days, l.leave_reason, ls.leave_status 
	from leave l
	inner join leave_status ls on ls.leave_status_id = l.leave_status_id
	inner join Employee e on e.EmpId = l.empId
	order by ls.leave_status_id;
	
end
GO
/****** Object:  StoredProcedure [dbo].[getAllLoginData]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllLoginData]
as
begin
	select l.userId, (e.FirstName + ' ' + e.LastName) as 'name',l.userTypeId from login l
	inner join 
	Employee e on l.userId = e.EmpId;
end
GO
/****** Object:  StoredProcedure [dbo].[getCurrMonthEmployeeData]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getCurrMonthEmployeeData]
@empId varchar(15),  @year int, @month int
as
begin
declare @presentDays int, @workDuration int, @name varchar(30), @supervisorId varchar(15), @leaveDays int;


set @name = ( select (e.FirstName + ' ' + e.LastName) as 'Name'  from Employee e where e.EmpId = @empId);
set @supervisorId = (select SupervisorId from Employee where EmpId = @empId);



set @workDuration =  (select  sum(datediff(minute, loginTime, logoutTime)) as 'duration'  from Attendance a
where a.Employee_id = @empId and a.AttendanceStatus = 'p' and @month = MONTH(a.Date)  and @year = YEAR(a.Date));
if(@workDuration is null)
	set @workDuration = 0;

set @presentDays =(select count(a.Attendance_id) as present from Attendance a
where a.Employee_id = @empId and a.AttendanceStatus = 'p' and @month = MONTH(a.Date)  and @year = YEAR(a.Date));

set @leaveDays =(select count(a.Attendance_id) as present from Attendance a
where a.Employee_id = @empId and a.AttendanceStatus = 'l' and @month = MONTH(a.Date)  and @year = YEAR(a.Date) and Date <= GETDATE());

select @name as name, @supervisorId as supervisorId, @workDuration as workDuration, @presentDays as present, @leaveDays as leave;
end
GO
/****** Object:  StoredProcedure [dbo].[getEmployeeData]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getEmployeeData]
@empId varchar(15)
as
begin
declare @presentDays int, @workDuration int, @name varchar(30), @supervisorId varchar(15), @leaveDays int;


set @name = ( select (e.FirstName + ' ' + e.LastName) as 'Name'  from Employee e where e.EmpId = @empId);
set @supervisorId = (select SupervisorId from Employee where EmpId = @empId);



set @workDuration =  (select  sum(datediff(minute, loginTime, logoutTime)) as 'duration'  from Attendance a
where a.Employee_id = @empId and a.AttendanceStatus = 'p');

set @presentDays =(select count(a.Attendance_id) as present from Attendance a
where a.Employee_id = @empId and a.AttendanceStatus = 'p');

set @leaveDays =(select count(a.Attendance_id) as present from Attendance a
where a.Employee_id = @empId and a.AttendanceStatus = 'l');

if(@workDuration is null)
begin
	set @workDuration = 0;
end
select @name as name, @supervisorId as supervisorId, @workDuration as workDuration, @presentDays as present, @leaveDays as leave;
end
GO
/****** Object:  StoredProcedure [dbo].[getLast30DayPendingLeave]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getLast30DayPendingLeave]
as
begin
	select e.EmpId,(e.FirstName + ' ' + e.LastName) as 'Name',l.leave_apply_date,l.leave_start_date,l.num_leave_days,l.leave_reason 
	from leave l
	right join Employee e on e.EmpId = l.empId
	where l.leave_status_id = 0 and (l.leave_apply_date between  DATEADD(day, -30, GETDATE()) and GETDATE());
end
GO
/****** Object:  StoredProcedure [dbo].[getLoginData]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getLoginData]
@userId varchar(15)
as
begin
	select * from login
	where login.userId = @userId;
end
GO
/****** Object:  StoredProcedure [dbo].[getTodayAttendance]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getTodayAttendance]
as
begin
	select e.EmpId,(e.FirstName + ' ' + e.LastName) AS 'Name', a.loginTime, a.logoutTime,  a.AttendanceStatus 
	from (select a.Employee_id, a.loginTime, a.logoutTime, a.AttendanceStatus 
	from Attendance a where CONVERT(VARCHAR(10), a.Date, 103) = CONVERT(VARCHAR(10), getdate(), 103)) a
right join
login l on l.userId = a.Employee_id
right join Employee e on e.EmpId = a.Employee_id
ORDER BY a.AttendanceStatus desc  
end
GO
/****** Object:  StoredProcedure [dbo].[manageLeave]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[manageLeave]
@leaveId int, @leaveStatus int, @empId varchar(15)
as
begin
	update leave
	set leave_status_id = @leaveStatus
	where leaveId = @leaveId;
	if( @leaveStatus = 1)
		begin
			declare @numDays int, @startDate date;
			set @startDate = (select l.leave_start_date from leave l
							  where l.leaveId = @leaveId
							)
			set @numDays = (select l.num_leave_days from leave l
							  where l.leaveId = @leaveId
							)
			while (@numDays >= 1)
				begin
					if(datepart(weekday, @startdate) != 1 and datepart(weekday, @startdate) != 7)
					begin
						insert into Attendance (Employee_id, Date, AttendanceStatus, leaveId)
						values (@empId, @startDate, 'l', @leaveId);
					end
					set @startDate = DATEADD(day,1,@startdate);
					set @numDays = @numDays - 1;
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[testPresentLeave]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[testPresentLeave]
as
begin
	declare @tmpPresent table
	(
		empId varchar(15),
		present int
	)

	declare @tmpLeave table
	(
		empId varchar(15),
		leave int
	)

	select atd.Employee_id as 'empId',  COUNT(atd.AttendanceStatus) as 'present'
	into tmpPresent
	from Attendance atd
	where atd.AttendanceStatus = 'p' and MONTH(atd.Date) = MONTH(GETDATE())
	group by atd.Employee_id;

	select atd.Employee_id as 'empId',  COUNT(atd.AttendanceStatus) as 'present'
	into tmpLeave
	from Attendance atd
	where atd.AttendanceStatus = 'l' and MONTH(atd.Date) = MONTH(GETDATE())
	group by atd.Employee_id;

	select tmpPresent.empId, tmpPresent.present, tmpLeave.leave from 
	tmpPresent full outer join tmpLeave on tmpPresent.empId = tmpLeave.empId;
end
GO
/****** Object:  StoredProcedure [dbo].[updateUser]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateUser]
@userId varchar(15), @pswd varchar(20), @userTypeId int
as
begin
	update login
	set password = @pswd, userTypeId = @userTypeId
	where userId = @userId;
end
GO
/****** Object:  StoredProcedure [dbo].[viewAtdReport]    Script Date: 16-06-2022 2.20.52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[viewAtdReport]
@empId varchar(15), @year int, @month int
as
begin
	declare @currMonth int;
	set @currMonth = MONTH(GETDATE());
	select * from Attendance
	where Employee_id = @empId and MONTH(Date) = @month and YEAR(Date) = @year;
end
GO
USE [master]
GO
ALTER DATABASE [ams] SET  READ_WRITE 
GO
