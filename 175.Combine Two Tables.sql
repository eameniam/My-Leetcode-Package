# Write your MySQL query statement below
SELECT A.City, A.State, P.FirstName, P.LastName FROM Address A
       RIGHT JOIN Person P ON A.PersonId = P.PersonId
