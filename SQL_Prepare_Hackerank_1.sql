# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$';
# Another solution
SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTRING(CITY, 1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U')
  AND UPPER(SUBSTRING(CITY, -1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');

# Query the Name of any student in STUDENTS who scored higher than  Marks. 
# Order your output by the last three characters of each name. 
# If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;

# Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT name FROM Employee
ORDER BY name ASC; 

# Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. 
# Sort your result by ascending employee_id.

SELECT name FROM Employee
WHERE salary>2000 AND months<10;













