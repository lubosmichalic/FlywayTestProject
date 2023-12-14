SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Creating [dbo].[Table_1]'
GO
CREATE TABLE [dbo].[Table_1]
(
[foo] [nchar] (10) NULL
)
GO
PRINT N'Creating [dbo].[Table_2]'
GO
CREATE TABLE [dbo].[Table_2]
(
[bar] [nchar] (10) NULL
)
GO

