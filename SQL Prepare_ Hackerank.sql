SELECT * FROM CITY
WHERE POPULATION>100000 AND COUNTRYCODE='USA';

#Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT total_entries - distinct_entries AS difference
FROM(
    SELECT COUNT(CITY) AS total_entries, COUNT(DISTINCT CITY) AS distinct_entries
    FROM STATION
) AS subquery;

#Query the two cities in STATION with the shortest and longest CITY names, 
#as well as their respective lengths (i.e.: number of characters in the name). 
#If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

SELECT CITY, LENGTH(CITY) as name_length 
FROM STATION
ORDER BY name_length, CITY
LIMIT 1; #The LIMIT 1 ensures that only the top (or first) row is returned.

SELECT CITY, LENGTH(CITY) AS name_length
FROM STATION
ORDER BY name_length DESC, CITY DESC
LIMIT 1; 
#The results are ordered by the length of the city name in descending order (name_length), and then alphabetically in descending order (CITY).
#This way, if there are multiple cities with the same length, the one that comes first alphabetically will be selected due to the ordering in the query.

# Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[aeiouAEIOU]';
#Where ^ asserts the start of the string and [aeiouAEIOU] is a character class that matches any one of the specified vowels (case-insensitive).

# Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '[aeiouAEIOU]$';
# where $ asserts the end of the string

# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$';
# '.*' matches any characters (zero or more occurrences) in between.

#Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '[aeiouAEIOU]$';

#Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$';
