SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[getFreeMobileNumber] AS
    SELECT    TOP 1
              mobile_number
    FROM      dbo.numbers
    WHERE     customer_id IS NULL
    ORDER BY  NEWID()
GO
