CREATE TABLE [dbo].[countries]
(
[country_code] [char] (2) NOT NULL,
[country_name] [varchar] (25) NOT NULL,
[foo] [char] (2) NULL,
[bar] [char] (2) NULL
)
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [PK__countrie__3436E9A466260FBE] PRIMARY KEY CLUSTERED ([country_code])
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [UQ__countrie__F70188942FEF287E] UNIQUE NONCLUSTERED ([country_name])
GO
