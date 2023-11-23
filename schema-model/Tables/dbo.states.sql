CREATE TABLE [dbo].[states]
(
[country_code] [char] (2) NOT NULL,
[state_code] [varchar] (3) NOT NULL,
[state_name] [varchar] (25) NOT NULL,
)
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [PK__states__0C51C004AEBFFFFE] PRIMARY KEY CLUSTERED ([country_code], [state_code])
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [UQ__states__9CE427BCFBC01384] UNIQUE NONCLUSTERED ([country_code], [state_name])
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [FK__states__country___286302EC] FOREIGN KEY ([country_code]) REFERENCES [dbo].[countries] ([country_code])
GO
