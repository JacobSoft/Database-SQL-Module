--2. How many copies of the book titled The Lost Tribe --are owned by each library branch?

SELECT b.BookID, b.Title, lb.BranchName, bc.No_of_Copies 
FROM Book_copies AS bc
INNER JOIN Library_Branch AS lb ON (bc.BranchID = lb.Branchid)
INNER JOIN Book AS b ON (bc.Bookid = b.Bookid)
WHERE Title = 'The Lost Tribe'

