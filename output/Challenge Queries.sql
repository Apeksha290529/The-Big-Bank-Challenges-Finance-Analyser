-- 1. What are the names of all the customers who live in New York?
SELECT CONCAT (FirstName, LastName) AS Customers, City, State 
FROM Customers c 
WHERE State = 'NY';

-- 2. What is the total number of accounts in the Accounts table?
SELECT COUNT(AccountID)
FROM Accounts a; 


-- 3. What is the total balance of all checking accounts?
SELECT AccountType, SUM(Balance)
FROM Accounts a 
WHERE AccountType = 'Checking';

-- 4. What is the total balance of all accounts associated with customers who live in Los Angeles?
SELECT SUM(a.Balance) 
FROM Accounts a
JOIN Customers c ON c.CustomerID = a.CustomerID 
WHERE City = 'Los Angeles';

-- 5. Which branch has the highest average account balance?
SELECT AVG(a.Balance) AS 'Average Balance', b.BranchName  
FROM Branches b 
JOIN Accounts a ON a.BranchID = b.BranchID
GROUP BY b.BranchName
ORDER BY AVG(a.Balance) DESC;

-- 6. Which customer has the highest current balance in their accounts?
SELECT CONCAT(FirstName, LastName) AS 'Customers', SUM(a.Balance) AS 'Total_Balance'
FROM Customers c 
JOIN Accounts a ON a.CustomerID = c.CustomerID
GROUP BY Customers
ORDER BY Total_Balance DESC;

-- 7. Which customer has made the most transactions in the Transactions table?
SELECT CONCAT(FirstName,' ',LastName) AS 'Customers', COUNT(t.TransactionDate) AS 'No_of_Transactions'
FROM Customers c 
JOIN Accounts a ON a.CustomerID = c.CustomerID 
JOIN Transactions t ON t.AccountID = a.AccountID 
GROUP BY Customers
ORDER BY No_of_Transactions DESC;

-- 8. Which branch has the highest total balance across all of its accounts?
SELECT b.BranchName, SUM(a.Balance) AS 'Total_Balance'  
FROM Branches b 
JOIN Accounts a ON a.BranchID = b.BranchID 
GROUP BY BranchName
ORDER BY Total_Balance DESC;

-- 9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
SELECT CONCAT(FirstName,' ',LastName) AS 'Customers', SUM(A.Balance) AS 'Total_Balance' 
FROM Customers c 
JOIN Accounts a ON a.CustomerID = c.CustomerID 
GROUP BY Customers
ORDER BY Total_Balance DESC;

-- 10. Which branch has the highest number of transactions in the Transactions table?
SELECT COUNT(t.TransactionID) AS 'Total_Transactions', b.BranchName 
FROM Transactions t 
JOIN Accounts a ON a.AccountID =t.AccountID 
JOIN Branches b ON b.BranchID = a.BranchID 
GROUP BY b.BranchName
ORDER BY Total_Transactions DESC;



