# Write your MySQL query statement below
SELECT C.NAME AS Customers
FROM Customers C
LEFT JOIN Orders O
ON C.Id = O.CustomerId
WHERE O.Id IS NULL
