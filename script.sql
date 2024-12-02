USE [master]
GO
/****** Object:  Database [EduTrailblazeDb]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE DATABASE [EduTrailblazeDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EduTrailblazeDb', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EduTrailblazeDb.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EduTrailblazeDb_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EduTrailblazeDb_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EduTrailblazeDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EduTrailblazeDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EduTrailblazeDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EduTrailblazeDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EduTrailblazeDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EduTrailblazeDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EduTrailblazeDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EduTrailblazeDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EduTrailblazeDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EduTrailblazeDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EduTrailblazeDb] SET  MULTI_USER 
GO
ALTER DATABASE [EduTrailblazeDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EduTrailblazeDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EduTrailblazeDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EduTrailblazeDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EduTrailblazeDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Answers]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerText] [nvarchar](max) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Carts]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Certificates]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificates](
	[CertificateId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[CertificateTemplateUrl] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Certificates] PRIMARY KEY CLUSTERED 
(
	[CertificateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[DiscountType] [nvarchar](50) NOT NULL,
	[DiscountValue] [decimal](18, 2) NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseCoupons]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCoupons](
	[CourseId] [int] NOT NULL,
	[CouponId] [int] NOT NULL,
 CONSTRAINT [PK_CourseCoupons] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseDiscounts]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseDiscounts](
	[CourseId] [int] NOT NULL,
	[DiscountId] [int] NOT NULL,
 CONSTRAINT [PK_CourseDiscounts] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseInstructors]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstructors](
	[CourseId] [int] NOT NULL,
	[InstructorId] [nvarchar](450) NOT NULL,
	[IsPrimaryInstructor] [bit] NOT NULL,
	[AssignedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CourseInstructors] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseLanguages]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseLanguages](
	[CourseId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
 CONSTRAINT [PK_CourseLanguages] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[ImageURL] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Duration] [int] NOT NULL,
	[DifficultyLevel] [nvarchar](50) NOT NULL,
	[Prerequisites] [nvarchar](max) NOT NULL,
	[EstimatedCompletionTime] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[UpdatedBy] [nvarchar](max) NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseTags]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseTags](
	[CourseId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_CourseTags] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountType] [nvarchar](50) NOT NULL,
	[DiscountValue] [decimal](18, 2) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollments](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [nvarchar](450) NOT NULL,
	[EnrolledAt] [datetime2](7) NOT NULL,
	[ProgressPercentage] [decimal](18, 2) NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Languages]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[LectureId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Duration] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Lectures] PRIMARY KEY CLUSTERED 
(
	[LectureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[IsGlobal] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[OrderAmount] [decimal](18, 2) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[OrderStatus] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payments]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentStatus] [nvarchar](20) NOT NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuizzId] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizAnswers]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizAnswers](
	[QuizAnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuizHistoryId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[UserAnswer] [nvarchar](255) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_QuizAnswers] PRIMARY KEY CLUSTERED 
(
	[QuizAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizHistories]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizHistories](
	[QuizHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[QuizId] [int] NOT NULL,
	[AttemptedOn] [datetime2](7) NOT NULL,
	[Score] [decimal](18, 2) NOT NULL,
	[IsPassed] [bit] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
 CONSTRAINT [PK_QuizHistories] PRIMARY KEY CLUSTERED 
(
	[QuizHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizzes](
	[QuizzId] [int] IDENTITY(1,1) NOT NULL,
	[LectureId] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[PassingScore] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Quizzes] PRIMARY KEY CLUSTERED 
(
	[QuizzId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Rating] [decimal](18, 2) NOT NULL,
	[ReviewText] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sections]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserCertificates]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCertificates](
	[UserCertificateId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[CertificateId] [int] NOT NULL,
	[IssuedAt] [datetime2](7) NOT NULL,
	[CertificateUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserCertificates] PRIMARY KEY CLUSTERED 
(
	[UserCertificateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserNotifications]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNotifications](
	[UserId] [nvarchar](450) NOT NULL,
	[NotificationId] [int] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_UserNotifications] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[UserId] [nvarchar](450) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[ProfilePictureUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserProfiles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProgresses]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProgresses](
	[UserProgressId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[CourseId] [int] NOT NULL,
	[SectionId] [int] NULL,
	[LectureId] [int] NULL,
	[QuizId] [int] NULL,
	[ProgressType] [nvarchar](50) NOT NULL,
	[ProgressPercentage] [decimal](18, 2) NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[LastAccessed] [datetime2](7) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserProgresses] PRIMARY KEY CLUSTERED 
(
	[UserProgressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Videos]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoId] [int] IDENTITY(1,1) NOT NULL,
	[LectureId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[VideoUrl] [nvarchar](max) NOT NULL,
	[Transcript] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 12/3/2024 12:19:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[VoucherId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountType] [nvarchar](50) NOT NULL,
	[DiscountValue] [decimal](18, 2) NOT NULL,
	[IsUsed] [bit] NOT NULL,
	[ExpiryDate] [datetime2](7) NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[VoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_Answers_QuestionId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Answers_QuestionId] ON [dbo].[Answers]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_CourseId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_CourseId] ON [dbo].[CartItems]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Carts_UserId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Carts_UserId] ON [dbo].[Carts]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Certificates_CourseId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Certificates_CourseId] ON [dbo].[Certificates]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Coupons_Code]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Coupons_Code] ON [dbo].[Coupons]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseCoupons_CouponId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseCoupons_CouponId] ON [dbo].[CourseCoupons]
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseDiscounts_DiscountId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseDiscounts_DiscountId] ON [dbo].[CourseDiscounts]
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CourseInstructors_InstructorId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseInstructors_InstructorId] ON [dbo].[CourseInstructors]
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseLanguages_LanguageId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseLanguages_LanguageId] ON [dbo].[CourseLanguages]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseTags_TagId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CourseTags_TagId] ON [dbo].[CourseTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Enrollments_CourseId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Enrollments_CourseId] ON [dbo].[Enrollments]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Enrollments_StudentId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Enrollments_StudentId] ON [dbo].[Enrollments]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Lectures_SectionId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Lectures_SectionId] ON [dbo].[Lectures]
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Payments_OrderId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Payments_OrderId] ON [dbo].[Payments]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Questions_QuizzId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Questions_QuizzId] ON [dbo].[Questions]
(
	[QuizzId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuizAnswers_QuestionId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_QuizAnswers_QuestionId] ON [dbo].[QuizAnswers]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuizAnswers_QuizHistoryId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_QuizAnswers_QuizHistoryId] ON [dbo].[QuizAnswers]
(
	[QuizHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuizHistories_QuizId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_QuizHistories_QuizId] ON [dbo].[QuizHistories]
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_QuizHistories_UserId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_QuizHistories_UserId] ON [dbo].[QuizHistories]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Quizzes_LectureId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Quizzes_LectureId] ON [dbo].[Quizzes]
(
	[LectureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_CourseId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_CourseId] ON [dbo].[Reviews]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Reviews_UserId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_UserId] ON [dbo].[Reviews]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sections_CourseId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Sections_CourseId] ON [dbo].[Sections]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserCertificates_CertificateId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserCertificates_CertificateId] ON [dbo].[UserCertificates]
(
	[CertificateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserCertificates_UserId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserCertificates_UserId] ON [dbo].[UserCertificates]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserNotifications_NotificationId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserNotifications_NotificationId] ON [dbo].[UserNotifications]
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProgresses_CourseId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProgresses_CourseId] ON [dbo].[UserProgresses]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProgresses_LectureId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProgresses_LectureId] ON [dbo].[UserProgresses]
(
	[LectureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProgresses_QuizId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProgresses_QuizId] ON [dbo].[UserProgresses]
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProgresses_SectionId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProgresses_SectionId] ON [dbo].[UserProgresses]
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserProgresses_UserId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserProgresses_UserId] ON [dbo].[UserProgresses]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Videos_LectureId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Videos_LectureId] ON [dbo].[Videos]
(
	[LectureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vouchers_OrderId]    Script Date: 12/3/2024 12:19:34 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Vouchers_OrderId] ON [dbo].[Vouchers]
(
	[OrderId] ASC
)
WHERE ([OrderId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions_QuestionId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([CartId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts_CartId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Courses_CourseId]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Certificates]  WITH CHECK ADD  CONSTRAINT [FK_Certificates_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Certificates] CHECK CONSTRAINT [FK_Certificates_Courses_CourseId]
GO
ALTER TABLE [dbo].[CourseCoupons]  WITH CHECK ADD  CONSTRAINT [FK_CourseCoupons_Coupons_CouponId] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseCoupons] CHECK CONSTRAINT [FK_CourseCoupons_Coupons_CouponId]
GO
ALTER TABLE [dbo].[CourseCoupons]  WITH CHECK ADD  CONSTRAINT [FK_CourseCoupons_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseCoupons] CHECK CONSTRAINT [FK_CourseCoupons_Courses_CourseId]
GO
ALTER TABLE [dbo].[CourseDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_CourseDiscounts_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseDiscounts] CHECK CONSTRAINT [FK_CourseDiscounts_Courses_CourseId]
GO
ALTER TABLE [dbo].[CourseDiscounts]  WITH CHECK ADD  CONSTRAINT [FK_CourseDiscounts_Discounts_DiscountId] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discounts] ([DiscountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseDiscounts] CHECK CONSTRAINT [FK_CourseDiscounts_Discounts_DiscountId]
GO
ALTER TABLE [dbo].[CourseInstructors]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructors_AspNetUsers_InstructorId] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseInstructors] CHECK CONSTRAINT [FK_CourseInstructors_AspNetUsers_InstructorId]
GO
ALTER TABLE [dbo].[CourseInstructors]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructors_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseInstructors] CHECK CONSTRAINT [FK_CourseInstructors_Courses_CourseId]
GO
ALTER TABLE [dbo].[CourseLanguages]  WITH CHECK ADD  CONSTRAINT [FK_CourseLanguages_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseLanguages] CHECK CONSTRAINT [FK_CourseLanguages_Courses_CourseId]
GO
ALTER TABLE [dbo].[CourseLanguages]  WITH CHECK ADD  CONSTRAINT [FK_CourseLanguages_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseLanguages] CHECK CONSTRAINT [FK_CourseLanguages_Languages_LanguageId]
GO
ALTER TABLE [dbo].[CourseTags]  WITH CHECK ADD  CONSTRAINT [FK_CourseTags_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseTags] CHECK CONSTRAINT [FK_CourseTags_Courses_CourseId]
GO
ALTER TABLE [dbo].[CourseTags]  WITH CHECK ADD  CONSTRAINT [FK_CourseTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseTags] CHECK CONSTRAINT [FK_CourseTags_Tags_TagId]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_AspNetUsers_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_AspNetUsers_StudentId]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Courses_CourseId]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD  CONSTRAINT [FK_Lectures_Sections_SectionId] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Lectures] CHECK CONSTRAINT [FK_Lectures_Sections_SectionId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Courses_CourseId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Orders_OrderId]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Quizzes_QuizzId] FOREIGN KEY([QuizzId])
REFERENCES [dbo].[Quizzes] ([QuizzId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Quizzes_QuizzId]
GO
ALTER TABLE [dbo].[QuizAnswers]  WITH CHECK ADD  CONSTRAINT [FK_QuizAnswers_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuizAnswers] CHECK CONSTRAINT [FK_QuizAnswers_Questions_QuestionId]
GO
ALTER TABLE [dbo].[QuizAnswers]  WITH CHECK ADD  CONSTRAINT [FK_QuizAnswers_QuizHistories_QuizHistoryId] FOREIGN KEY([QuizHistoryId])
REFERENCES [dbo].[QuizHistories] ([QuizHistoryId])
GO
ALTER TABLE [dbo].[QuizAnswers] CHECK CONSTRAINT [FK_QuizAnswers_QuizHistories_QuizHistoryId]
GO
ALTER TABLE [dbo].[QuizHistories]  WITH CHECK ADD  CONSTRAINT [FK_QuizHistories_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuizHistories] CHECK CONSTRAINT [FK_QuizHistories_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[QuizHistories]  WITH CHECK ADD  CONSTRAINT [FK_QuizHistories_Quizzes_QuizId] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizzes] ([QuizzId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuizHistories] CHECK CONSTRAINT [FK_QuizHistories_Quizzes_QuizId]
GO
ALTER TABLE [dbo].[Quizzes]  WITH CHECK ADD  CONSTRAINT [FK_Quizzes_Lectures_LectureId] FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([LectureId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Quizzes] CHECK CONSTRAINT [FK_Quizzes_Lectures_LectureId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Courses_CourseId]
GO
ALTER TABLE [dbo].[Sections]  WITH CHECK ADD  CONSTRAINT [FK_Sections_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sections] CHECK CONSTRAINT [FK_Sections_Courses_CourseId]
GO
ALTER TABLE [dbo].[UserCertificates]  WITH CHECK ADD  CONSTRAINT [FK_UserCertificates_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserCertificates] CHECK CONSTRAINT [FK_UserCertificates_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserCertificates]  WITH CHECK ADD  CONSTRAINT [FK_UserCertificates_Certificates_CertificateId] FOREIGN KEY([CertificateId])
REFERENCES [dbo].[Certificates] ([CertificateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserCertificates] CHECK CONSTRAINT [FK_UserCertificates_Certificates_CertificateId]
GO
ALTER TABLE [dbo].[UserNotifications]  WITH CHECK ADD  CONSTRAINT [FK_UserNotifications_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserNotifications] CHECK CONSTRAINT [FK_UserNotifications_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserNotifications]  WITH CHECK ADD  CONSTRAINT [FK_UserNotifications_Notifications_NotificationId] FOREIGN KEY([NotificationId])
REFERENCES [dbo].[Notifications] ([NotificationId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserNotifications] CHECK CONSTRAINT [FK_UserNotifications_Notifications_NotificationId]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserProgresses]  WITH CHECK ADD  CONSTRAINT [FK_UserProgresses_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProgresses] CHECK CONSTRAINT [FK_UserProgresses_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserProgresses]  WITH CHECK ADD  CONSTRAINT [FK_UserProgresses_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProgresses] CHECK CONSTRAINT [FK_UserProgresses_Courses_CourseId]
GO
ALTER TABLE [dbo].[UserProgresses]  WITH CHECK ADD  CONSTRAINT [FK_UserProgresses_Lectures_LectureId] FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([LectureId])
GO
ALTER TABLE [dbo].[UserProgresses] CHECK CONSTRAINT [FK_UserProgresses_Lectures_LectureId]
GO
ALTER TABLE [dbo].[UserProgresses]  WITH CHECK ADD  CONSTRAINT [FK_UserProgresses_Quizzes_QuizId] FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quizzes] ([QuizzId])
GO
ALTER TABLE [dbo].[UserProgresses] CHECK CONSTRAINT [FK_UserProgresses_Quizzes_QuizId]
GO
ALTER TABLE [dbo].[UserProgresses]  WITH CHECK ADD  CONSTRAINT [FK_UserProgresses_Sections_SectionId] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
GO
ALTER TABLE [dbo].[UserProgresses] CHECK CONSTRAINT [FK_UserProgresses_Sections_SectionId]
GO
ALTER TABLE [dbo].[Videos]  WITH CHECK ADD  CONSTRAINT [FK_Videos_Lectures_LectureId] FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([LectureId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Videos] CHECK CONSTRAINT [FK_Videos_Lectures_LectureId]
GO
ALTER TABLE [dbo].[Vouchers]  WITH CHECK ADD  CONSTRAINT [FK_Vouchers_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Vouchers] CHECK CONSTRAINT [FK_Vouchers_Orders_OrderId]
GO
USE [master]
GO
ALTER DATABASE [EduTrailblazeDb] SET  READ_WRITE 
GO
