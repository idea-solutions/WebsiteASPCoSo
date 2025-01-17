USE [master]
GO
/****** Object:  Database [Webcoso]    Script Date: 29/05/2022 01:11:43 ******/
CREATE DATABASE [Webcoso]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Webcoso', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Webcoso.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Webcoso_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Webcoso_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Webcoso] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Webcoso].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Webcoso] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Webcoso] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Webcoso] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Webcoso] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Webcoso] SET ARITHABORT OFF 
GO
ALTER DATABASE [Webcoso] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Webcoso] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Webcoso] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Webcoso] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Webcoso] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Webcoso] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Webcoso] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Webcoso] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Webcoso] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Webcoso] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Webcoso] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Webcoso] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Webcoso] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Webcoso] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Webcoso] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Webcoso] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Webcoso] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Webcoso] SET RECOVERY FULL 
GO
ALTER DATABASE [Webcoso] SET  MULTI_USER 
GO
ALTER DATABASE [Webcoso] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Webcoso] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Webcoso] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Webcoso] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Webcoso] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Webcoso]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Address] [nvarchar](256) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](255) NULL,
	[MaSP] [int] NULL,
	[MaKH] [nvarchar](128) NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaSP] [int] NOT NULL,
	[MaDH] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[TrangThaiGiaoHang] [bit] NULL,
	[NgayDat] [date] NULL,
	[NgayGiao] [date] NULL,
	[MaKH] [nvarchar](128) NOT NULL,
	[TongTien] [float] NULL,
	[TrangThaiThanhToan] [bit] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](30) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomSanPham]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSanPham](
	[MaNhom] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](30) NULL,
 CONSTRAINT [PK_NhomSanPham] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [int] NOT NULL,
	[Ten] [nvarchar](255) NULL,
	[MoTa] [nvarchar](255) NULL,
	[Gia] [float] NULL,
	[SoLuong] [int] NULL,
	[GiamGia] [float] NULL,
	[Hinh] [varchar](255) NULL,
	[CPU] [nvarchar](128) NULL,
	[ManHinh] [nvarchar](128) NULL,
	[RAM] [nvarchar](128) NULL,
	[OCung] [nvarchar](128) NULL,
	[VGA] [nvarchar](128) NULL,
	[HDH] [nvarchar](128) NULL,
	[Mau] [nvarchar](64) NULL,
	[BaoHang] [int] NULL,
	[MaTH] [int] NULL,
	[MaNhom] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 29/05/2022 01:11:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenTH] [nvarchar](30) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202203251458566_InitialCreate', N'BoNuong.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDD6EE3B612BE3F40DF41D0D5E941D6CA4F77B127B05B649DE49CA09B1FACB38B73B7A025DA1156A254894A13147DB25EF491FA0A672851B2C41F89B215DB29165858E4F09BE170480E87C3FCF5C79FE39F9EC2C07AC449EA4764621F8D0E6D0B1337F27CB29CD8195DBC796FFFF4E377FF185F78E193F5A5A43B6174D092A413FB81D2F8D47152F70187281D85BE9B4469B4A023370A1DE445CEF1E1E1BF9DA3230703840D589635FE9411EA8738FF80CF69445C1CD30C05D7918783949743CD2C47B56E5088D318B978627F886EB2882C4705A56D9D053E0229663858D8162224A288828CA79F533CA30950CE622840C1FD738C816E81821473D94F57E4A6DD383C66DD70560D4B28374B6914F6043C3AE17A71C4E66B69D7AEF4069ABB000DD367D6EB5C7B13FBCAC379D1A7280005880C4FA741C28827F675C5E22C8D6F301D950D4705E4650270BF46C9B7511DF1C0326E7750D9D1F1E890FD3BB0A65940B3044F08CE68828203EB2E9B07BEFB337EBE8FBE613239399A2F4EDEBF7D87BC93773FE093B7F59E425F81AE510045774914E30464C38BAAFFB6E534DB3962C3AA59AD4DA115B0259812B6758D9E3E62B2A40F30598EDFDBD6A5FF84BDB2841BD767E2C30C824634C9E0F3260B02340F7055EFB4F264FFB7703D7EFB6E10AE37E8D15FE6432FF0878993C0BCFA8483BC367DF0E3627A35C6FB2B27BB4CA2907D37EDABA8FD3A8BB2C4659D89B424F7285962DA946EECAC8CD7C8A419D4F0665DA2EEBF69334965F35692B20EAD33134A16DB9E0DA5BC2FCBD7D8E2CEE218062F372DA69136836B6E5423A1E581C5EB572673646A3204BAF2775E012F42E407032C81065CC0F358F84988AB5E7E88C0E010E92DF31D4A535801BCFFA2F4A14574F83980E833EC660918E68CA2307E716E770F11C137593867F6BE3D5E830DCDFDAFD1257269945C10D66A63BC8F91FB2DCAE805F1CE11C59FA95B02B2CF7B3F340718449C33D7C5697A09C68CBD69048E75097845E8C9716F38B638EDDA059906C80FD53E88B08C7E2D49577E889A42F24534642A7FA44DD48FD1D22766A296A47A510B8A4E5139595F51199899A49C522F684ED0296741359887978FD0F02E5E0EBBFF3EDE669BB76E2DA8A971062B24FE0F26388165CCBB4394E284AC46C064DDD885B3900F1F63FAE27B53CEE90B0AB2A159AD351BF24560F8D990C3EEFF6CC8C584E247DF635E89C1C1A7240678237AF599AA7BCE09926D7B3A34BAB96DE6DB590374D3E52C4D23D7CF678122E4C503164DF9C187B3BAA317456FC40808740C0CDD675B1E9440DF6CD1A86EC9390E30C5D6995B8404A728759127AB113AE4F510ACDC511582AD22214DE1FE25F1044BC7096B84D821288599EA132A4F0B9FB87E8C824E2D092D0DB730D6F78A8758738E634C18C34E4D983057073E9800151F6150BA3434766A16D76E881AAF5537E65D2EEC6ADCA578C4566CB2C377D6D825F7DF5EC430DB35B605E36C57898900DA20DE2E0C949F554C0D403CB8EC9B810A27268D8172976A2B06DAD4D80E0CB4A9925767A0C511D574FC85F3EABE9967F3A0BCFD6DBD555D3BB0CD863EF6CC340BDF13DA50688113D93CCFE7AC123F51C5E10CE4E4E7B394BBBAA28930F019A6CD90CDCADF55FAA14E3B8868446D802B43EB00E5D77F129034A17A0857C6F25AA5E35E440FD832EED60ACBD77E01B666033276FD1AB446A8BF2C158DD3E8F451F5ACB206C9C88D0E0B351C8541888B57B3E3064AD1C56565C598F8C27DBCE15AC7F860B428A8C373D528A9ECCCE05A2A4DB35B4B2A87AC8F4BB6919604F749A3A5B233836B89DB68B792144E410FB760231535B7F081265B19E9A8769BAA6EEC149951BC60EC6852A8C6D7288E7DB2ACA554F1126B56E4534DDFCCFA271B850586E3A68A9CA34ADA8A138D12B4C4422DB006492FFD24A5E788A23962719EA9174A64CABD55B3FC972CEBDBA73C88E53E5052B3DF450BE1D2BEB1CFCA8E086F7F09BD0B99379387D01563AF6E6EB1F43614A04411B59F46411612BD73A56F5DDCDDD5DB172532C2D811E4979C274953928BDB54BBD1A0C813628001AAFC96F507490FA15375E975D695ADF344F5286560AA8EA20B56ED6CD0740E8CF140897E61FF71EA447899F9C49351EA00BCA827462D9F4102ABD599A336534EEA98CD1A734421AFA40E2954F590B29E3DD210B25EB1169E46A36A0A730E72BE481D5DAE354756648ED4A115D56B602B6416EBCC5115C925756045B539F62AD3445C40F778C7D29E56D6DAB28AC3EC667B9606E36556C361B6BCDA9D7D1DA856DC138BDFCA4B60BC7C2F2D497BA25BCB928AF8C56696A4C1D0AF388D9BEEE682D37A3DAFC76C5C5F3716F5B6EB7B3D5E3F7B7D51AB900E732249C5BD3AD40987B7313F48753F92914E5605896D956A840DFD39A5381C3182D1EC97601AF8982DDF25C13522FE02A7B448D9B08F0F8F8E85B736FBF3EEC549532F501C44758F5F9A63B685EC2BF28812F70125722EC4066F4356A05298F98A78F86962FF96B73ACD2316EC575E7C605DA59F89FF4B0615F74986ADDFE5DCCE6172E50D5E675482FEFE2A9E3D98ABFCEA7F5F8BA607D66D02D3E9D43A1414BDCEF0371F43F492A668BA81346B3F9178BDB3ADF10E41892ACC96F59F1DCC7D3AC8938352CA7F86E8E9FBBEA2299F156C84A8783A3014DE202AD43D0D58074BFB2CC0834F9A3F0BE8D759F533817544D33E11F0497F30F18180F93254B6DCE13EA4382C6D6349CAF5DC9960BD51B6E5AEF726290F7BA3892EE75AF7801B349F7A3317E595E5290FB6752AD29007C3DEA5DDBF78EEF1BEA41BAF9CF6DD66196F33B1B8E512E96F954FBC0719708A8C9EDD670D6FDBD674D1DF3D4FBDEC971BBC67C6C6B7F9DD67006FDBD87401E23D37B65E79BE7B666BBBDA3F776C69C65BE8CEB376E50424CD2D8E2A8ADC95955B84DCE1F83F8FC0080A8FB2784CA94E036B4B61ED60B822D133D5E79F898CA58923F19528DAD9F6EB2BDFF05B3BCB69DAD96AB236DB78F3F5BF9537A769E7ADC985DC453EB1321B5195E3DDB18EB5A54CBDA6FCE1464F3AD2D5BB7CD6D62BF9D7942E3C88521AB34773BBFC7AB2830751C99053A74736B07C510C7B67ED6F2EC2FE9DFACB1504FB0B8C04BB8D5DB3A2B9228BA8DCBC05894A122142738D29F2604B3D4BA8BF402E856A1680CE5F83E7413D760D32C7DE15B9CD689C51E8320EE74123E0C59C8036FE79CA7353E6F16DCCBED221BA0062FA2C707F4B3E647EE055725F2A62421A08E65DF0702F1B4BCAC2BECBE70AE9262286405C7D9553748FC33800B0F496CCD0235E473630BF8F7889DCE755045007D23D104DB58FCF7DB44C5098728C557BF8041BF6C2A71FFF0FD226FA3B7A540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'ADMIN')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'USER')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8f81e033-6510-4158-b034-49c8988c1909', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a28e28e3-61b8-4f98-83e1-da65d2b7d9f9', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd3811927-d8f5-44e5-8286-1547ad229e42', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address]) VALUES (N'0467da99-30d6-43b4-9eaa-0e3c03107c77', N'ntt.it.hutech@gmail.com', 0, N'APUXUGP9ewfwI2HdptJXOCcbijuqdcOzyBANjy6CTbR9tfcO6iQFNwS6IQXSuxzVIg==', N'37a5784c-75d6-4227-929f-27b819e744aa', N'123123123', 0, 0, NULL, 1, 0, N'ntt.it.hutech@gmail.com', N'ntt', N'aaaaaaa')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address]) VALUES (N'36c6b962-2262-4343-8ccc-89ddf3edb176', N'meowsliru@gmail.com', 0, N'AEGRS0h8LMvV4r4cjvLL03W/h0yxpk1NvgZZAQkh+Rhioh43z1JlyJo4U1T/rges/A==', N'a23b7004-6b65-4959-93ee-e89f403e37e3', N'0123345567', 0, 0, NULL, 1, 0, N'meowsliru@gmail.com', N'Doan thien quy', N'Lien tinh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address]) VALUES (N'8f81e033-6510-4158-b034-49c8988c1909', N'admin@admin.com', 0, N'ABW+9n2IYumyNDEPS3woZ2Cyjg0BlyL1pa/zDJUuSi6Kn2Vhz/8JUvxVu3pw8asUeA==', N'56bca8f2-0784-4f75-85ef-69f405d50aff', N'0987654321', 0, 0, NULL, 1, 0, N'admin@admin.com', N'Phù Nhựt Huỳnh', N'Saigon')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address]) VALUES (N'a28e28e3-61b8-4f98-83e1-da65d2b7d9f9', N'lhpt@gmail.com', 0, N'AEYjQRPoScyDQfimLSd4raB//hL0FYQTnFWBerGIk+o6eZVc14E4cRAV+1zOEagXUw==', N'25aa50a2-92ba-4a1c-88f7-5e80f68d3e38', N'+84582967750', 0, 0, NULL, 1, 0, N'lhpt@gmail.com', N'Le Huynh Phuong Tung', N'181/7 Lien tinh 6')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address]) VALUES (N'cabef020-2823-43a1-af53-8d96eb076642', N'phudong@gmail.com', 0, N'AD3mZuRyQ1UmJLfqnnN9nzKc5/Fe6ns/6JFlXtvLl5GMRW0J0a16sXd/pwSpiDQvSw==', N'6d3ea568-2b9e-41ee-a086-6dd57dea1d5b', N'0987654321', 0, 0, NULL, 1, 0, N'phudong@gmail.com', N'Phu Dong', N'SG')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address]) VALUES (N'd3811927-d8f5-44e5-8286-1547ad229e42', N'tung@gmail.com', 0, N'ALp3ope7d5eOv4Il/aDvrnEAbmCoFANEBA8T8+h3z5lEPE3NphZXGHBHUofSZmw5zQ==', N'f5480c3c-ae87-4178-b801-d11eeb37b487', N'123345567', 0, 0, NULL, 1, 0, N'tung@gmail.com', N'Lê Huỳnh Phương Tùng', N'Lien tinh ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address]) VALUES (N'db9124a5-d3aa-4ea6-961f-ca0bbea40b81', N'adminxyz@admin.com', 0, N'ABpMdqf9pKFst7LmwHLdt1y8TiaG5CwgPZor6bCcsphkmi5YZII1txYa+SxVkV8XHw==', N'ff4daa0d-edf6-4338-8d56-8f594f30a947', N'0987654321', 0, 0, NULL, 1, 0, N'adminxyz@admin.com', N'Phu Dong Danh', N'SG')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Name], [Address]) VALUES (N'de1fc1f6-4e49-4579-82fb-e827ea94bdf9', N'phudongdanh@gmail.com', 0, N'AHwxvxY10rkcaev3C+h7F6iGnE3jalXVzMUhUFFSG0NwuVlg8cZsuFN7gRd+0i2LcA==', N'ea2171e6-d7fe-488b-b949-2babcee4fb7d', N'0987654321', 0, 0, NULL, 1, 0, N'phudongdanh@gmail.com', N'Phu Dong Danh asdsadas', N'SG')
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([MaBinhLuan], [NoiDung], [MaSP], [MaKH], [NgayTao]) VALUES (6, N'chào bạn ', 174, N'd3811927-d8f5-44e5-8286-1547ad229e42', CAST(N'2022-05-12 13:36:07.793' AS DateTime))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [NoiDung], [MaSP], [MaKH], [NgayTao]) VALUES (7, N'ADDUUU ', 176, N'36c6b962-2262-4343-8ccc-89ddf3edb176', CAST(N'2022-05-27 13:28:06.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (174, 13, 3, 89670000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (174, 19, 1, 29890000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (174, 20, 1, 29890000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (174, 1032, 1, 29890000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (175, 16, 1, 37500000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (175, 17, 1, 37500000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (175, 20, 1, 37500000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (175, 1029, 1, 37500000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (175, 1030, 1, 37500000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (176, 15, 1, 74900000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (176, 19, 1, 74900000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (176, 1031, 1, 74900000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (177, 15, 1, 63490000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (178, 1033, 1, 17990000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (180, 1033, 1, 12490000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (189, 18, 2, 77980000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (204, 52, 50, 25000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (204, 53, 100, 50000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (204, 1028, 1, 500)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (206, 52, 100, 100000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (206, 53, 100, 100000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (206, 1027, 3, 3000)
INSERT [dbo].[ChiTietDonHang] ([MaSP], [MaDH], [Soluong], [Gia]) VALUES (206, 1028, 10, 10000)
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (13, 0, CAST(N'2022-05-09' AS Date), CAST(N'2022-05-12' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 89670000, 0)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (15, 1, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-12' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 138390000, 1)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (16, 1, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-12' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 37500000, 1)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (17, 0, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-21' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 37500000, 0)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (18, 0, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-21' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 77980000, 1)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (19, 0, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-24' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 104790000, 1)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (20, 0, CAST(N'2022-05-26' AS Date), CAST(N'2022-05-26' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 67390000, 0)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (52, 0, CAST(N'2022-05-27' AS Date), CAST(N'2022-05-27' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 125000, 1)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (53, 0, CAST(N'2022-05-27' AS Date), CAST(N'2022-05-27' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 150000, 1)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (1027, 0, CAST(N'2022-05-27' AS Date), CAST(N'2022-05-27' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 3000, 1)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (1028, 0, CAST(N'2022-05-27' AS Date), CAST(N'2022-05-27' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 10500, 1)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (1029, 0, CAST(N'2022-05-27' AS Date), CAST(N'2022-05-27' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 37500000, 0)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (1030, 0, CAST(N'2022-05-29' AS Date), CAST(N'2022-05-29' AS Date), N'd3811927-d8f5-44e5-8286-1547ad229e42', 37500000, 0)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (1031, 0, CAST(N'2022-05-29' AS Date), CAST(N'2022-06-02' AS Date), N'0467da99-30d6-43b4-9eaa-0e3c03107c77', 74900000, 0)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (1032, 0, CAST(N'2022-05-29' AS Date), CAST(N'2022-05-29' AS Date), N'0467da99-30d6-43b4-9eaa-0e3c03107c77', 29890000, 0)
INSERT [dbo].[DonHang] ([MaDH], [TrangThaiGiaoHang], [NgayDat], [NgayGiao], [MaKH], [TongTien], [TrangThaiThanhToan]) VALUES (1033, 0, CAST(N'2022-05-29' AS Date), CAST(N'2022-05-29' AS Date), N'0467da99-30d6-43b4-9eaa-0e3c03107c77', 30480000, 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (8, N'Điện thoại')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (9, N'Laptop')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (10, N'Tablet')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (11, N'Khác')
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
SET IDENTITY_INSERT [dbo].[NhomSanPham] ON 

INSERT [dbo].[NhomSanPham] ([MaNhom], [TenNhom]) VALUES (1, N'Văn phòng')
INSERT [dbo].[NhomSanPham] ([MaNhom], [TenNhom]) VALUES (2, N'Gaming')
SET IDENTITY_INSERT [dbo].[NhomSanPham] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (174, 9, N'Laptop Apple MacBook Air M1 2020', N'demo', 29890000, 4, 0, N'/Content/images/macbook-air-m1-2020-gray-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (175, 9, N'Laptop Apple MacBook Pro M1 2020', N'demo 1', 37500000, 40, 0, N'/Content/images/macbook-pro-m1-2020-gray-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (176, 9, N'Laptop MacBook Pro 14 M1 Max 2021', N'demo 2', 74900000, 29, 0, N'/Content/images/macbook-pro-14-m1-max-2021-10-core-cpu-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (177, 9, N'Laptop Apple MacBook Pro 16 M1 Pro 2021', N'demo 3', 63490000, 12, 0, N'/Content/images/apple-macbook-pro-16-m1-pro-2021-10-core-cpu-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (178, 9, N'Laptop HP 240 G8 i5 1135G7', N'asdasdsadasdasd', 17990000, 22, 0, N'/Content/images/hp-240-g8-i5-518v7pa-091221-015139-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (179, 9, N'Laptop HP Gaming VICTUS 16 e0170AX R7 5800H', N'asdasdsadasdasd', 27990000, 18, 0, N'/Content/images/hp-gaming-victus-16-e0170ax-r7-4r0u7pa-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (180, 9, N'Laptop HP 15s du1108TU i3 10110U', N'asdasdsadasdasd', 12490000, 19, 0, N'/Content/images/hp-15s-du1108tu-i3-10110u-4gb-256gb-win11-2z6l7pa-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (181, 9, N'Laptop HP EliteBook X360 1040 G8 i7 1165G7', N'asdasdsadasdasd', 46890000, 36, 0, N'/Content/images/hp-elitebook-x360-1040-g8-i7-3g1h4pa-18-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (182, 9, N'Laptop Asus TUF Gaming FX517ZC i5 12450H', N'asdasdsadasdasd', 27990000, 54, 0, N'/Content/images/asus-tuf-gaming-fx517zc-i5-hn077w-190322-114627-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (183, 9, N'Laptop Asus VivoBook A415EA i3 1125G4', N'asdasdsadasdasd', 14990000, 34, 0, N'/Content/images/asus-vivobook-a415ea-i3-1125g4-8gb-512gb-win11-eb1748w-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (184, 9, N'Laptop Asus ZenBook UX425EA i5 1135G7', N'asdasdsadasdasd', 22990000, 23, 0, N'/Content/images/asus-zenbook-ux425ea-i5-1135g7-8gb-512gb-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (185, 9, N'Laptop Asus TUF Gaming FX506LH i5 10300H', N'asdasdsadasdasd', 21990000, 10, 0, N'/Content/images/asus-tuf-gaming-fx506lh-i5-hn188w-120122-121947-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (186, 9, N'Laptop Lenovo Ideapad 3 15ITL6 i5 1135G7', N'asdasdsadasdasd', 16490000, 12, 0, N'/Content/images/lenovo-ideapad-3-15itl6-i5-82h801p9vn-thumb-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (187, 9, N'Laptop Lenovo Ideapad 5 15ITL05 i5 1135G7', N'asdasdsadasdasd', 17990000, 13, 0, N'/Content/images/lenovo-ideapad-5-15itl05-i5-82fg01h7vn-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (188, 9, N'Laptop Lenovo ThinkBook 14p G2 ACH R5 5600H', N'asdasdsadasdasd', 25990000, 42, 0, N'/Content/images/thinkbook-14p-g2-ach-r5-20yn001hvn-020322-104832-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 4, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (189, 9, N'Laptop Lenovo Gaming Legion 5 15ITH6 i7 11800H', N'asdasdsadasdasd', 38990000, 30, 0, N'/Content/images/lenovo-gaming-legion-5-15ith6-i7-82jk00fnvn-180322-100552-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (190, 9, N'Laptop Acer Nitro 5 Gaming AN515 57 5831 i5 11400H', N'asdasdsadasdasd', 32990000, 65, 0, N'/Content/images/acer-nitro-5-gaming-an515-57-720a-i7-nhqeqsv004-171121-024959-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (191, 9, N'Laptop Acer Nitro 5 Gaming AN515 57 54MV i5 11400H', N'asdasdsadasdasd', 23840000, 44, 0, N'/Content/images/acer-nitro-5-gaming-an515-57-54mv-i5-11400h-8gb-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (192, 9, N'Laptop Acer Predator Triton 300', N'asdasdsadasdasd', 50990000, 33, 0, N'/Content/images/acer-predator-triton-300-pt315-53-71dj-i7-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (193, 9, N'Laptop Acer Nitro 5 AN515 45 R9SC R7 5800H', N'asdasdsadasdasd', 39990000, 23, 0, N'/Content/images/acer-nitro-5-an515-45-r9sc-r7-5800h-8gb-512gb-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, 2)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (194, 9, N'Laptop Acer Predator Helios PH315 54 75YD i7', N'asdasdsadasdasd', 39990000, 41, 0, N'/Content/images/acer-predator-helios-ph315-54-75yd-i7-nhqc2sv002-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (195, 8, N'Điện thoại Samsung Galaxy S22 Ultra 5G 128GB', N'asdasdsadasdasd', 30990000, 23, 0, N'/Content/images/Galaxy-S22-Ultra-Burgundy-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (196, 8, N'Điện thoại iPhone 11 64GB', N'asdasdsadasdasd', 14990000, 65, 0, N'/Content/images/iphone-xi-do-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (197, 8, N'Điện thoại Reno7 Pro', N'asdasdsadasdasd', 18990000, 30, 0, N'/Content/images/oppo-reno7-z-5g-thumb-1-1-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 7, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (198, 8, N'Điện thoại Xiaomi 11T 5G 128GB', N'asdasdsadasdasd', 10990000, 74, 0, N'/Content/images/Xiaomi-11T-White-1-2-3-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 9, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (199, 8, N'Điện thoại Realme C35 64GB', N'asdasdsadasdasd', 14990000, 34, 0, N'/Content/images/realme-c35-thumb-new-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 10, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (200, 10, N'Máy tính bảng Samsung Galaxy Tab S7', N'asdasdsadasdasd', 18990000, 34, 0, N'/Content/images/samsung-galaxy-tab-s7-thumb-xanh-600x600-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (201, 10, N'Máy tính bảng iPad Air 4 Wifi Cellular 64GB (2020)', N'asdasdsadasdasd', 17450000, 4, 0, N'/Content/images/ipad-4-cellular-den-new-600x600-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (202, 10, N'Máy tính bảng Huawei MatePad 11', N'asdasdsadasdasd', 12990000, 5, 0, N'/Content/images/huawei-matepad-11-9-1-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 8, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (203, 10, N'Máy tính bảng Lenovo Tab P11 Plus', N'asdasdsadasdasd', 8190000, 9, 0, N'/Content/images/lenovo-tab-p11-plus-2-600x600.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (204, 8, N'sản phẩm 1', N'asdasd', 500, 735, 0, N'/Content/images/Chi ti?t s?n ph?m.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoai], [Ten], [MoTa], [Gia], [SoLuong], [GiamGia], [Hinh], [CPU], [ManHinh], [RAM], [OCung], [VGA], [HDH], [Mau], [BaoHang], [MaTH], [MaNhom]) VALUES (206, 8, N'sản phẩm 2', N'asdasdas', 1000, 468, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (1, N'Apple')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (2, N'Hp')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (3, N'Asus')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (4, N'Lenovo')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (5, N'Acer')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (6, N'Samsung')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (7, N'Oppo')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (8, N'Huawei')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (9, N'Xiaomi')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH]) VALUES (10, N'Realme')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 29/05/2022 01:11:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 29/05/2022 01:11:43 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 29/05/2022 01:11:43 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 29/05/2022 01:11:43 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 29/05/2022 01:11:43 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 29/05/2022 01:11:43 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_AspNetUsers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_AspNetUsers]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_AspNetUsers] FOREIGN KEY([MaKH])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_AspNetUsers]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhomSanPham] FOREIGN KEY([MaNhom])
REFERENCES [dbo].[NhomSanPham] ([MaNhom])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhomSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHieu] FOREIGN KEY([MaTH])
REFERENCES [dbo].[ThuongHieu] ([MaTH])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHieu]
GO
USE [master]
GO
ALTER DATABASE [Webcoso] SET  READ_WRITE 
GO
