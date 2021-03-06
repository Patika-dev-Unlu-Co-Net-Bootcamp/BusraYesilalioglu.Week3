USE [master]
GO
/****** Object:  Database [patika_dev]    Script Date: 27.01.2022 13:15:35 ******/
CREATE DATABASE [patika_dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'patika_dev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\patika_dev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'patika_dev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\patika_dev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [patika_dev] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [patika_dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [patika_dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [patika_dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [patika_dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [patika_dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [patika_dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [patika_dev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [patika_dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [patika_dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [patika_dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [patika_dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [patika_dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [patika_dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [patika_dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [patika_dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [patika_dev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [patika_dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [patika_dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [patika_dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [patika_dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [patika_dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [patika_dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [patika_dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [patika_dev] SET RECOVERY FULL 
GO
ALTER DATABASE [patika_dev] SET  MULTI_USER 
GO
ALTER DATABASE [patika_dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [patika_dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [patika_dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [patika_dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [patika_dev] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'patika_dev', N'ON'
GO
ALTER DATABASE [patika_dev] SET QUERY_STORE = OFF
GO
USE [patika_dev]
GO
/****** Object:  UserDefinedFunction [dbo].[haftaTopla]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[haftaTopla](@hafta1 int,@hafta2 int,@hafta3 int,@hafta4 int,@hafta5 int,@hafta6 int,@hafta7 int)
returns int
as
begin
declare @toplam int
set @toplam=@hafta1+@hafta2+@hafta3+@hafta4
return @toplam

end
GO
/****** Object:  Table [dbo].[education_students]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[education_students](
	[id] [int] NOT NULL,
	[education_id] [int] NULL,
	[student_id] [int] NOT NULL,
 CONSTRAINT [PK_egitim_ogrencileri] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[student_id] [int] NOT NULL,
	[student_name] [varchar](15) NULL,
	[student_surname] [varchar](20) NULL,
 CONSTRAINT [PK_ogrenciler] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[education]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[education](
	[education_id] [int] NOT NULL,
	[education_name] [varchar](15) NULL,
	[assistant_id] [int] NULL,
	[teacher_id] [int] NULL,
	[participant_id] [int] NULL,
 CONSTRAINT [PK_egitimler] PRIMARY KEY CLUSTERED 
(
	[education_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_students_group_education]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_students_group_education]
AS
SELECT TOP (100) PERCENT dbo.education.education_name, dbo.students.student_name, dbo.students.student_surname, dbo.education_students.education_id
FROM     dbo.students INNER JOIN
                  dbo.education_students ON dbo.students.student_id = dbo.education_students.student_id INNER JOIN
                  dbo.education ON dbo.education.education_id = dbo.education_students.education_id
GROUP BY dbo.education_students.education_id, dbo.students.student_name, dbo.students.student_surname, dbo.education.education_name
ORDER BY dbo.education.education_name
GO
/****** Object:  Table [dbo].[assistants]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assistants](
	[assistant_id] [int] NOT NULL,
	[assistant_name] [varchar](15) NULL,
	[assistant_surname] [varchar](20) NULL,
 CONSTRAINT [PK_asistanlar] PRIMARY KEY CLUSTERED 
(
	[assistant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attendance]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance](
	[attendance_id] [int] NOT NULL,
	[student_id] [int] NULL,
	[attendance_8week] [float] NULL,
	[success_id] [int] NULL,
 CONSTRAINT [PK_yoklama_egitim] PRIMARY KEY CLUSTERED 
(
	[attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[participant]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[participant](
	[participant_id] [int] NOT NULL,
	[participant_name] [varchar](15) NULL,
	[participant_surname] [varchar](20) NULL,
 CONSTRAINT [PK_katilimcilar] PRIMARY KEY CLUSTERED 
(
	[participant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[success]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[success](
	[success_id] [int] NOT NULL,
	[success_status] [float] NULL,
	[student_id] [int] NOT NULL,
 CONSTRAINT [PK_basari_1] PRIMARY KEY CLUSTERED 
(
	[success_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teachers]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teachers](
	[teacher_id] [int] NOT NULL,
	[teacher_name] [varchar](15) NULL,
	[teacher_surname] [varchar](20) NULL,
 CONSTRAINT [PK_egitmenler] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[assistants] ([assistant_id], [assistant_name], [assistant_surname]) VALUES (1, N'Yakup', N'Alacalı')
INSERT [dbo].[assistants] ([assistant_id], [assistant_name], [assistant_surname]) VALUES (2, N'Ali Mert', N'Tost')
INSERT [dbo].[assistants] ([assistant_id], [assistant_name], [assistant_surname]) VALUES (3, N'Murat', N'Büyük')
INSERT [dbo].[assistants] ([assistant_id], [assistant_name], [assistant_surname]) VALUES (4, N'Enes', N'Hasdemir')
INSERT [dbo].[assistants] ([assistant_id], [assistant_name], [assistant_surname]) VALUES (5, N'Anıl', N'Kılıç')
INSERT [dbo].[assistants] ([assistant_id], [assistant_name], [assistant_surname]) VALUES (6, N'Yağmur', N'Neşe')
INSERT [dbo].[assistants] ([assistant_id], [assistant_name], [assistant_surname]) VALUES (7, N'Beren', N'Yıldız')
INSERT [dbo].[assistants] ([assistant_id], [assistant_name], [assistant_surname]) VALUES (8, N'Betül', N'Güneş')
INSERT [dbo].[attendance] ([attendance_id], [student_id], [attendance_8week], [success_id]) VALUES (1, 1, 1, 1)
INSERT [dbo].[attendance] ([attendance_id], [student_id], [attendance_8week], [success_id]) VALUES (2, 2, 8, 2)
INSERT [dbo].[attendance] ([attendance_id], [student_id], [attendance_8week], [success_id]) VALUES (3, 3, 5, 3)
INSERT [dbo].[attendance] ([attendance_id], [student_id], [attendance_8week], [success_id]) VALUES (4, 4, 6, 4)
INSERT [dbo].[attendance] ([attendance_id], [student_id], [attendance_8week], [success_id]) VALUES (5, 5, 7, 5)
INSERT [dbo].[attendance] ([attendance_id], [student_id], [attendance_8week], [success_id]) VALUES (6, 6, 4, 6)
INSERT [dbo].[attendance] ([attendance_id], [student_id], [attendance_8week], [success_id]) VALUES (7, 8, 2, 7)
INSERT [dbo].[education] ([education_id], [education_name], [assistant_id], [teacher_id], [participant_id]) VALUES (1, N'React', 2, 1, 5)
INSERT [dbo].[education] ([education_id], [education_name], [assistant_id], [teacher_id], [participant_id]) VALUES (2, N'.Net', 3, 2, 4)
INSERT [dbo].[education] ([education_id], [education_name], [assistant_id], [teacher_id], [participant_id]) VALUES (3, N'Java', 4, 3, 3)
INSERT [dbo].[education] ([education_id], [education_name], [assistant_id], [teacher_id], [participant_id]) VALUES (4, N'CSS', 5, 4, 2)
INSERT [dbo].[education] ([education_id], [education_name], [assistant_id], [teacher_id], [participant_id]) VALUES (5, N'GIT', 6, 5, 1)
INSERT [dbo].[education] ([education_id], [education_name], [assistant_id], [teacher_id], [participant_id]) VALUES (6, N'JavaScript', 1, 6, 5)
INSERT [dbo].[education_students] ([id], [education_id], [student_id]) VALUES (1, 5, 3)
INSERT [dbo].[education_students] ([id], [education_id], [student_id]) VALUES (2, 2, 5)
INSERT [dbo].[education_students] ([id], [education_id], [student_id]) VALUES (3, 6, 1)
INSERT [dbo].[education_students] ([id], [education_id], [student_id]) VALUES (4, 1, 4)
INSERT [dbo].[education_students] ([id], [education_id], [student_id]) VALUES (5, 4, 2)
INSERT [dbo].[education_students] ([id], [education_id], [student_id]) VALUES (6, 3, 6)
INSERT [dbo].[education_students] ([id], [education_id], [student_id]) VALUES (7, 2, 7)
INSERT [dbo].[education_students] ([id], [education_id], [student_id]) VALUES (8, 1, 8)
INSERT [dbo].[participant] ([participant_id], [participant_name], [participant_surname]) VALUES (1, N'Gürkan', N'Yazar')
INSERT [dbo].[participant] ([participant_id], [participant_name], [participant_surname]) VALUES (2, N'Gülcan', N'Koşar')
INSERT [dbo].[participant] ([participant_id], [participant_name], [participant_surname]) VALUES (3, N'Yılmaz', N'Yıldı')
INSERT [dbo].[participant] ([participant_id], [participant_name], [participant_surname]) VALUES (4, N'Esma', N'Yılmaz')
INSERT [dbo].[participant] ([participant_id], [participant_name], [participant_surname]) VALUES (5, N'Nihal', N'Sorar')
INSERT [dbo].[participant] ([participant_id], [participant_name], [participant_surname]) VALUES (6, N'Sude', N'Kule')
INSERT [dbo].[students] ([student_id], [student_name], [student_surname]) VALUES (1, N'Aslan', N'Deniz')
INSERT [dbo].[students] ([student_id], [student_name], [student_surname]) VALUES (2, N'Ayşe', N'Atar')
INSERT [dbo].[students] ([student_id], [student_name], [student_surname]) VALUES (3, N'Ahmet', N'Tutar')
INSERT [dbo].[students] ([student_id], [student_name], [student_surname]) VALUES (4, N'Berk', N'Sever')
INSERT [dbo].[students] ([student_id], [student_name], [student_surname]) VALUES (5, N'Rüya', N'Kaçar')
INSERT [dbo].[students] ([student_id], [student_name], [student_surname]) VALUES (6, N'Cengiz', N'Mert')
INSERT [dbo].[students] ([student_id], [student_name], [student_surname]) VALUES (7, N'Pamir', N'Uykucu')
INSERT [dbo].[students] ([student_id], [student_name], [student_surname]) VALUES (8, N'Mia', N'Black')
INSERT [dbo].[success] ([success_id], [success_status], [student_id]) VALUES (1, 12.5, 1)
INSERT [dbo].[success] ([success_id], [success_status], [student_id]) VALUES (2, 100, 2)
INSERT [dbo].[success] ([success_id], [success_status], [student_id]) VALUES (3, 62.5, 3)
INSERT [dbo].[success] ([success_id], [success_status], [student_id]) VALUES (4, 75, 4)
INSERT [dbo].[success] ([success_id], [success_status], [student_id]) VALUES (5, 87.5, 5)
INSERT [dbo].[success] ([success_id], [success_status], [student_id]) VALUES (6, 50, 6)
INSERT [dbo].[success] ([success_id], [success_status], [student_id]) VALUES (7, 25, 8)
INSERT [dbo].[teachers] ([teacher_id], [teacher_name], [teacher_surname]) VALUES (1, N'Tarık', N'Sertel')
INSERT [dbo].[teachers] ([teacher_id], [teacher_name], [teacher_surname]) VALUES (2, N'Necati', N'Özay')
INSERT [dbo].[teachers] ([teacher_id], [teacher_name], [teacher_surname]) VALUES (3, N'Nazan', N'Yaman')
INSERT [dbo].[teachers] ([teacher_id], [teacher_name], [teacher_surname]) VALUES (4, N'Özlem', N'Çağlar')
INSERT [dbo].[teachers] ([teacher_id], [teacher_name], [teacher_surname]) VALUES (5, N'Elif', N'Kalkan')
INSERT [dbo].[teachers] ([teacher_id], [teacher_name], [teacher_surname]) VALUES (6, N'Mehmet', N'Aydın')
INSERT [dbo].[teachers] ([teacher_id], [teacher_name], [teacher_surname]) VALUES (7, N'Yıldız', N'Deniz')
INSERT [dbo].[teachers] ([teacher_id], [teacher_name], [teacher_surname]) VALUES (8, N'Mustafa', N'Kemik')
ALTER TABLE [dbo].[attendance]  WITH CHECK ADD  CONSTRAINT [FK_yoklama_egitim_basari] FOREIGN KEY([success_id])
REFERENCES [dbo].[success] ([success_id])
GO
ALTER TABLE [dbo].[attendance] CHECK CONSTRAINT [FK_yoklama_egitim_basari]
GO
ALTER TABLE [dbo].[attendance]  WITH CHECK ADD  CONSTRAINT [FK_yoklama_egitim_ogrenciler] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([student_id])
GO
ALTER TABLE [dbo].[attendance] CHECK CONSTRAINT [FK_yoklama_egitim_ogrenciler]
GO
ALTER TABLE [dbo].[education]  WITH CHECK ADD  CONSTRAINT [FK_education_assistants] FOREIGN KEY([assistant_id])
REFERENCES [dbo].[assistants] ([assistant_id])
GO
ALTER TABLE [dbo].[education] CHECK CONSTRAINT [FK_education_assistants]
GO
ALTER TABLE [dbo].[education]  WITH CHECK ADD  CONSTRAINT [FK_egitimler_egitmenler] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[teachers] ([teacher_id])
GO
ALTER TABLE [dbo].[education] CHECK CONSTRAINT [FK_egitimler_egitmenler]
GO
ALTER TABLE [dbo].[education]  WITH CHECK ADD  CONSTRAINT [FK_egitimler_katilimcilar] FOREIGN KEY([participant_id])
REFERENCES [dbo].[participant] ([participant_id])
GO
ALTER TABLE [dbo].[education] CHECK CONSTRAINT [FK_egitimler_katilimcilar]
GO
ALTER TABLE [dbo].[education_students]  WITH CHECK ADD  CONSTRAINT [FK_egitim_ogrencileri_egitimler1] FOREIGN KEY([education_id])
REFERENCES [dbo].[education] ([education_id])
GO
ALTER TABLE [dbo].[education_students] CHECK CONSTRAINT [FK_egitim_ogrencileri_egitimler1]
GO
ALTER TABLE [dbo].[education_students]  WITH CHECK ADD  CONSTRAINT [FK_egitim_ogrencileri_ogrenciler1] FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([student_id])
GO
ALTER TABLE [dbo].[education_students] CHECK CONSTRAINT [FK_egitim_ogrencileri_ogrenciler1]
GO
/****** Object:  StoredProcedure [dbo].[sp_assistant_education]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_assistant_education]
AS 
BEGIN 
Select education_name,assistant_name,assistant_surname
FROM assistant
JOIN education
ON assistant.assistant_id=education.assistant_id

END 
GO
/****** Object:  StoredProcedure [dbo].[sp_education_add_student]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_education_add_student]
(

@student_id int,
@education_id int,
@id int,
@attendance_id int,
@attendance_8week float,
@success_id int
)

AS
IF EXISTS(SELECT * FROM education_students WHERE  student_id=@student_id)
BEGIN
PRINT 'Bir öğrenci sadece bir eğitime katılabilir'
END
ELSE
BEGIN
INSERT INTO education_students VALUES(@id,@education_id,@student_id)  
INSERT attendance VALUES(@attendance_id,@student_id,@attendance_8week,@success_id)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_new_student_add]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_new_student_add]
(
@student_id int,
@student_name varchar(15),
@student_surname varchar(20)
)
AS
IF EXISTS(SELECT * FROM students WHERE  student_id=@student_id)
BEGIN
PRINT 'Bu id`ye sahip bir öğrenci vardır.'
END
ELSE
BEGIN
INSERT INTO students VALUES (@student_id,@student_name,@student_surname)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_new_teacher_add]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_new_teacher_add]
(
@teacher_id int,
@teacher_name varchar(15),
@teacher_surname varchar(20)
)
AS
IF EXISTS(SELECT * FROM teachers WHERE  teacher_id=@teacher_id)
BEGIN
PRINT 'Bu id`ye sahip bir eğitmen vardır.'
END
ELSE
BEGIN
INSERT INTO teachers VALUES (@teacher_id,@teacher_name,@teacher_surname)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_participant_education]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_participant_education]

AS 
BEGIN 
Select education_name,participant_name,participant_surname
FROM participant
JOIN education
ON education.participant_id=participant.participant_id

END 
GO
/****** Object:  StoredProcedure [dbo].[sp_student_attendance]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_student_attendance]

AS 
BEGIN 
Select student_name,student_surname,attendance_8week
FROM students
JOIN education_students
ON students.student_id=education_students.student_id
JOIN attendance
ON attendance.student_id=education_students.student_id
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_student_education]    Script Date: 27.01.2022 13:15:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_student_education]
 
AS 
BEGIN 
Select student_name,student_surname,education_name,success_status,teacher_name,teacher_surname
FROM students
JOIN education_students
ON students.student_id=education_students.student_id
JOIN education
ON education.education_id=education_students.education_id
JOIN teachers
ON teachers.teacher_id=education.teacher_id
JOIN success
ON students.student_id=success.student_id

END 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ogrenciler"
            Begin Extent = 
               Top = 57
               Left = 605
               Bottom = 198
               Right = 828
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "egitim_ogrencileri"
            Begin Extent = 
               Top = 44
               Left = 294
               Bottom = 185
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "egitimler"
            Begin Extent = 
               Top = 162
               Left = 33
               Bottom = 325
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 2148
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_students_group_education'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_students_group_education'
GO
USE [master]
GO
ALTER DATABASE [patika_dev] SET  READ_WRITE 
GO
