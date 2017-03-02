--3. Retrieve the names of all borrowers who 
--do not have any books checked out.

SELECT * 
FROM Borrower AS b
LEFT OUTER JOIN Book_Loans AS bl ON (b.CardNo = bl.CardNo)
WHERE bl.CardNo IS NULL