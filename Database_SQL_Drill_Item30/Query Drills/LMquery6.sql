--6. Retrieve the names, addresses, and number of books checked
--out for all borrowers who have more than five books checked out.

/* Have tried getting this query to run properly with AJA with no luck */

SELECT bw.Name, bw.[Address], bl.BookID, COUNT(DISTINCT bl.CardNo) AS checkouts 
FROM Book_Loans AS bl
INNER JOIN Borrower AS bw ON (bl.CardNo = bw.CardNo)
WHERE bl.CardNo > 5
GROUP BY bw.Name, bw.[Address], bl.BookID 
HAVING COUNT (bl.CardNo) > 5

