USE [DBPROYECTO]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 1/7/2020 20:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idcliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NULL,
	[apellido] [varchar](25) NULL,
	[cedula] [varchar](15) NULL,
	[telefono] [varchar](15) NULL,
	[ciudad] [varchar](25) NULL,
	[direccion] [varchar](100) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 1/7/2020 20:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[idempresa] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[telefono] [varchar](20) NULL,
	[ciudad] [varchar](25) NULL,
	[direccion] [varchar](100) NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[idempresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 1/7/2020 20:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[idpedido] [int] IDENTITY(1,1) NOT NULL,
	[fechaPeticion] [date] NULL,
	[estado] [varchar](15) NULL,
	[fechaEjecucion] [date] NULL,
	[idservicio] [int] NULL,
	[idcliente] [int] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[idpedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 1/7/2020 20:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[idservicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[idempresa] [int] NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[idservicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([idcliente], [nombre], [apellido], [cedula], [telefono], [ciudad], [direccion]) VALUES (5, N'David Andre', N'Paredes Guerra', N'1804837456', N'098653215', N'Ambato', N'Bolivar y Martinez')
GO
INSERT [dbo].[Cliente] ([idcliente], [nombre], [apellido], [cedula], [telefono], [ciudad], [direccion]) VALUES (8, N'Esteban', N'Suarez', N'1598623154', N'0986321458', N'Loja', N'Loja')
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Empresa] ON 
GO
INSERT [dbo].[Empresa] ([idempresa], [nombre], [telefono], [ciudad], [direccion]) VALUES (7, N'Ultra Sports', N'0983158746', N'Ambato', N'Sucre y Lalama')
GO
INSERT [dbo].[Empresa] ([idempresa], [nombre], [telefono], [ciudad], [direccion]) VALUES (11, N'L´escofier', N'022659832', N'Quito', N'Quitumbe')
GO
SET IDENTITY_INSERT [dbo].[Empresa] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedido] ON 
GO
INSERT [dbo].[Pedido] ([idpedido], [fechaPeticion], [estado], [fechaEjecucion], [idservicio], [idcliente]) VALUES (12, CAST(N'2020-06-25' AS Date), N'Aprovado', CAST(N'2020-06-30' AS Date), 12, 5)
GO
SET IDENTITY_INSERT [dbo].[Pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[Servicio] ON 
GO
INSERT [dbo].[Servicio] ([idservicio], [nombre], [idempresa]) VALUES (12, N'Confecciones Deportivas', 7)
GO
INSERT [dbo].[Servicio] ([idservicio], [nombre], [idempresa]) VALUES (14, N'Sublimado', 7)
GO
SET IDENTITY_INSERT [dbo].[Servicio] OFF
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Cliente] FOREIGN KEY([idcliente])
REFERENCES [dbo].[Cliente] ([idcliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Cliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Servicio] FOREIGN KEY([idservicio])
REFERENCES [dbo].[Servicio] ([idservicio])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Servicio]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Empresa] FOREIGN KEY([idempresa])
REFERENCES [dbo].[Empresa] ([idempresa])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Empresa]
GO
