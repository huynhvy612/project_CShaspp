USE [HuynhThiThaoVyDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/22/2021 12:25:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [varchar](50) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/22/2021 12:25:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](50) NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[UnitCost] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Image] [varchar](50) NULL,
	[CategoryID] [varchar](50) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 6/22/2021 12:25:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccount](
	[UserID] [varchar](50) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Permission] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (N'CKM', N'Chì Kẻ Mày-Mắt', N'Lâu phai, chống thấm, mang lại vẻ đẹp tự nhiên')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (N'KCN', N'Kem Chống Nắng', N'SPA50+ , thẩm thấu nhanh, không thấm nước')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (N'MH', N'phấn má hồng', N'hồng')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (N'PP', N'Phấn Phủ', N'Hút ẩm hiệu quả, không trôi')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (N'SM', N'Son Môi', N'Lâu trôi, mềm mịn, tự nhiên')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (N'SR', N'Serum', N'Tái tao, nuôi dưỡng làn da')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (N'TN', N'Toner', N'Cấp ẩm, cân bằng  mọi loại da')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'CMCE', N'Chì Kẻ Mày Cezanne Smalleye Hai Đầu', CAST(250000 AS Decimal(18, 0)), 40, N'CKM-CE.jpg', N'CKM', N'Kẻ mày dạng sáp, vừa bám màu được cả ngày mà cũng dễ tẩy trang', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'CMMAC', N'Chì kẻ mày MAC Chili Helenati Eye', CAST(100000 AS Decimal(18, 0)), 20, N'KM-WATER.jpg', N'CKM', N'Kết cấu có hệ thống bình mực trải dài giữa thân bút, để mực ra đều và không khô đầu bút', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KCNASE', N'Kem chống nắng Anessa 3 trong 1', CAST(560000 AS Decimal(18, 0)), 10, N'kem-chong-nang-anessa-5.jpg', N'KCN', N'Chất kem mềm nhẹ, thẩm thấu nhanh vào da, mang đến một làn da trắng sáng ', N'Sap het')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KCNCT', N'Kem Chống Nắng Neoretin Discrom ', CAST(1000000 AS Decimal(18, 0)), 30, N'kem_chong_nang_neoretin.jpg', N'KCN', N'Bảo vệ da khỏi dải UV cao nhất, ngăn  ngừa sự hình thành nám, tàn nhang.', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KCNFC', N'Kem Chống Nắng CELL FUSION C', CAST(150000 AS Decimal(18, 0)), 40, N'kcn-f-C.jpg', N'KCN', N'Chất kem mềm nhẹ, thẩm thấu nhanh vào da, mang đến một làn da trắng sáng ', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KCNJP', N'Kem chống nắng Senkodaki Japan', CAST(160000 AS Decimal(18, 0)), 10, N'kem-chong-nang-innisfreejpg.jpg', N'KCN', N'Bảo vệ da khỏi dải UV cao nhất, ngăn  ngừa sự hình thành nám, tàn nhang.', N'Sap het')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KCNPF', N'Kem chống nắng Perfect Lution', CAST(700000 AS Decimal(18, 0)), 0, N'kem-chong-nang-senka.jpg', N'KCN', N'Chất kem mềm nhẹ, thẩm thấu nhanh vào da, mang đến một làn da trắng sáng ', N'Het hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KCNSS', N'Kem chống nắng Sunscreen Hot', CAST(550000 AS Decimal(18, 0)), 70, N'kem-chong-nang-sunscreen.jpg', N'KCN', N'Chuyên dùng cho làn da sau điều trị laser và IPL. Phù hợp với mọi loại da, kể cả da nhạy cảm', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KMBOM', N'Kẻ Mắt Nước BOM Wonderproof ', CAST(390000 AS Decimal(18, 0)), 60, N'KM-BOM.jpg', N'CKM', N'Đầu bút siêu mảnh tạo nên đường viền mắt tinh tế. Kẻ mày dạng sáp, vừa bám màu.', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KMLEMO', N'Bút Kẻ Mắt Lemonade Supernatural', CAST(470000 AS Decimal(18, 0)), 75, N'KM-LEMO.jpg', N'CKM', N'Kết cấu có hệ thống bình mực trải dài giữa thân bút, để mực ra đều và không khô đầu bút', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'KMWAT', N'Bút kẻ mắt Waterproof Liquid', CAST(245000 AS Decimal(18, 0)), 24, N'KM-WATER.jpg', N'CKM', N'Công thức mực ưu việt, màu sắc đậm vừa phải, nhanh khô hạn chế lem trong quá trình sử dụng', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'PPEDA', N'Phấn phủ kiềm dầu Edally Smood', CAST(890000 AS Decimal(18, 0)), 33, N'PP-EDA.jpg', N'PP', N'Mùi hương dịu nhẹ, không gây kích ứng da, phù hợp với tất cả các loại da', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'PPGC', N'Phấn Phủ Gucci Poudre De Beauté Mat', CAST(1200000 AS Decimal(18, 0)), 19, N'PP-GC.jpg', N'PP', N'Kết cấu mỏng nhẹ, pigment tốt bám tốt, lên da mịn màng, che phủ khuyết điểm ổn', N'Sap het')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'PPMAC', N'Phấn Phủ MAC Studio Fix All Powd', CAST(980000 AS Decimal(18, 0)), 67, N'PP-MAC.jpg', N'PP', N'Silica giúp lớp phấn bền màu, lâu trôi và đặc biệt hút dầu, chống chảy xệ.', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'S3CE', N'Son 3CE Matterise Lip Color màu 229', CAST(400000 AS Decimal(18, 0)), 56, N'S-3CE.jpg', N'SM', N'Rực rỡ, nồng cháy mượt mà, không bị khô nứt, lộ vân môi, màu son sắc nét đến cả đường viền môi.', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SBLR32', N'Son Black Rouge Mã A32 - đỏ nâu', CAST(235000 AS Decimal(18, 0)), 42, N'sblr-32.jpg', N'SM', N'Chất son kem lì mịn chuẩn 3M, lên môi tạo hiệu ứng semi-matte', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SBLR37', N'Son Black Rouge Ver 7 A37 – Đỏ nâu đất', CAST(567000 AS Decimal(18, 0)), 9, N'SBLR-37.jpg', N'SM', N'Chất son lì không bóng.Độ lên màu chuẩn. Không lộ vân môi.', N'Sap het')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SCHR', N'Son Lì Christian Louboutin  Cam Tươi', CAST(290000 AS Decimal(18, 0)), 15, N'S-CHR.jpg', N'SM', N'Rực rỡ, nồng cháy mượt mà, không bị khô nứt, lộ vân môi, màu son sắc nét đến cả đường viền môi.', N'Sap het')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SMAC', N'Son MAC Chili mã 345 - cam pha đỏ', CAST(900000 AS Decimal(18, 0)), 80, N'S-MAC.jpg', N'SM', N'Chất son lì không bóng.- Độ lên màu chuẩn.- Giữ màu lâu đến 5h.- Không lộ vân môi.', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SR24', N'Serum tinh chất vàng 24k Thera Lady', CAST(500000 AS Decimal(18, 0)), 64, N'SR-24.jpg', N'SR', N'Cấp ẩm, chống oxy hóa giúp làn da luôn căng mướt, chống khô ráp, sần sùi.', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SRDO', N'Serum Dưỡng Trắng Da Innisfree Jeju', CAST(760000 AS Decimal(18, 0)), 55, N'SR-DO.jpg', N'SR', N'Tái tạo mô và làm lành các vết thương, sẹo mụn, kích thích hình thành các tế bào mới tươi trẻ hơn', N'Con Hang')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SRLA', N'Serum La Roche Posay Effaclar Eser', CAST(457000 AS Decimal(18, 0)), 11, N'SR-LA.JPG', N'SR', N'Tẩy tế bào chết & loại bỏ lớp sừng, thúc đẩy quá trình tái tạo da, giảm thâm mụn', N'Sap het')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SRORD', N'Serum The Ordinary chống lão hóa', CAST(367000 AS Decimal(18, 0)), 3, N'SR-ORD.jpg', N'SR', N'Làm căng mọng da, giảm nếp nhăn, cấp ẩm chuyên sâu và giảm các dấu hiệu lão hóa', N'Sap het')
INSERT [dbo].[Product] ([ProductID], [ProductName], [UnitCost], [Quantity], [Image], [CategoryID], [Description], [Status]) VALUES (N'SYSL', N'Son YSL Màu 01 Limited đỏ tươi', CAST(780000 AS Decimal(18, 0)), 0, N'S-YSL.png', N'SM', N'Chứa nhiều dưỡng nhất , phô diễn đường nét gợi cảm trên đôi môi, son lên chuẩn màu đến 95%', N'Het hang')
INSERT [dbo].[UserAccount] ([UserID], [UserName], [Password], [Email], [Status], [Permission]) VALUES (N'an', N'Hà Thanh An', N'523af537946b79c4f8369ed39ba78605', N'an@gmail.com', N'Blocked', N'US')
INSERT [dbo].[UserAccount] ([UserID], [UserName], [Password], [Email], [Status], [Permission]) VALUES (N'han', N'Thiên Hân', N'523af537946b79c4f8369ed39ba78605', N'han@gmail.com', N'Blocked', N'US')
INSERT [dbo].[UserAccount] ([UserID], [UserName], [Password], [Email], [Status], [Permission]) VALUES (N'lam', N'Ngô Thị Lâm', N'1c6d6ca22cc31cb79e6e1f5277ef06e0', N'lam@gmail.com', N'Active', N'US')
INSERT [dbo].[UserAccount] ([UserID], [UserName], [Password], [Email], [Status], [Permission]) VALUES (N'tam', N'Minh Tâm', N'523af537946b79c4f8369ed39ba78605', N'tam@gmail.com', N'Blocked', N'US')
INSERT [dbo].[UserAccount] ([UserID], [UserName], [Password], [Email], [Status], [Permission]) VALUES (N'thanh', N'Ngyễn Văn Thanh', N'523af537946b79c4f8369ed39ba78605', N'thanh@gmail.com', N'Active', N'US')
INSERT [dbo].[UserAccount] ([UserID], [UserName], [Password], [Email], [Status], [Permission]) VALUES (N'thaovy', N'Huỳnh Thị Thảo Vy', N'9495fa6cfd7a03125bce7141b6d931a6', N'vy@gmail.com', N'Active', N'AD')
INSERT [dbo].[UserAccount] ([UserID], [UserName], [Password], [Email], [Status], [Permission]) VALUES (N'trang', N'Phạm Thị Trang', N'523af537946b79c4f8369ed39ba78605', N'trang@gmail.com', N'Active', N'US')
INSERT [dbo].[UserAccount] ([UserID], [UserName], [Password], [Email], [Status], [Permission]) VALUES (N'tuan', N'Lê Anh Tuấn', N'523af537946b79c4f8369ed39ba78605', N'tuan@gmail.com', N'Blocked', N'US')
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
