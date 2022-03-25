--Assignment-5

--Factorial Function

CREATE FUNCTION dbo.Factorial1
(
    @number BIGINT
)
RETURNS BIGINT
AS
BEGIN
    DECLARE @answer BIGINT;
    IF @number <= 1
        SET @answer = 1;
    ELSE
        SET @answer = @number * dbo.Factorial1(@number - 1);
    RETURN (@answer);
END;

--Çalýþtýrýlmasý 

SELECT dbo.Factorial1(12) AS answer;