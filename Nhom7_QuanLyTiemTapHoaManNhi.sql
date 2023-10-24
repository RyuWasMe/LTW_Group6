USE [master]
GO
/****** Object:  Database [QuanLyTapHoa]    Script Date: 23/10/2023 23:28:39 ******/
CREATE DATABASE [QuanLyTapHoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyTapHoa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.THIEU\MSSQL\DATA\QuanLyTapHoa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyTapHoa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.THIEU\MSSQL\DATA\QuanLyTapHoa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyTapHoa] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyTapHoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyTapHoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyTapHoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyTapHoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyTapHoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyTapHoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyTapHoa] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyTapHoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyTapHoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyTapHoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyTapHoa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyTapHoa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyTapHoa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyTapHoa', N'ON'
GO
ALTER DATABASE [QuanLyTapHoa] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyTapHoa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyTapHoa]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 23/10/2023 23:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [int] NOT NULL,
	[MaHH] [varchar](6) NOT NULL,
	[NgayLap] [datetime] NOT NULL,
 CONSTRAINT [PK__ChiTietH__7557FC8E6533651D] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doanh Thu]    Script Date: 23/10/2023 23:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doanh Thu](
	[Mã Doanh Thu] [varchar](10) NOT NULL,
	[Tổng Giá Gốc] [float] NOT NULL,
	[Tổng Giá Bán] [float] NOT NULL,
 CONSTRAINT [PK_Doanh Thu] PRIMARY KEY CLUSTERED 
(
	[Mã Doanh Thu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 23/10/2023 23:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHH] [varchar](6) NOT NULL,
	[TenHH] [nvarchar](50) NOT NULL,
	[SL] [int] NOT NULL,
	[DVT] [nvarchar](6) NOT NULL,
	[Gia] [float] NOT NULL,
	[MaNCC] [varchar](6) NOT NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 23/10/2023 23:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] NOT NULL,
	[MaHH] [varchar](6) NOT NULL,
 CONSTRAINT [PK__HoaDon__2725A6E04C04A49E] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 23/10/2023 23:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [varchar](6) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[sdt] [int] NOT NULL,
 CONSTRAINT [PK__NhaCungC__3A185DEB51DDE567] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 23/10/2023 23:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[MatKhauMoi] [varchar](50) NULL,
	[DaThayDoiMatKhau] [bit] NULL,
 CONSTRAINT [PK__TaiKhoan__3214EC27988ED412] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TonKho]    Script Date: 23/10/2023 23:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TonKho](
	[MaHH] [varchar](6) NOT NULL,
	[GiaNhapHang] [float] NOT NULL,
 CONSTRAINT [PK__HangTon__2725A6D0B1C00233] PRIMARY KEY CLUSTERED 
(
	[MaHH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH1', N'Bia 333', 6, N'Lon', 12000, N'NCC3')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH10', N'Pepsi 1,5l', 6, N'Chai', 20000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH100', N'Phở Cung Đình ', 7, N'Gói', 8500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH101', N'Bún bò Huế Hằng Nga ', 5, N'Gói', 8500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH102', N'Phở trộn Cung Đình', 6, N'Gói', 14000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH103', N'Cháo thịt bằm Gấu Đỏ ', 5, N'Gói', 3500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH104', N'Cháo Thị bằm Vifon', 6, N'Gói', 8000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH105', N'Bún Gạo Bà Bảy 400g', 5, N'Gói', 32000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH106', N'Bún Canh ống Mikiri 300g', 7, N'Gói', 23000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH107', N'Mì spagetti Eufôd 500g', 6, N'Gói', 43000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH108', N'Khăn Giấy Homelux 280 tờ ', 7, N'Bịch', 20000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH109', N'Khăn Giấy Premier 280 tờ ', 7, N'Bịch', 20000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH11', N'Fanta 1,5l', 5, N'Chai', 20000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH110', N'Giấy ăn Softly 100 tờ ', 6, N'Bịch', 7000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH111', N'Khăn ướt Max cool 20 cái ', 7, N'Bịch', 17000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH112', N'Khăn Ướt Let-green 90 miếng ', 6, N'Bịch', 52000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH113', N'Dầu gội head & soulder 625ml', 7, N'Chai', 130000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH114', N'Dầu gội head & soulder 170ml', 6, N'Chai', 60000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH115', N'Dầu gội Clear 330ml', 6, N'Chai', 100000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH116', N'Dầu gội Clear 175ml', 7, N'Chai', 65000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH117', N'Dầu gội Clear 4.9ml 12 gói ', 6, N'Gói', 15000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH118', N'Dầu gội Clear 5.7ml 10 gói ', 6, N'Gói', 19000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH119', N'Dầu gội Sunsilk 631ml', 6, N'Chai', 145000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH12', N'7UP 1,5l', 7, N'Chai', 20000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH120', N'Dầu gội Sunsilk 165ml', 6, N'Chai', 48000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH121', N'Dầu xả Sunsilk 327ml', 5, N'Chai', 84000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH122', N'Dầu gội sunsilk 5.8ml 10 gói ', 7, N'Gói', 12000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH123', N'Dầu xả sunsilk 6.1ml 10 gói ', 6, N'Gói', 12000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH124', N'Dầu gội Romano 380g', 6, N'Chai', 120000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH125', N'Dầu gội Romano 180g', 5, N'Chai', 70000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH126', N'Dầu gội Romano 5g 12 gói ', 5, N'Gói', 14000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH127', N'Dầu gội Xmen 400g', 6, N'Chai', 115000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH128', N'Dầu gội Dove 631ml', 7, N'Chai', 155000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH129', N'Dầu xả Dove 635ml', 5, N'Chai', 190000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH13', N'Nước suối aquafina 330ml', 7, N'Chai', 4700, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH130', N'Kem xả Dove 6.3ml 10 gói ', 5, N'Gói', 18000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH131', N'Dầu gội Dove 5.8ml 10 gói ', 7, N'Gói', 18000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH132', N'Sữa tắm  Life Boy 980ml', 5, N'Chai', 200000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH133', N'Sữa tắm Dove 500g', 6, N'Chai', 145000, N'NCC5')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH134', N'kem đánh răng P/s 230g', 6, N'Chai', 30000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH135', N'kem đánh răng colgate 230g', 7, N'Chai', 38000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH136', N'bàn chải đánh răng ', 7, N'Cái', 22000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH137', N'tăm bông Ommi 200 cây', 6, N'Bịch', 21000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH138', N'Tăm bông famapro 200 cây ', 7, N'Bịch', 15000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH139', N'Bột giặt Omo 5.7kg', 7, N'Bịch', 237000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH14', N'Nước suối lavie 500ml', 5, N'Chai', 5000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH140', N'Bột giặt Omo 700g', 7, N'Bịch', 42000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH141', N'Bột giặt Aba 5.7kg', 6, N'Bịch', 205000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH142', N'Bột giặt Aba 720g', 6, N'Bịch', 36000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH143', N'Bột giặt Tide 5.3kg', 6, N'Bịch', 230000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH144', N'Bột giặt Tide 2.25kg', 7, N'Bịch', 122000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH145', N'Nước rửa chén Sunlight 725ml', 6, N'Chai', 28000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH146', N'nước rửa chén Mỹ hảo 390g', 7, N'Chai', 14000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH147', N'Tẩy bồn cầu và nhà tắm VIM 880ml', 7, N'Chai', 30000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH148', N'Tẩy bồn cầu và nhà tắm Swat 1l', 5, N'Chai', 26000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH149', N'Nước lau sàn Sunlight 2l', 7, N'Chai', 40000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH15', N'Nước suối dasani 500ml', 7, N'Chai', 5000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH150', N'Nước lau sàn Lix 2x 3.6l', 6, N'Chai', 60000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH151', N'xịt côn trùng Raid 600ml', 7, N'Chai', 72000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH152', N'xịt côn trùng king star 600ml', 7, N'Chai', 40000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH153', N'50 Khoanh Nhang muỗi 600g', 5, N'Hộp', 43000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH154', N'6 cuộn túi rác đen 55x65cm 1kg', 7, N'Bịch', 85000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH155', N'6 cuộn túi rác đen64x78cm 1kg', 6, N'Bịch', 85000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH156', N'Snack cua Kinh đô 32g', 7, N'Bịch', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH157', N'Snack phomat oishi 32g', 7, N'Bịch', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH158', N'Snack bắp ngọt oishi 32g', 5, N'Bịch', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH159', N'Snack phồng mực 32g', 6, N'Bịch', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH16', N'Trà olong teaplus 500ml', 7, N'Chai', 10000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH160', N'Snack bí đỏ  32g', 7, N'Bịch', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH161', N'Snack tôm cay 32g', 5, N'Bịch', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH162', N'Thuốc lá 555', 5, N'Hộp', 26000, N'NCC6')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH163', N'Thuốc lá richmond', 6, N'Hộp', 45000, N'NCC6')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH164', N'Thuốc lá captain black', 6, N'Hộp', 120000, N'NCC6')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH165', N'Thuốc lá craven', 6, N'Hộp', 30000, N'NCC6')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH166', N'Thuốc lá kent', 6, N'Hộp', 20000, N'NCC6')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH167', N'thẻ cào viettel 20k', 5, N'Cái', 20000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH168', N'thẻ cào viettel 50k', 6, N'Cái', 50000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH169', N'Thẻ cào viettel 100k', 6, N'Cái', 100000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH17', N'Sữa vinamilk 220ml', 5, N'Bịch', 7000, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH170', N'thẻ cào mobiphone 20k', 7, N'Cái', 20000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH171', N'thẻ cào mobiphone 50k', 5, N'Cái', 50000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH172', N'thẻ cào mobiphone 100k', 7, N'Cái', 100000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH173', N'thẻ cào vinaphone 20k', 5, N'Cái', 20000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH174', N'thẻ cào vinaphone 50k', 6, N'Cái', 50000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH175', N'thẻ cào vinaphone 100k', 6, N'Cái', 100000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH176', N'thẻ cào vietnammobile 10k', 5, N'Cái', 10000, N'NCC7')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH177', N'kẹo chupa chup 93g', 5, N'Bịch', 12000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH178', N'kẹo caramel  115g', 7, N'Bịch', 15000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH179', N'Kẹo xoài muối ớt 87g', 6, N'Bịch', 13000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH18', N'Sữa thtruemilk 220ml', 6, N'Bịch', 8000, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH180', N'Kẹo mút chupachup ', 6, N'Cái', 1000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH181', N'Chả giò Vissan gói 500g', 6, N'Hộp', 36000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH182', N'Cá viên gói 250g', 7, N'Hộp', 24000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH183', N'bò viên gói 500g', 7, N'Hộp', 94000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH184', N'Chả rế thập cẩm cholimex 500g', 5, N'Hộp', 62000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH185', N'Xúc xích heo 175g', 6, N'Bịch', 20000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH186', N'Cá hộp 3 cô gái ', 6, N'Hộp', 30000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH187', N'kem chuối ', 6, N'Cái', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH188', N'kem socola', 5, N'Cái', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH189', N'kem dưa lưới', 5, N'Cái', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH19', N'Sữa chua yomos 170ml', 7, N'hộp', 7000, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH190', N'Hôp kem socola 250g', 6, N'Hộp', 60000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH191', N'Hôp kem vani 250g', 6, N'Hộp', 60000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH192', N'Chổi quét nhà ', 7, N'Cái', 35000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH193', N'chổi rễ ', 5, N'Cái', 35000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH194', N'đồ hốt rác', 6, N'Cái', 25000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH195', N'tăm tre', 6, N'Bịch', 12000, N'NCC4')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH196', N'hộp cafe đen đá nefviet 240g', 5, N'Hộp', 55000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH197', N'bịch vinacafe 480g', 7, N'Bịch', 61000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH198', N'bịch cafe phố 720g', 5, N'Bịch', 122000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH2', N'Bia Sài Gòn', 6, N'Lon', 16000, N'NCC3')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH20', N'Sữa chua fristi 80ml', 5, N'hộp', 3500, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH200', N'migoi', 2, N'1', 4000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH201', N'mi1', 2, N'1', 5000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH202', N'micungdinh', 2, N'1', 4000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH203', N'micungdinh2', 2, N'1', 4000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH204', N'micungdinh3', 3, N'1', 4500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH205', N'micungdinh4', 4, N'1', 4500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH21', N'Sữa milo 240ml', 5, N'Bịch', 8500, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH22', N'Sữa đặc ông Thọ 380g', 7, N'Lon', 25500, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH23', N'Sữa bột Ensure 850g', 5, N'Lon', 800000, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH24', N'1 lốc Sữa chua vinamilk', 5, N'Hộp', 23000, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH25', N'1 lốc Sữa chua thtrue yogurt', 6, N'Hộp', 31000, N'NCC8')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH26', N'Dầu ăn Trường An 2l', 5, N'Chai', 96000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH27', N'Dầu ăn happikoki 400ml', 5, N'Chai', 16000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH28', N'Dầu ăn meizan 1l', 6, N'Chai', 63000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH29', N'Dầu ăn Trường An 5l', 6, N'Chai', 220000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH3', N'Bia Tiger', 5, N'Lon', 17000, N'NCC3')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH30', N'Đường Biên Hòa 1kg', 7, N'Kí', 30000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH31', N'Đường mía Toàn Phát 1kg', 7, N'Kí', 29000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH32', N'Đường Biên Hòa 1kg', 5, N'Kí', 30000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH33', N'Đường mía Toàn Phát 1kg', 6, N'Kí', 29000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH34', N'Đường Biên Hòa 500g', 6, N'Kí', 15000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH35', N'Đường mía Toàn Phát 500g', 7, N'Kí', 15000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH36', N'Hạt nêm knorr 900g', 5, N'Kí', 73000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH37', N'Hạt nêm knorr 400g', 6, N'Kí', 30000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH38', N'Bột ngọt ajinomoto 454g', 7, N'Kí', 36000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH39', N'Muối Vĩnh Hảo 1 kg', 5, N'Kí', 8000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH4', N'Bia Heineken', 6, N'Lon', 22000, N'NCC3')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH40', N'Muối Visaco 500g', 6, N'Kí', 6500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH41', N'Nước mắm Nam Ngư 900ml', 6, N'Chai', 60000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH42', N'Nước mắm Nam Ngư 500ml', 6, N'Chai', 35000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH43', N'Nước mắm Thuận Phát 740ml', 5, N'Chai', 41000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH44', N'Nước tương maggi 700ml', 6, N'Chai', 22000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH45', N'Nước tương Nhị ca tam thái tử 500ml', 7, N'Chai', 9000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH46', N'Nước tương tỏi ớt 330ml', 5, N'Chai', 16000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH47', N'Tương ớt Chinsu 500g', 5, N'Chai', 28000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH48', N'Tương ớt Chinsu 250g', 7, N'Chai', 15000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH49', N'Tương cà Chinsu 250g', 6, N'Chai', 15000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH5', N'Coca 330ml', 6, N'Chai', 10000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH50', N'Tương ớt Chinsu 1kg', 6, N'Chai', 52000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH51', N'Tương ớt Cholimex 270g', 6, N'Chai', 14000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH52', N'Dầu hào maggi 350g', 6, N'Chai', 27000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH53', N'Dầu hào maggi 530g', 7, N'Chai', 38000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH54', N'Giấm gạo Ajinomoto 400ml', 6, N'Chai', 17000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH55', N'Bơ thực vật Trường An 200g', 5, N'Chai', 21000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH56', N'Bơ thực vật Meizan 80g', 6, N'Chai', 9000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH57', N'Sa tế Cholimex 90g', 5, N'Lọ', 10000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH58', N'Sa tế Thuận Phát 85g', 6, N'Lọ', 10000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH59', N'Tiêu đen xay fadely 45g', 7, N'Lọ', 16600, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH6', N'Pepsi 330ml', 5, N'Chai', 10000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH60', N'Tiêu đen hạt 50g', 5, N'Lọ', 10500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH61', N'Bột ớt Thiên Thành 100g', 5, N'Lọ', 24500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH62', N'Tiêu đen xayy DH food 45g', 7, N'Lọ', 27500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH63', N'Tiêu ngũ sắc Vipep 45g', 5, N'Lọ', 55000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH64', N'Sốt ướp thịt cholimex 70g', 7, N'Lọ', 8400, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH65', N'Gia vị nẫu canh chua Knorr 30g', 6, N'Bịch', 7400, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH66', N'Gia vị ướp xá xíu Cholimex 70g', 7, N'Bịch', 8400, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH67', N'Gia vị lẩu thái 50g', 5, N'Bịch', 8700, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH68', N'Gia vị cà ri DH food 10g', 5, N'Bịch', 4400, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH69', N'Ngũ vị hương Thiên Thành 5g', 6, N'Bịch', 3000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH7', N'Fanta 330ml', 6, N'Chai', 10000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH70', N'Nghệ Bột Vipep 35g', 7, N'Bịch', 11000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH71', N'Quế Cây vipep 20g', 7, N'Lọ', 11000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH72', N'Nước màu dừa Tuấn Khang 120g', 7, N'Bịch', 13000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH73', N'Thảo quả dh food 20g', 7, N'Lọ', 22000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH74', N'Bột gừng Thiên thành 50g', 5, N'Lọ', 15000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH75', N'Bột chiên giòn Meizan 150g', 7, N'Bịch', 7000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH76', N'Bột rau câu Bà Bảy 10g', 5, N'Bịch', 7500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH77', N'Bột Nếp Tài Kýy 400g', 7, N'Bịch', 20000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH78', N'Bột Gạo Tài Ký 400g', 5, N'Bịch', 16000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH79', N'Bột Sương Sáo 50g', 5, N'Bịch', 17000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH8', N'7UP 1,5l', 5, N'Chai', 10000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH80', N'Bột Bắp Meizan 150g', 6, N'Bịch', 7000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH81', N'Bột Mì Meizan 500g', 6, N'Bịch', 15000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH82', N'Bột bánh xèo Hương Xưa 500g', 5, N'Bịch', 28000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH83', N'Bột Chiên Xù tài Ký 150g', 5, N'Bịch', 14000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH84', N'Bánh tráng 22cm Tính Nguyên  200g', 7, N'Bịch', 16000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH85', N'Bánh Tráng 22cm Safoco 300g ', 6, N'Bịch', 20000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH86', N'Bánh Tráng 16cm Safoco 200g ', 5, N'Bịch', 15000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH87', N'Mắm tôm Sông Hương 430g ', 6, N'Lọ', 78000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH88', N'Mắm Thái Sông Hương 430g', 6, N'Lọ', 62000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH89', N'Mắm cá sặc Sông Hương 400g', 6, N'Lọ', 61000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH9', N'Coca 1,5l', 7, N'Chai', 20000, N'NCC2')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH90', N'Mắm cá linh Sông Hương 400g', 6, N'Lọ', 61000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH91', N'Mì Hảo Hảo', 5, N'Gói', 4000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH92', N'Mì Gấu đỏ', 7, N'Gói', 3500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH93', N'Mì 3 miền', 6, N'Gói', 3500, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH94', N'Mì Kokomi', 6, N'Gói', 4000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH95', N'Mì omachi', 5, N'Gói', 8000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH96', N'Hủ tiếu Nam Vang ', 7, N'Gói', 8000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH97', N'miến Phú Hương ', 5, N'Gói', 10000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH98', N'Hủ tiếu Nhịp Sống ', 6, N'Gói', 8000, N'NCC1')
GO
INSERT [dbo].[HangHoa] ([MaHH], [TenHH], [SL], [DVT], [Gia], [MaNCC]) VALUES (N'HH99', N'Phở bò Đệ Nhất', 5, N'Gói', 7000, N'NCC1')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'MaNCC', N'TenNCC', 111)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'NCC1', N'Công ty thực phẩm ', 222)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'NCC2', N'Công ty phân phối nước giải khát', 333)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'NCC3', N'Công ty Bia các loại', 444)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'NCC4', N'Công ty Đồ gia dụng', 555)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'NCC5', N'Công Ty Sản Xuất Mỹ Phẩm', 666)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'NCC6', N'Công ty TNHH Thương Mại', 777)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'NCC7', N'Nhà phân phối thẻ cào', 888)
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [sdt]) VALUES (N'NCC8', N'Công Ty Sữa', 999)
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 
GO
INSERT [dbo].[TaiKhoan] ([ID], [TenDangNhap], [MatKhau], [Email], [MatKhauMoi], [DaThayDoiMatKhau]) VALUES (1, N'admin', N'123', N'admin@gmail.com', NULL, 0)
GO
INSERT [dbo].[TaiKhoan] ([ID], [TenDangNhap], [MatKhau], [Email], [MatKhauMoi], [DaThayDoiMatKhau]) VALUES (3, N'vu', N'123', N'vu@gmail.com', NULL, 0)
GO
INSERT [dbo].[TaiKhoan] ([ID], [TenDangNhap], [MatKhau], [Email], [MatKhauMoi], [DaThayDoiMatKhau]) VALUES (4, N'trang', N'123', N'trang@gmail.com', NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH1', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH10', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH100', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH101', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH102', 13500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH103', 3000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH104', 7500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH105', 31000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH106', 22000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH107', 41000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH108', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH109', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH11', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH110', 6000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH111', 15000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH112', 50000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH113', 125000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH114', 58000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH115', 100000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH116', 63000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH117', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH118', 17000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH119', 142000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH12', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH120', 46000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH121', 82000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH122', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH123', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH124', 118000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH125', 68000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH126', 12000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH127', 110000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH128', 153000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH129', 188000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH13', 2700)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH130', 16000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH131', 16000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH132', 190000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH133', 143000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH134', 28000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH135', 36000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH136', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH137', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH138', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH139', 235000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH14', 3000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH140', 40000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH141', 203000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH142', 34000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH143', 228000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH144', 120000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH145', 26000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH146', 12000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH147', 28000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH148', 24000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH149', 38000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH15', 3000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH150', 58000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH151', 70000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH152', 38000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH153', 41000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH154', 83000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH155', 83000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH156', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH157', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH158', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH159', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH16', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH160', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH161', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH162', 24000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH163', 43000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH164', 118000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH165', 28000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH166', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH167', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH168', 50000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH169', 100000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH17', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH170', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH171', 50000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH172', 100000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH173', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH174', 50000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH175', 100000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH176', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH177', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH178', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH179', 11000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH18', 6000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH180', 1000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH181', 34000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH182', 22000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH183', 92000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH184', 60000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH185', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH186', 28000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH187', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH188', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH189', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH19', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH190', 58000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH191', 58000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH192', 33000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH193', 33000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH194', 23000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH195', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH196', 53000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH197', 60000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH198', 120000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH2', 14000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH20', 1500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH200', 3000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH201', 4500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH202', 3500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH203', 3500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH204', 4000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH205', 4000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH21', 6500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH22', 23000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH23', 790000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH24', 21000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH25', 30000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH26', 94000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH27', 14000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH28', 61000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH29', 218000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH3', 15000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH30', 28000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH31', 27000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH32', 28000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH33', 27000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH34', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH35', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH36', 70000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH37', 28000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH38', 34000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH39', 6000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH4', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH40', 5000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH41', 58000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH42', 33000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH43', 40000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH44', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH45', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH46', 14000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH47', 26000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH48', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH49', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH5', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH50', 50000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH51', 12000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH52', 25000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH53', 36000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH54', 15000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH55', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH56', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH57', 9000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH58', 9000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH59', 15000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH6', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH60', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH61', 23000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH62', 26000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH63', 53000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH64', 7000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH65', 6000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH66', 7000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH67', 7000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH68', 3000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH69', 2000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH7', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH70', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH71', 10000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH72', 11000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH73', 20000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH74', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH75', 6000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH76', 6000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH77', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH78', 14000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH79', 15000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH8', 8000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH80', 6000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH81', 13000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH82', 26000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH83', 12000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH84', 14000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH85', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH86', 14000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH87', 76000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH88', 60000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH89', 60000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH9', 18000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH90', 60000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH91', 3500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH92', 3000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH93', 3000)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH94', 3500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH95', 7500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH96', 7500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH97', 9500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH98', 7500)
GO
INSERT [dbo].[TonKho] ([MaHH], [GiaNhapHang]) VALUES (N'HH99', 6500)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__A9D105342ECB1D78]    Script Date: 23/10/2023 23:28:40 ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [UQ__TaiKhoan__A9D105342ECB1D78] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [DF__TaiKhoan__DaThay__38996AB5]  DEFAULT ((0)) FOR [DaThayDoiMatKhau]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_NhaCungCap]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_TonKho] FOREIGN KEY([MaHH])
REFERENCES [dbo].[TonKho] ([MaHH])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_TonKho]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatMatKhau]    Script Date: 23/10/2023 23:28:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatMatKhau]
    @TenDangNhap NVARCHAR(50),
    @MatKhauMoi NVARCHAR(100)
AS
BEGIN
    UPDATE TaiKhoan
    SET MatKhau = @MatKhauMoi,
        DaThayDoiMatKhau = 1
    WHERE TenDangNhap = @TenDangNhap;
END;
GO
USE [master]
GO
ALTER DATABASE [QuanLyTapHoa] SET  READ_WRITE 
GO
