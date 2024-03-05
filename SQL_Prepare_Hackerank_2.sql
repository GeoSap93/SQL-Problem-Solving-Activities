# You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
# Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
# Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
# The report must be in descending order by grade -- i.e. higher grades are entered first. 
# If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
# Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
# If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

SELECT
    CASE
        WHEN Grades.Grade >= 8 THEN Students.Name
        ELSE NULL
    END AS Name,
    Grades.Grade,
    Students.Marks
FROM Students
JOIN Grades ON Students.Marks BETWEEN Grades.Min_Mark AND Grades.Max_Mark
WHERE Grades.Grade >= 8 OR (Grades.Grade < 8 AND Students.Marks = (SELECT MIN(Marks) FROM Students WHERE Grades.Grade = 7))
ORDER BY Grades.Grade DESC, Name, Marks;
#------------------------------------------------------------------------------------------------------------------------------------
#Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
#Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT SUM(CITY.Population)
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Asia';

#--------------------------------------------------------------------------------------------------------------------------------------

#Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
#Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT CITY.NAME FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = "Africa";

#--------------------------------------------------------------------------------------------------------------------------------------
# Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
# and their respective average city populations (CITY.Population) rounded down to the nearest integer.
#Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population)) AS AverageCityPopulation FROM CITY
# AVG() function to calculate the average city population for each continent
#FLOOR() function is used to round down the average city population to the nearest integer 
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;


