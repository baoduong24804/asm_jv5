USE [asm_v1]
GO
/****** Object:  Table [dbo].[chitietnguoidung]    Script Date: 6/2/2024 6:22:10 PM ******/
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
/****** Object:  Table [dbo].[chitietphim]    Script Date: 6/2/2024 6:22:10 PM ******/
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
	[idnhasxvadv] [int] NULL,
	[idphanloai] [int] NULL,
	[tengoc] [varchar](255) NULL,
 CONSTRAINT [PK_chitietphim] PRIMARY KEY CLUSTERED 
(
	[idphim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoidung]    Script Date: 6/2/2024 6:22:10 PM ******/
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
/****** Object:  Table [dbo].[nhasxvadienvien]    Script Date: 6/2/2024 6:22:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhasxvadienvien](
	[idnhasxvadv] [int] NOT NULL,
	[idphim] [int] NULL,
	[vaitro] [int] NULL,
	[ten] [nvarchar](255) NULL,
 CONSTRAINT [PK_nhasxvadienvien] PRIMARY KEY CLUSTERED 
(
	[idnhasxvadv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phanloai]    Script Date: 6/2/2024 6:22:10 PM ******/
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
/****** Object:  Table [dbo].[phim]    Script Date: 6/2/2024 6:22:10 PM ******/
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
/****** Object:  Table [dbo].[tapphim]    Script Date: 6/2/2024 6:22:10 PM ******/
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
/****** Object:  Table [dbo].[yeuthich]    Script Date: 6/2/2024 6:22:10 PM ******/
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
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (1, 1, 1, 1, 5, N'Tuyệt vời!')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (2, 2, 2, 1, 4, N'Rất hay')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (3, 3, 3, 0, 3, N'Bình thường')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (4, 4, 4, 1, 5, N'Xuất sắc!')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (5, 5, 5, 0, 2, N'Không hay lắm')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (6, 6, 6, 1, 5, N'Phim hay nhất năm')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (7, 7, 7, 1, 4, N'Rất đáng xem')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (8, 8, 8, 0, 3, N'Tạm được')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (9, 9, 9, 1, 4, N'Khá hay')
INSERT [dbo].[chitietnguoidung] ([idchitiet], [user_id], [idphim], [is_like], [vote], [cmt]) VALUES (10, 10, 10, 1, 5, N'Hoàn hảo')
GO
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (1, 12, 120, 12, N'HD', N'Phim hành động hấp dẫn', CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1, 1, N'Action Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (2, 24, 240, 24, N'FullHD', N'Phim tình cảm lãng mạn', CAST(N'2024-01-02T00:00:00.000' AS DateTime), 2, 2, N'Romantic Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (3, 16, 160, 16, N'SD', N'Phim kinh dị hồi hộp', CAST(N'2024-01-03T00:00:00.000' AS DateTime), 3, 3, N'Horror Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (4, 10, 100, 10, N'HD', N'Phim hài vui nhộn', CAST(N'2024-01-04T00:00:00.000' AS DateTime), 4, 4, N'Comedy Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (5, 20, 200, 20, N'FullHD', N'Phim viễn tưởng khoa học', CAST(N'2024-01-05T00:00:00.000' AS DateTime), 5, 5, N'Sci-Fi Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (6, 8, 80, 8, N'HD', N'Phim hoạt hình dễ thương', CAST(N'2024-01-06T00:00:00.000' AS DateTime), 6, 6, N'Animation Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (7, 15, 150, 15, N'SD', N'Phim tài liệu bổ ích', CAST(N'2024-01-07T00:00:00.000' AS DateTime), 7, 7, N'Documentary Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (8, 22, 220, 22, N'FullHD', N'Phim hành động võ thuật', CAST(N'2024-01-08T00:00:00.000' AS DateTime), 8, 8, N'Martial Arts Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (9, 18, 180, 18, N'HD', N'Phim chiến tranh kịch tính', CAST(N'2024-01-09T00:00:00.000' AS DateTime), 9, 9, N'War Movie')
INSERT [dbo].[chitietphim] ([idphim], [tongsotap], [thoigian], [tapmoinhat], [chatluong], [mota], [ngaychinhsua], [idnhasxvadv], [idphanloai], [tengoc]) VALUES (10, 14, 140, 14, N'SD', N'Phim cổ trang lịch sử', CAST(N'2024-01-10T00:00:00.000' AS DateTime), 10, 10, N'Historical Movie')
GO
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (1, N'user1', N'user1@example.com', N'password1', 1, CAST(N'2024-01-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (2, N'user2', N'user2@example.com', N'password2', 0, CAST(N'2024-01-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (3, N'user3', N'user3@example.com', N'password3', 1, CAST(N'2024-01-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (4, N'user4', N'user4@example.com', N'password4', 0, CAST(N'2024-01-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (5, N'user5', N'user5@example.com', N'password5', 1, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (6, N'user6', N'user6@example.com', N'password6', 0, CAST(N'2024-01-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (7, N'user7', N'user7@example.com', N'password7', 1, CAST(N'2024-01-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (8, N'user8', N'user8@example.com', N'password8', 0, CAST(N'2024-01-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (9, N'user9', N'user9@example.com', N'password9', 1, CAST(N'2024-01-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoidung] ([user_id], [username], [email], [password], [role], [ngaytao], [active]) VALUES (10, N'user10', N'user10@example.com', N'password10', 0, CAST(N'2024-01-10T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (1, 1, 1, N'Nhà sản xuất 1')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (2, 2, 2, N'Nhà sản xuất 2')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (3, 3, 1, N'Nhà sản xuất 3')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (4, 4, 2, N'Nhà sản xuất 4')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (5, 5, 1, N'Nhà sản xuất 5')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (6, 6, 2, N'Nhà sản xuất 6')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (7, 7, 1, N'Nhà sản xuất 7')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (8, 8, 2, N'Nhà sản xuất 8')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (9, 9, 1, N'Nhà sản xuất 9')
INSERT [dbo].[nhasxvadienvien] ([idnhasxvadv], [idphim], [vaitro], [ten]) VALUES (10, 10, 2, N'Nhà sản xuất 10')
GO
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (1, 1, N'Điện ảnh', N'Hành động', N'Mỹ', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (2, 2, N'Điện ảnh', N'Tình cảm', N'Hàn Quốc', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (3, 3, N'Điện ảnh', N'Kinh dị', N'Nhật Bản', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (4, 4, N'Điện ảnh', N'Hài', N'Mỹ', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (5, 5, N'Điện ảnh', N'Viễn tưởng', N'Anh', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (6, 6, N'Điện ảnh', N'Hoạt hình', N'Mỹ', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (7, 7, N'Điện ảnh', N'Tài liệu', N'Pháp', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (8, 8, N'Điện ảnh', N'Võ thuật', N'Trung Quốc', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (9, 9, N'Điện ảnh', N'Chiến tranh', N'Nga', 2024)
INSERT [dbo].[phanloai] ([idphanloai], [idphim], [loaiphim], [theloai], [quocgia], [nam]) VALUES (10, 10, N'Điện ảnh', N'Lịch sử', N'Việt Nam', 2024)
GO
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (1, N'Phim hành động', N'phim-hanh-dong', N'thumb1.jpg', CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'poster1.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (2, N'Phim tình cảm', N'phim-tinh-cam', N'thumb2.jpg', CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'poster2.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (3, N'Phim kinh dị', N'phim-kinh-di', N'thumb3.jpg', CAST(N'2024-01-03T00:00:00.000' AS DateTime), N'poster3.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (4, N'Phim hài', N'phim-hai', N'thumb4.jpg', CAST(N'2024-01-04T00:00:00.000' AS DateTime), N'poster4.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (5, N'Phim viễn tưởng', N'phim-vien-tuong', N'thumb5.jpg', CAST(N'2024-01-05T00:00:00.000' AS DateTime), N'poster5.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (6, N'Phim hoạt hình', N'phim-hoat-hinh', N'thumb6.jpg', CAST(N'2024-01-06T00:00:00.000' AS DateTime), N'poster6.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (7, N'Phim tài liệu', N'phim-tai-lieu', N'thumb7.jpg', CAST(N'2024-01-07T00:00:00.000' AS DateTime), N'poster7.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (8, N'Phim võ thuật', N'phim-vo-thuat', N'thumb8.jpg', CAST(N'2024-01-08T00:00:00.000' AS DateTime), N'poster8.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (9, N'Phim chiến tranh', N'phim-chien-tranh', N'thumb9.jpg', CAST(N'2024-01-09T00:00:00.000' AS DateTime), N'poster9.jpg', 1)
INSERT [dbo].[phim] ([idphim], [tieude], [slug], [thumb_url], [ngaytao], [poster_url], [active]) VALUES (10, N'Phim lịch sử', N'phim-lich-su', N'thumb10.jpg', CAST(N'2024-01-10T00:00:00.000' AS DateTime), N'poster10.jpg', 1)
GO
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (1, 1, N'server1', N'Tập 1', N'tap-1', N'link1.mp4', N'link1_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (2, 2, N'server2', N'Tập 2', N'tap-2', N'link2.mp4', N'link2_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (3, 3, N'server3', N'Tập 3', N'tap-3', N'link3.mp4', N'link3_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (4, 4, N'server4', N'Tập 4', N'tap-4', N'link4.mp4', N'link4_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (5, 5, N'server5', N'Tập 5', N'tap-5', N'link5.mp4', N'link5_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (6, 6, N'server6', N'Tập 6', N'tap-6', N'link6.mp4', N'link6_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (7, 7, N'server7', N'Tập 7', N'tap-7', N'link7.mp4', N'link7_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (8, 8, N'server8', N'Tập 8', N'tap-8', N'link8.mp4', N'link8_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (9, 9, N'server9', N'Tập 9', N'tap-9', N'link9.mp4', N'link9_backup.mp4')
INSERT [dbo].[tapphim] ([idtapphim], [idphim], [server], [tentap], [slug], [link], [link2]) VALUES (10, 10, N'server10', N'Tập 10', N'tap-10', N'link10.mp4', N'link10_backup.mp4')
GO
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (1, 1, 1)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (2, 2, 2)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (3, 3, 3)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (4, 4, 4)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (5, 5, 5)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (6, 6, 6)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (7, 7, 7)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (8, 8, 8)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (9, 9, 9)
INSERT [dbo].[yeuthich] ([idyeuthich], [user_id], [idphim]) VALUES (10, 10, 10)
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
ALTER TABLE [dbo].[chitietphim]  WITH CHECK ADD  CONSTRAINT [FK_chitietphim_nhasxvadienvien] FOREIGN KEY([idnhasxvadv])
REFERENCES [dbo].[nhasxvadienvien] ([idnhasxvadv])
GO
ALTER TABLE [dbo].[chitietphim] CHECK CONSTRAINT [FK_chitietphim_nhasxvadienvien]
GO
ALTER TABLE [dbo].[chitietphim]  WITH CHECK ADD  CONSTRAINT [FK_chitietphim_phanloai] FOREIGN KEY([idphanloai])
REFERENCES [dbo].[phanloai] ([idphanloai])
GO
ALTER TABLE [dbo].[chitietphim] CHECK CONSTRAINT [FK_chitietphim_phanloai]
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
