--4. For each book that is loaned out from the "Sharpstown" 
--branch and whose DueDate is today, retrieve the book title, 
--the borrower's name, and the borrower's address

/*
Used this query drill to create stored procedure: 
EXEC dbo.getborrowersduetoday @BranchName = 'Sharpstown', @DueDate = '3/1/2017'
*/

CREATE PROC dbo.getborrowersduetoday @BranchName nvarchar (30), @DueDate date
AS

SELECT b.Title, bw.Name, bw.[Address], bl.DueDate, lb.BranchName
FROM Library_Branch AS lb
INNER JOIN Book_loans AS bl ON (bl.BranchID = lb.BranchID)
INNER JOIN Borrower AS bw ON (bw.CardNo = bl.CardNo)
INNER JOIN Book AS b ON (b.Bookid = bl.Bookid)
WHERE lb.BranchName = @BranchName 
AND bl.DueDate = @DueDate


