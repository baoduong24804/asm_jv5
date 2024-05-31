USE [asm_v1]
GO
/****** Object:  Table [dbo].[chitietnguoidung]    Script Date: 5/31/2024 7:30:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietnguoidung](
	[idchitiet] [int] NOT NULL,
	[user_id] [int] NULL,
	[idphim] [int] NULL,
	[is_like] [bit] NULL,
	[vote] [int] NULL,
	[cmt] [nvarchar](255) NULL,
 CONSTRAINT [PK_chitietnguoidung] PRIMARY KEY CLUSTERED 
(
	[idchitiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitietphim]    Script Date: 5/31/2024 7:30:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitietphim](
	[idphim] [int] NOT NULL,
	[tongsotap] [int] NULL,
	[thoigian] [int] NULL,
	[tapmoinhat] [int] NULL,
	[chatluong] [varchar](10) NULL,
	[mota] [nvarchar](1000) NULL,
	[ngaychinhsua] [datetime] NULL,
	[tengoc] [varchar](255) NULL,
 CONSTRAINT [PK_chitietphim] PRIMARY KEY CLUSTERED 
(
	[idphim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 5/31/2024 7:30:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoidung](
	[user_id] [int] NOT NULL,
	[username] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[role] [bit] NULL,
	[ngaytao] [datetime] NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK__nguoidun__B9BE370F6F8001EA] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhasxvadienvien]    Script Date: 5/31/2024 7:30:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhasxvadienvien](
	[idnhasxdienvien] [int] NOT NULL,
	[idphim] [int] NULL,
	[vaitro] [int] NULL,
	[ten] [nvarchar](255) NULL,
 CONSTRAINT [PK_nhasxvadienvien] PRIMARY KEY CLUSTERED 
(
	[idnhasxdienvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phanloai]    Script Date: 5/31/2024 7:30:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phanloai](
	[idphanloai] [int] NOT NULL,
	[idphim] [int] NULL,
	[loaiphim] [nvarchar](50) NULL,
	[theloai] [nvarchar](50) NULL,
	[quocgia] [nvarchar](50) NULL,
	[nam] [int] NULL,
 CONSTRAINT [PK_phanloai] PRIMARY KEY CLUSTERED 
(
	[idphanloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phim]    Script Date: 5/31/2024 7:30:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phim](
	[idphim] [int] NOT NULL,
	[tieude] [nvarchar](250) NULL,
	[slug] [varchar](255) NULL,
	[thumb_url] [varchar](255) NULL,
	[ngaytao] [datetime] NULL,
	[poster_url] [varchar](255) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK__phim__533E685E7F05B074] PRIMARY KEY CLUSTERED 
(
	[idphim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tapphim]    Script Date: 5/31/2024 7:30:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tapphim](
	[idtapphim] [int] NOT NULL,
	[idphim] [int] NULL,
	[server] [varchar](50) NULL,
	[tentap] [nvarchar](255) NULL,
	[slug] [varchar](255) NULL,
	[link] [varchar](255) NULL,
	[link2] [varchar](255) NULL,
 CONSTRAINT [PK_tapphim] PRIMARY KEY CLUSTERED 
(
	[idtapphim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yeuthich]    Script Date: 5/31/2024 7:30:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yeuthich](
	[idyeuthich] [int] NOT NULL,
	[user_id] [int] NULL,
	[idphim] [int] NULL,
 CONSTRAINT [PK_yeuthich] PRIMARY KEY CLUSTERED 
(
	[idyeuthich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [tengoc]) VALUES (1, 120, 250, 100, N'HDok', N'khong cook', CAST(N'2024-02-02T00:00:00.000' AS DateTime), N'phim 1ok')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [tengoc]) VALUES (2, 12, 22, 5, N'Cam', N'ko co', CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'phim 2')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [tengoc]) VALUES (8, 0, 0, 0, NULL, NULL, CAST(N'2024-05-23T23:05:53.103' AS DateTime), NULL)
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [tengoc]) VALUES (9, 0, 0, 0, NULL, NULL, CAST(N'2024-05-23T23:41:02.737' AS DateTime), NULL)
GO
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (2, N'tybao', N'tybao5cm@gmail.com', N'123456', 1, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (6, N'ddd', N'ngoczig11@gmail.com', N'W6f3z', 0, CAST(N'2024-05-23T13:47:13.800' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (7, N'ddd', N'ngoczig111@gmail.com', N'123', 0, CAST(N'2024-05-23T13:47:59.783' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (8, N'ddd', N'ngoczig1111@gmail.com', N'123', 0, CAST(N'2024-05-23T13:48:32.567' AS DateTime), 1)
GO
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (1, N'phim 1', N'phim-1', N'hehe.jpg', CAST(N'2024-05-22T00:00:00.000' AS DateTime), N'po.png', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (2, N'Tiêu đề phim 22', N'slug-phim-22', N'https://example.com2', CAST(N'2024-05-23T00:00:00.000' AS DateTime), N'https://example.com2', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (3, N'Tiêu đề phim 2', N'slug-phim-2', N'https://example.com/thumb2.jpg', CAST(N'2024-05-22T00:00:00.000' AS DateTime), N'https://example.com/poster2.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (5, N'Tiêu đề phim 3', N'slug-phim-3', N'https://example.com/thumb3.jpg', CAST(N'2024-05-21T00:00:00.000' AS DateTime), N'https://example.com/poster3.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (6, N'Tiêu đề phim 4', N'slug-phim-4', N'https://example.com/thumb4.jpg', CAST(N'2024-05-20T00:00:00.000' AS DateTime), N'https://example.com/poster4.jpg', 0)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (7, N'Tiêu đề phim 5', N'slug-phim-5', N'https://example.com/thumb5.jpg', CAST(N'2024-05-19T00:00:00.000' AS DateTime), N'https://example.com/poster5.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (8, N'Tiêu đề phim 99', N'slug-phim-99', N'111', CAST(N'2024-05-23T23:05:53.103' AS DateTime), N'111', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (9, N'phim moi 2024', N'tap-1', N'https://example.com2', CAST(N'2024-05-23T23:41:02.737' AS DateTime), N'https://example.com2', 1)
GO
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (1, 1, N'Server1ok', N'Tập 1ok', N'tap-1ok', N'http://example.com/link1ok', N'http://example.com/link2-1ok')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (2, 1, N'Server2', N'Tập  2', N'tap-2', N'http://example.com/link2', N'http://example.com/link2-2')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (3, 1, N'Server3', N'Tập  3', N'tap-3', N'http://example.com/link3', N'http://example.com/link3-3')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (4, 1, N'Server4', N'Tập  4', N'tap-4', N'http://example.com/link4', N'http://example.com/link4-4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (5, 1, N'Server5', N'Tập 5 moi', N'tap-5-new', N'http://example.com/link5cu', N'http://example.com/link5-5new')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (6, 2, N'Server1', N'Tập  1', N'tap-1', N'http://example.com/link1', N'http://example.com/link2-1')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (7, 2, N'Server2', N'Tập  2', N'tap-2', N'http://example.com/link2', N'http://example.com/link2-2')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (8, 3, N'Server3', N'Tập  3', N'tap-3', N'http://example.com/link3', N'http://example.com/link3-3')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (9, 3, N'Server4', N'Tập 4', N'tap-4', N'http://example.com/link4', N'http://example.com/link4-4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (10, 3, N'Server5', N'Tập  5', N'tap-5', N'http://example.com/link5', N'http://example.com/link5-5')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (11, NULL, N'gg', N'gg', N'gg', N'gg', N'gg')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (12, NULL, N'gg', N'gg', N'gg', N'gg', N'gg')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (13, NULL, N'gg', N'gg', N'gg', N'gg', N'gg')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (14, 5, N'gg', N'gg', N'gg', N'gg', N'gg')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (15, 5, N'HD', N'Tập 6', N'tap-6', N'tap6/phim', N'tap66/phim')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (16, 1, N'sv1', N'tap 6', N'slug-phim-6', N'http://example.com/link6ok', N'http://example.com/link6-5new')
GO
ALTER TABLE [dbo].[chitietnguoidung]  WITH CHECK ADD  CONSTRAINT [FK__chitietng__idphi__7A672E12] FOREIGN KEY([idphim])
REFERENCES [dbo].[phim] ([idphim])
GO
ALTER TABLE [dbo].[chitietnguoidung] CHECK CONSTRAINT [FK__chitietng__idphi__7A672E12]
GO
ALTER TABLE [dbo].[chitietnguoidung]  WITH CHECK ADD  CONSTRAINT [FK__chitietng__user___797309D9] FOREIGN KEY([user_id])
REFERENCES [dbo].[nguoidung] ([user_id])
GO
ALTER TABLE [dbo].[chitietnguoidung] CHECK CONSTRAINT [FK__chitietng__user___797309D9]
GO
ALTER TABLE [dbo].[chitietphim]  WITH CHECK ADD  CONSTRAINT [FK__chitietph__idphi__70DDC3D8] FOREIGN KEY([idphim])
REFERENCES [dbo].[phim] ([idphim])
GO
ALTER TABLE [dbo].[chitietphim] CHECK CONSTRAINT [FK__chitietph__idphi__70DDC3D8]
GO
ALTER TABLE [dbo].[nhasxvadienvien]  WITH CHECK ADD  CONSTRAINT [FK_nhasxvadienvien_phim] FOREIGN KEY([idphim])
REFERENCES [dbo].[phim] ([idphim])
GO
ALTER TABLE [dbo].[nhasxvadienvien] CHECK CONSTRAINT [FK_nhasxvadienvien_phim]
GO
ALTER TABLE [dbo].[phanloai]  WITH CHECK ADD  CONSTRAINT [FK_phanloai_phim] FOREIGN KEY([idphim])
REFERENCES [dbo].[phim] ([idphim])
GO
ALTER TABLE [dbo].[phanloai] CHECK CONSTRAINT [FK_phanloai_phim]
GO
ALTER TABLE [dbo].[tapphim]  WITH CHECK ADD  CONSTRAINT [FK__tapphim__idphim__72C60C4A] FOREIGN KEY([idphim])
REFERENCES [dbo].[phim] ([idphim])
GO
ALTER TABLE [dbo].[tapphim] CHECK CONSTRAINT [FK__tapphim__idphim__72C60C4A]
GO
ALTER TABLE [dbo].[yeuthich]  WITH CHECK ADD  CONSTRAINT [FK__yeuthich__idphim__778AC167] FOREIGN KEY([idphim])
REFERENCES [dbo].[phim] ([idphim])
GO
ALTER TABLE [dbo].[yeuthich] CHECK CONSTRAINT [FK__yeuthich__idphim__778AC167]
GO
ALTER TABLE [dbo].[yeuthich]  WITH CHECK ADD  CONSTRAINT [FK__yeuthich__user_i__76969D2E] FOREIGN KEY([user_id])
REFERENCES [dbo].[nguoidung] ([user_id])
GO
ALTER TABLE [dbo].[yeuthich] CHECK CONSTRAINT [FK__yeuthich__user_i__76969D2E]
GO
