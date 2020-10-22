Table: Sessions

+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| session_id          | int     |
| duration            | int     |
+---------------------+---------+
session_id is the primary key for this table.
duration is the time in seconds that a user has visited the application.
 

You want to know how long a user visits your application. You decided to create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it.

Write an SQL query to report the (bin, total) in any order.

The query result format is in the following example.

Sessions table:
+-------------+---------------+
| session_id  | duration      |
+-------------+---------------+
| 1           | 30            |
| 2           | 299           |
| 3           | 340           |
| 4           | 580           |
| 5           | 1000          |
+-------------+---------------+

Result table:
+--------------+--------------+
| bin          | total        |
+--------------+--------------+
| [0-5>        | 3            |
| [5-10>       | 1            |
| [10-15>      | 0            |
| 15 or more   | 1            |
+--------------+--------------+

For session_id 1, 2 and 3 have a duration greater or equal than 0 minutes and less than 5 minutes.
For session_id 4 has a duration greater or equal than 5 minutes and less than 10 minutes.
There are no session with a duration greater or equial than 10 minutes and less than 15 minutes.
For session_id 5 has a duration greater or equal than 15 minutes.

Solution:
SELECT '[0-5>'  AS bin, 
       Count(1) AS total 
FROM   sessions 
WHERE  duration >= 0 
       AND duration < 300 
UNION ALL
SELECT '[5-10>' AS bin, 
       Count(1) AS total 
FROM   sessions 
WHERE  duration >= 300 
       AND duration < 600 
UNION ALL 
SELECT '[10-15>' AS bin, 
       Count(1)  AS total 
FROM   sessions 
WHERE  duration >= 600 
       AND duration < 900 
UNION ALL 
SELECT '15 or more' AS bin, 
       Count(1)     AS total 
FROM   sessions 
WHERE  duration >= 900;
