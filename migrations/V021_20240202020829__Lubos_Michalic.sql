SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
PRINT N'Dropping [dbo].[Table_2]'
GO
DROP TABLE [dbo].[Table_2]
GO
PRINT N'Creating [dbo].[states]'
GO
CREATE TABLE [dbo].[states]
(
[country_code] [char] (2) NOT NULL,
[state_code] [varchar] (3) NOT NULL,
[state_name] [varchar] (25) NOT NULL
)
GO
PRINT N'Creating primary key [PK__states__0C51C004AEBFFFFE] on [dbo].[states]'
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [PK__states__0C51C004AEBFFFFE] PRIMARY KEY CLUSTERED ([country_code], [state_code])
GO
PRINT N'Adding constraints to [dbo].[states]'
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [UQ__states__9CE427BCFBC01384] UNIQUE NONCLUSTERED ([country_code], [state_name])
GO
PRINT N'Creating [dbo].[customers]'
GO
CREATE TABLE [dbo].[customers]
(
[customer_id] [int] NOT NULL IDENTITY(1, 1),
[title] [varchar] (10) NOT NULL,
[name] [varchar] (25) NOT NULL,
[address_line1] [varchar] (25) NOT NULL,
[address_line2] [varchar] (25) NULL,
[city] [varchar] (25) NOT NULL,
[postcode] [varchar] (10) NOT NULL,
[state_code] [varchar] (3) NOT NULL,
[country_code] [char] (2) NOT NULL,
[express_shipping] [bit] NULL,
[mobile_number] [bigint] NOT NULL
)
GO
PRINT N'Creating primary key [PK__customer__CD65CB853148D4C5] on [dbo].[customers]'
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [PK__customer__CD65CB853148D4C5] PRIMARY KEY CLUSTERED ([customer_id])
GO
PRINT N'Adding constraints to [dbo].[customers]'
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [UQ__customer__30462B0FE3A10D85] UNIQUE NONCLUSTERED ([mobile_number])
GO
PRINT N'Creating [dbo].[countries]'
GO
CREATE TABLE [dbo].[countries]
(
[country_code] [char] (2) NOT NULL,
[country_name] [varchar] (25) NOT NULL,
[foo] [char] (2) NULL
)
GO
PRINT N'Creating primary key [PK__countrie__3436E9A466260FBE] on [dbo].[countries]'
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [PK__countrie__3436E9A466260FBE] PRIMARY KEY CLUSTERED ([country_code])
GO
PRINT N'Adding constraints to [dbo].[countries]'
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [UQ__countrie__F70188942FEF287E] UNIQUE NONCLUSTERED ([country_name])
GO
PRINT N'Creating [dbo].[customer_addresses]'
GO

CREATE VIEW [dbo].[customer_addresses] AS
    SELECT  customer_id,
            address_line1 + ', '
              + ISNULL(address_line2 + ', ', '')
              + city + ', '
              + postcode + ', '
              + CASE state_name WHEN '' THEN '' ELSE state_name + ', ' END
              + country_name AS address
    FROM    dbo.customers
    JOIN    dbo.states ON states.state_code = customers.state_code AND states.country_code = customers.country_code
    JOIN    dbo.countries ON countries.country_code = customers.country_code
GO
PRINT N'Creating [dbo].[EnumerableRange]'
GO

CREATE FUNCTION [dbo].[EnumerableRange] (@start BIGINT, @count SMALLINT) RETURNS TABLE AS
    RETURN WITH e01 AS (SELECT 0 AS n UNION ALL SELECT 0),
                e02 AS (SELECT 0 AS n FROM e01, e01 AS other),
                e04 AS (SELECT 0 AS n FROM e02, e02 AS other),
                e08 AS (SELECT 0 AS n FROM e04, e04 AS other),
                e16 AS (SELECT 0 AS n FROM e08, e08 AS other)
           SELECT TOP (@count) @start + ROW_NUMBER() OVER (ORDER BY n) - 1 AS n FROM e16
GO
PRINT N'Creating [dbo].[numbers]'
GO

CREATE VIEW [dbo].[numbers] AS
    SELECT     n AS mobile_number,
               customer_id
    FROM       dbo.EnumerableRange(07700900110, 890)
    LEFT JOIN  dbo.customers ON mobile_number = n
GO
PRINT N'Creating [dbo].[getFreeMobileNumber]'
GO

CREATE VIEW [dbo].[getFreeMobileNumber] AS
    SELECT    TOP 1
              mobile_number
    FROM      dbo.numbers
    WHERE     customer_id IS NULL
    ORDER BY  NEWID()
GO
PRINT N'Altering [dbo].[Table_1]'
GO
ALTER TABLE [dbo].[Table_1] ADD
[bar
bar] [nchar] (10) NULL
GO
PRINT N'Adding foreign keys to [dbo].[states]'
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [FK__states__country___286302EC] FOREIGN KEY ([country_code]) REFERENCES [dbo].[countries] ([country_code])
GO
PRINT N'Adding foreign keys to [dbo].[customers]'
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [FK__customers__2C3393D0] FOREIGN KEY ([country_code], [state_code]) REFERENCES [dbo].[states] ([country_code], [state_code])
GO

