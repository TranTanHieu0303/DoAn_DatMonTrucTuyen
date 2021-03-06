create database [QL_DatMononline]
go
USE [QL_DatMononline]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 30/12/2020 8:21:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaHD] [int] NOT NULL,
	[MaSP] [char](5) NOT NULL,
	[Soluong] [int] NULL,
	[Giaban] [int] NULL,
	[ThanhTien] [int] NULL,
 CONSTRAINT [PK_ChiTietHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CuaHang]    Script Date: 30/12/2020 8:21:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CuaHang](
	[MaCH] [char](5) NOT NULL,
	[TenCH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[Sdt] [char](10) NULL,
	[HinhAnh] [nvarchar](200) NULL,
	[MaKH] [char](5) NULL,
 CONSTRAINT [PK_CuaHang] PRIMARY KEY CLUSTERED 
(
	[MaCH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 30/12/2020 8:21:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaCH] [char](5) NULL,
	[NgayDat] [date] NULL,
	[NgayGiao] [date] NULL,
	[TinhTrang] [nvarchar](20) NULL,
	[TongTien] [int] NULL,
	[MaKH] [char](5) NULL,
	[DiaChiGH] [nvarchar](500) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 30/12/2020 8:21:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [char](5) NOT NULL,
	[Usename] [nvarchar](50) NULL,
	[Pass] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[Sdt] [char](10) NULL,
	[HinhAnh] [nvarchar](200) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 30/12/2020 8:21:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [char](5) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 30/12/2020 8:21:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [char](5) NOT NULL,
	[TenSP] [nvarchar](200) NULL,
	[MoTa] [nvarchar](4000) NULL,
	[DonGia] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](200) NULL,
	[MaCH] [char](5) NULL,
	[MaLoai] [char](5) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (1, N'SP002', 3, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (1, N'SP007', 2, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (2, N'SP001', 4, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (2, N'SP003', 2, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (2, N'SP004', 2, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (2, N'SP007', 1, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (3, N'SP002', 1, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (3, N'SP008', 1, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (3, N'SP011', 1, NULL, NULL)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (4, N'SP003', 2, 5000, 10000)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (5, N'SP001', 2, 4000, 8000)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (6, N'SP013', 1, 25000, 25000)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (7, N'SP002', 2, 2500, 5000)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (7, N'SP003', 1, 5000, 5000)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [Soluong], [Giaban], [ThanhTien]) VALUES (7, N'SP004', 2, 25000, 50000)
INSERT [dbo].[CuaHang] ([MaCH], [TenCH], [DiaChi], [Sdt], [HinhAnh], [MaKH]) VALUES (N'CH001', N'Quảng Ngãi Quán', N'909/6 Trường Chinh-Tây Thạnh- Tan Phú - TP.HCM', N'0397330562', N'CH001.jpg', N'KH001')
INSERT [dbo].[CuaHang] ([MaCH], [TenCH], [DiaChi], [Sdt], [HinhAnh], [MaKH]) VALUES (N'CH002', N'Ốc Vỉa Hè', N'140 Lê Trọng Tấn, Tây Thạnh, Tân Phú, TP.HCM', N'0378558704', N'unnamed.png', N'KH001')
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaCH], [NgayDat], [NgayGiao], [TinhTrang], [TongTien], [MaKH], [DiaChiGH]) VALUES (1, N'CH001', CAST(0xE5410B00 AS Date), CAST(0xE6410B00 AS Date), NULL, 67500, N'KH002', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaCH], [NgayDat], [NgayGiao], [TinhTrang], [TongTien], [MaKH], [DiaChiGH]) VALUES (2, N'CH001', CAST(0xE5410B00 AS Date), CAST(0xE6410B00 AS Date), NULL, 106000, N'KH002', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaCH], [NgayDat], [NgayGiao], [TinhTrang], [TongTien], [MaKH], [DiaChiGH]) VALUES (3, N'CH001', CAST(0xE5410B00 AS Date), CAST(0xE9410B00 AS Date), NULL, 92500, N'KH002', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaCH], [NgayDat], [NgayGiao], [TinhTrang], [TongTien], [MaKH], [DiaChiGH]) VALUES (4, N'CH001', CAST(0xE5410B00 AS Date), CAST(0xE9410B00 AS Date), NULL, 10000, N'KH002', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaCH], [NgayDat], [NgayGiao], [TinhTrang], [TongTien], [MaKH], [DiaChiGH]) VALUES (5, N'CH001', CAST(0xFB410B00 AS Date), CAST(0xFC410B00 AS Date), NULL, 8000, N'KH001', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaCH], [NgayDat], [NgayGiao], [TinhTrang], [TongTien], [MaKH], [DiaChiGH]) VALUES (6, N'CH002', CAST(0xFC410B00 AS Date), CAST(0xFD410B00 AS Date), NULL, 25000, N'KH001', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [MaCH], [NgayDat], [NgayGiao], [TinhTrang], [TongTien], [MaKH], [DiaChiGH]) VALUES (7, N'CH001', CAST(0xFC410B00 AS Date), CAST(0xFD410B00 AS Date), NULL, 60000, N'KH001', NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
INSERT [dbo].[KhachHang] ([MaKH], [Usename], [Pass], [HoTen], [GioiTinh], [DiaChi], [Sdt], [HinhAnh]) VALUES (N'KH001', N'Hieu', N'123', N'Trần Tấn Hiếu', N'Nam', N'Quảng Ngãi', N'0397330562', N'avatar_KH1.jpg')
INSERT [dbo].[KhachHang] ([MaKH], [Usename], [Pass], [HoTen], [GioiTinh], [DiaChi], [Sdt], [HinhAnh]) VALUES (N'KH002', N'Hieu1', N'123', N'Tấn Hiếu2', N'Nam', N'Quảng Ngãi-Đức Phổ', N'0378558704', N'KH0025.jpg')
INSERT [dbo].[KhachHang] ([MaKH], [Usename], [Pass], [HoTen], [GioiTinh], [DiaChi], [Sdt], [HinhAnh]) VALUES (N'KH003', N'Hieu2', N'123456', N'1', N'Nữ', N'h', N'012       ', N'KH003.png')
INSERT [dbo].[KhachHang] ([MaKH], [Usename], [Pass], [HoTen], [GioiTinh], [DiaChi], [Sdt], [HinhAnh]) VALUES (N'KH004', N'KhachHang', N'123', N'Tấn Hiếu', N'Nam', N'Quảng Ngãi-Đức Phổ', N'0378558704', N'KH0040.jpg')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'LSP01', N'Đồ Ăn')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'LSP02', N'Đồ Uống')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (N'LSP03', N'Vĩa Hè')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP001', N'Bánh xèo', N'Bánh xèo Quảng Ngãi làm từ bột gạo, thơm ngon như quê nhà', 5000, N'Còn', N'SP0012.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP002', N'Bánh bèo', N'Bánh bèo Quảng Ngãi làm từ bột gạo, thơm ngon như quê nhà', 2500, N'Còn', N'banh-beo.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP003', N'Bánh Tráng Đập', N'Đặc Sản Chỉ có ở miền trung', 5000, N'Còn', N'banh-trang-dap.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP004', N'Ram Bắp', N'Ram Bắp 10 cái/ dĩa', 25000, N'Còn', N'ram-bap.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP005', N'Thịt luộc', N'Thịt Heo Luộc 100% sản phẩm sạch an toàn', 30000, N'Còn', N'thit-luoc.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP006', N'Bún Mắm', N'Bún Mắm Thơm Ngon hương vị quê nhà', 20000, N'Còn', N'bun-mam.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP007', N'Mì Quảng', N'Đặc sản Quảng Nam', 30000, N'Còn', N'mi-quang.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP008', N'Don', N'Don xào xúc bánh tráng', 15000, N'Còn', N'don.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP009', N'Bún Bò Huế', N'Hương vị miền Trung', 25000, N'Còn', N'bun-bo-hue.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP010', N'Bò Hít', N'Bò Hít vừa ăn vừa hít hà', 15000, N'Còn', N'bo-hit.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP011', N'Miếng xào lươn', N'Hương vị miền quê ', 75000, N'Còn', N'mien-luon-xao.jpg', N'CH001', N'LSP01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP012', N'Bánh tráng nướng', N'Hương vị Đà Lạt', 2000, N'Còn', N'banh-trang-nuong.jpg', N'CH002', N'LSP03')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP013', N'Ốc hút', N'Ốc hụt tại Quảng Ngãi Quán', 25000, N'Còn', N'unnamed.png', N'CH002', N'LSP03')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP014', N'Number 1', N'', 10000, N'Còn', N'number1.jpg', N'CH001', N'LSP02')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP015', N'7 Up', N'', 10000, N'Còn', N'seven-up.jpg', N'CH001', N'LSP02')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP016', N'CoCa', N'', 10000, N'Còn', N'coca.jpg', N'CH001', N'LSP02')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP017', N'Nước Suối', N'', 10000, N'Còn', N'nuoc-suoi.jpg', N'CH001', N'LSP02')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [DonGia], [TinhTrang], [HinhAnh], [MaCH], [MaLoai]) VALUES (N'SP018', N'Trà Sữa', N'', 20000, N'Còn', N'tra-sua.jpg', N'CH001', N'LSP02')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KhachHan__813EFC5C8DD0F8FB]    Script Date: 30/12/2020 8:21:16 SA ******/
ALTER TABLE [dbo].[KhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Usename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [Fk_ChiTietHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [Fk_ChiTietHD_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [Fk_ChiTietHD_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [Fk_ChiTietHD_SanPham]
GO
ALTER TABLE [dbo].[CuaHang]  WITH CHECK ADD  CONSTRAINT [FK_CuaHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[CuaHang] CHECK CONSTRAINT [FK_CuaHang_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [Fk_HoaDon_CuaHang] FOREIGN KEY([MaCH])
REFERENCES [dbo].[CuaHang] ([MaCH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [Fk_HoaDon_CuaHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_CuaHang] FOREIGN KEY([MaCH])
REFERENCES [dbo].[CuaHang] ([MaCH])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_CuaHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [Fk_SanPham_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [Fk_SanPham_LoaiSP]
GO
