USE [bd_plazavea]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23/01/2023 14:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](20) NULL,
	[price] [decimal](18, 0) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetAllValuesProduct]    Script Date: 23/01/2023 14:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllValuesProduct]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[Product] ORDER BY price;
END
GO
/****** Object:  StoredProcedure [dbo].[PaginationProduct]    Script Date: 23/01/2023 14:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PaginationProduct]
	-- Add the parameters for the stored procedure here
	@pagenum int,
	@pagesize int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[Product]
	ORDER BY [price]
	OFFSET(@pagenum - 1) * @pagesize ROWS
	FETCH NEXT @pagesize ROWS ONLY;

END
GO
/****** Object:  StoredProcedure [dbo].[SearchProduct]    Script Date: 23/01/2023 14:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SearchProduct]
	-- Add the parameters for the stored procedure here
	@description  varchar(20),
	@price decimal
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM [dbo].[Product] WHERE [description] = @description AND [price] = @price
END
GO
