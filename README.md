
# README
The follow commands have been demonstrated in the video attached titled '38.mp4', in this very order

### Query 1
This is a function to satisfy one of the INSERT functional requirements.
We ask the user to enter relevant data about the new villager
```
"""INSERT INTO Villagers
(Aadhar_No, Pan_No, Name, Caste_or_Sect, Sex, Age, Phone_No, Literacy, Occupation)
VALUES('%s', '%s', '%s', '%s', '%s', '%d', '%d', '%s', '%s')""" % (
row["AADHAR"], row["PAN"], row["Name"], row["Caste"], row["Sex"], \
row["Age"], row["Phone"], row["Literacy"], row["Occupation"]);"""
```
### Query 2
This is a function to satisfy one of the DELETE functional requirements
We ask the user to enter relevant information about the small business  whose data is to be deleted
```
"""DELETE FROM `Small_Businesses`
WHERE Aadhar_No = '%s' AND Name = '%s'""" % (row["AADHAR"], row["Name"]);"""
```
### Query 3
This is a function to satisfy one of the UPDATE functional requirements
We update the number of employees of the business whose relevant data is provided by the user
```
"""UPDATE `Small_Businesses`
SET No_of_employees = '%d'
WHERE Aadhar_No = '%s' AND Name = '%s'""" %(
row["No_of_employees"], row["AADHAR"], row["Name"]);"""
```
### Query 4
We calculate the average age of all villagers
```
"""SELECT AVG(Age) AS 'Average Age'
FROM Villagers""";
```
### Query 5
We get all relevant information about all events that had been held for the purpose of vaccination
```
"""SELECT * FROM Events
WHERE Purpose LIKE '%Vaccination%'""";
```
### Query 6
We get the information of all villagers who work as nurses
```
"""SELECT Aadhar_No, Name, Age, Sex, Phone_No
FROM Villagers
WHERE Occupation
LIKE '%Nurse%'""";
```
### Query 7
```
"""SELECT Villagers.Aadhar_No AS 'AADHAR No.',
Farmlands.Serial_No AS 'Farmland No',
Villagers.Name AS 'Owner Name',
Farmlands.Area AS 'Land Size'
FROM Villagers INNER JOIN Farmlands
ON Farmlands.Aadhar_No = Villagers.Aadhar_No
WHERE Farmlands.Area >= '%d';"""%(LARGE_FARM_CUTOFF)
```
### Query 8
We wish to list the average income of each caste
```
"""SELECT Villagers.Caste_or_Sect AS 'Caste',
AVG(Taxation.Total_Income) AS 'Average Income'
FROM Villagers, Taxation
WHERE Villagers.Aadhar_No = Taxation.Aadhar_No
GROUP BY Villagers.Caste_or_Sect;"""

```
### Query 9
We wish to get the number of people belonging to each age group

```
"""SELECT Govt_Schemes.Which AS 'Scheme Name',
Govt_Schemes.Since_When AS 'Time since in effect',
Govt_Schemes.Benefits_Provided AS 'Benefits',
Villagers.Name AS 'Beneficiary Name'
FROM Govt_Schemes INNER JOIN Villagers ON
Villagers.Aadhar_No = Govt_Schemes.Aadhar_No
WHERE Govt_Schemes.Which LIKE '%MGNREGA%';"""
```
### Query 10
We wish to list all Panchayat members who own farmlands too large
```
"""
SELECT
Panchayat_Members.Aadhar_No AS 'AADHAR INFO',
Villagers.Name AS 'Panchayat Member Name',
Panchayat_Members.Salary AS 'Salary',
Panchayat_Members.Years_Of_Service AS 'Years of Service',
Tax_Waivers.Tax_Waiver AS 'Tax Waiver Recieved',
Farmlands.Area AS 'Farmland Area'
FROM Panchayat_Members, Villagers, Farmlands, Tax_Waivers, Taxation
WHERE
Panchayat_Members.Aadhar_No = Villagers.Aadhar_No
AND Panchayat_Members.Aadhar_No = Taxation.Aadhar_No
AND Taxation.ITR_No = Tax_Waivers.ITR_No
AND Farmlands.Aadhar_No = Panchayat_Members.Aadhar_No
AND Farmlands.Area >= 1000;
"""
```
### Query 11
We wish to list the number of women above the age of 30 who are currently employed
```
"""
SELECT
Villagers.Name AS Name,
Villagers.Age AS Age,
Taxation.Total_Income AS 'Current Income'
FROM Villagers, Taxation
WHERE
Villagers.Aadhar_No = Taxation.Aadhar_No AND
Taxation.Total_Income <> 0 AND
Villagers.Sex = 'Female' AND
Villagers.Age > 30;

"""

```
### Query 12
We wish to list details of people with names starting with "A" and are in the top 30% of tax payers
```

```
### Query 13
We wish to determine all the villagers who did not cast their vote in the elections
```
"""
SELECT
Villagers.Aadhar_No AS `Non-Voter AADHAR NUMBER`,
Villagers.Name AS `Non-Voter Name`
FROM Villagers
WHERE
Villagers.Aadhar_No NOT IN (
SELECT Elect.Villager_Aadhar_No
FROM Elect
);
"""
```
### Query 14
We wish to know the Panchayat Member who has the highest salary
```
"""
SELECT
Villagers.Name AS Name,
Panchayat_Members.Salary AS Salary
FROM Villagers, Panchayat_Members
WHERE
Villagers.Aadhar_No = Panchayat_Members.Aadhar_No
ORDER BY Panchayat_Members.Salary DESC LIMIT 1;
"""
```
