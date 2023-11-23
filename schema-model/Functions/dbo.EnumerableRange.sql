SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[EnumerableRange] (@start BIGINT, @count SMALLINT) RETURNS TABLE AS
    RETURN WITH e01 AS (SELECT 0 AS n UNION ALL SELECT 0),
                e02 AS (SELECT 0 AS n FROM e01, e01 AS other),
                e04 AS (SELECT 0 AS n FROM e02, e02 AS other),
                e08 AS (SELECT 0 AS n FROM e04, e04 AS other),
                e16 AS (SELECT 0 AS n FROM e08, e08 AS other)
           SELECT TOP (@count) @start + ROW_NUMBER() OVER (ORDER BY n) - 1 AS n FROM e16
GO
