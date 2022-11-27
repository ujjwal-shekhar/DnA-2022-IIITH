import subprocess as sp
import pymysql
import pymysql.cursors

def add_new_villager():
    """
    This is a function to satisfy one of the INSERT functional requirements.
    We ask the user to enter relevant data about the new villager.
    """
    try:
        row = {}
        print("Enter new villager's details: ")
        row["AADHAR"] = input("Please enter the villager's AADHAR Number: ")
        row["PAN"] = input("Please enter the villager's PAN Number: ")
        row["Name"] = input("Please enter the villager's name: ")
        row["Caste"] = input("Please enter the villager's caste/Sect: ")
        row["Sex"] = input("Please enter the villager's sex: ")
        row["Age"] = int(input("Please enter the villager's age: "))
        row["Phone"] = int(input("Please enter the villager's phone number: "))
        row["Literacy"] = input("Is the villager literate? (Y / N) : ")
        row["Occupation"] = input("Please enter the villager's occupation (None (case-sensitive) if not employed): ")
    
        if row["Literacy"] == 'n' or row["Literacy"] == 'N':
            row["Literacy"] = "Illiterate"
        elif row["Literacy"] == 'y' or row["Literacy"] == 'Y':
            row["Literacy"] = "Literate"
        else:
            raise Exception("Invalid input for Literacy")

        query = """INSERT INTO Villagers
                (Aadhar_No, Pan_No, Name, Caste_or_Sect, Sex, Age, Phone_No, Literacy, Occupation)
                VALUES('%s', '%s', '%s', '%s', '%s', '%d', '%d', '%s', '%s')""" % (
                row["AADHAR"], row["PAN"], row["Name"], row["Caste"], row["Sex"], \
                row["Age"],  row["Phone"], row["Literacy"], row["Occupation"])
        
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database\n")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return

def delete_small_business():
    """
    We will delete small business data
    """

    try:
        row = {}
        row["AADHAR"] = input("Enter small business owner's AADHAR Number : ")
        row["Name"] = input("Enter name of the small business : ")

        query = """DELETE FROM `Small_Businesses`
                 WHERE Aadhar_No = '%s' AND Name = '%s'""" % (row["AADHAR"], row["Name"])

        print(query, (row["AADHAR"], row["Name"]))
        cur.execute(query)
        con.commit()

        print("Deleted from Database\n")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return

def upd_num_emp_small_bsnss():
    """
    Update the number of employees in a small business.
    """

    row = {}
    row["AADHAR"] = input("Enter small business owner's AADHAR Number : ")
    row["Name"] = input("Enter name of the small business : ")
    row["No_of_employees"] = int(input("Enter the new number of employees : "))

    try:
        query = """UPDATE `Small_Businesses`
                 SET No_of_employees = '%d'
                 WHERE Aadhar_No = '%s' AND Name = '%s'""" %(
                    row["No_of_employees"], row["AADHAR"], row["Name"]
                 )

        print(query)
        cur.execute(query)
        con.commit()

        #printTable(cur.fetchall())
        
        print("Updated Database!\n")

    except Exception as e:
        con.rollback()
        print("Failed to update database!\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")


    return

def get_avg_age_villager():
    """
    Get the average age of a villager.
    This is an indicator of financially productive population, percent working man power
    """

    try:
        query = """SELECT AVG(Age) AS 'Average Age'
                FROM Villagers"""

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched average age of villagers!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch average age of villagers\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return

def get_vaccination_events():
    """
    List details of Vaccination events.
    This is a query that can be used to check what diseases are still to be checked.
    This could also come in handy to check vaccination events that have occured.
    """

    try:
        query = """SELECT * FROM Events 
                WHERE Purpose LIKE '%Vaccination%'"""

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return

def get_nurse_data():
    """
    """

    try:
        query = """SELECT Aadhar_No, Name, Age, Sex, Phone_No
                FROM Villagers
                WHERE Occupation
                LIKE '%Nurse%'"""

        print(query)
        cur.execute(query)
        
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return


def get_large_farm_owners():
    """
    """
    LARGE_FARM_CUTOFF = int(input("Enter the cutoff for a large farm (in sq. m) : ")) #sq-m

    try:
        query = """SELECT Villagers.Aadhar_No AS 'AADHAR No.',
                 Farmlands.Serial_No AS 'Farmland No',
                 Villagers.Name AS 'Owner Name',
                 Farmlands.Area AS 'Land Size' 
                 FROM Villagers INNER JOIN Farmlands
                 ON Farmlands.Aadhar_No = Villagers.Aadhar_No
                 WHERE Farmlands.Area >= '%d'"""%(LARGE_FARM_CUTOFF)

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return

def get_income_vs_caste():
    """
    List average income of each caste.
    """

    try:
        query = """SELECT Villagers.Caste_or_Sect AS 'Caste',
                 AVG(Taxation.Total_Income) AS 'Average Income'
                 FROM Villagers, Taxation
                 WHERE Villagers.Aadhar_No = Taxation.Aadhar_No
                 GROUP BY Villagers.Caste_or_Sect"""

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return


def get_ppl_in_age_group():
    """
    """

    try:
        query = """SELECT Age_Group, COUNT(*) AS 'Number of People'  FROM Age_Demography GROUP BY Age_Group"""

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return

def get_ppl_availing_MGNREGA():
    """
    """

    try:
        query = """SELECT Govt_Schemes.Which AS 'Scheme Name',
                 Govt_Schemes.Since_When AS 'Time since in effect',
                 Govt_Schemes.Benefits_Provided AS 'Benefits',
                 Villagers.Name AS 'Beneficiary Name'
                 FROM Govt_Schemes INNER JOIN Villagers ON
                 Villagers.Aadhar_No = Govt_Schemes.Aadhar_No
                 WHERE Govt_Schemes.Which LIKE '%MGNREGA%'"""

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return

def get_major_sources():
    """
    """
    LARGE_SOURCE_CUTOFF = int(input("Enter the cutoff for being a major source : "))
    try:
        query = "SELECT * FROM Sources WHERE Sources.Amount >= '%d'"%(LARGE_SOURCE_CUTOFF)

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return

def complex_query_1():
    """
    List tax waivers and information of Panchayat members with farmland area >= 1000 m2.
    This functional requirement could help analyze if panchayat members are abusing their powers.
    """

    try:
        query = """
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
                    AND Farmlands.Area >= 1000
                """

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")
    return

def complex_query_2():
    """
    List number of employed women above the age of 30.
    This will help user to analyze how educated middle aged women are in the community.
    Unemployement is the filing of 0 declared income in the Taxation data.
    """

    try:
        query = """
                SELECT
                    Villagers.Name AS Name,
                    Villagers.Age AS Age,
                    Taxation.Total_Income AS 'Current Income'
                FROM Villagers, Taxation
                WHERE
                    Villagers.Aadhar_No = Taxation.Aadhar_No AND
                    Taxation.Total_Income <> 0 AND
                    Villagers.Sex = 'Female' AND
                    Villagers.Age > 30
                """

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")

    return 

def complex_query_3():
    """
    List details of people with names starting with "A" and are in the top 30% of tax payers.
    This will help analyzing name v/s tax payer demographic.
    """

    try:
        query = """
            SELECT *
            FROM    (
                SELECT Name, @counter := @counter +1 AS 'Priority'
                FROM (select @counter:=0) AS initvar, Tax_Details
                WHERE Name LIKE 'A%'
                ORDER BY Tax_Amount DESC   
            ) AS X
            where Priority <= (100/100 * @counter);
        """

        print(query)
        cur.execute(query)
        con.commit()
        print("Fetched query!!")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return

def get_non_voters():
    """
    """

    try:
        query = """
                SELECT
                    Villagers.Aadhar_No AS `Non-Voter AADHAR NUMBER`,
                    Villagers.Name AS `Non-Voter Name`
                FROM Villagers
                WHERE
                    Villagers.Aadhar_No NOT IN (
                        SELECT Elect.Villager_Aadhar_No
                        FROM Elect
                    )
                """

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")
    return

def get_max_salary_panchayat():
    """
    """

    try:
        query = """
                SELECT
                    Villagers.Name AS Name,
                    Panchayat_Members.Salary AS Salary
                FROM Villagers, Panchayat_Members
                WHERE
                    Villagers.Aadhar_No = Panchayat_Members.Aadhar_No 
                ORDER BY Panchayat_Members.Salary DESC LIMIT 1
                """

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")
    return

def get_second_dose_defaulters():
    """
    """

    try:
        # query = """
        #         SELECT
        #             Villagers.Name AS 'Defaulter Name',
        #             Villagers.Aadhar_No AS 'Defaulter Aadhar No'
        #         FROM 
        #             Event_Participation
        #         INNER JOIN
        #             Villagers
        #         ON 
        #             Villagers.Aadhar_No = Event_Participation.Villager_Aadhar_No
        #         WHERE
        #             Event_Participation.Date = '2022-04-22'
                            
        #         """

        query = """
                SELECT 
                    Villagers1.Aadhar_No AS 'Defaulter Aadhar No',
                    Villagers1.Name AS 'Defaulter Name'
                FROM Villagers AS Villagers1, Events, Event_Participation
                WHERE 
                    Villagers1.Aadhar_No = Event_Participation.Villager_Aadhar_No AND
                    Event_Participation.Date = Events.Date AND
                    Events.Purpose LIKE '%1st Dose%' AND
                    Villagers1.Aadhar_No NOT IN (
                        SELECT Villagers2.Aadhar_No
                        FROM Villagers AS Villagers2, Events, Event_Participation
                        WHERE Villagers2.Aadhar_No = Event_Participation.Villager_Aadhar_No AND
                            Event_Participation.Date = Events.Date AND
                            Events.Purpose LIKE '%2nd Dose%'
                    )

                """

        print(query)
        cur.execute(query)
        con.commit()

        printTable(cur.fetchall())

        print("Fetched query!!\n")

    except Exception as e:
        con.rollback()
        print("Failed to fetch query results\n")
        print(">>>>>>>>>>>>>\n\n\n", e)
        print(">>>>>>>>>>>>>\n\n\n")
    
    return

def printTable(myDict, colList=None):
   """ Pretty print a list of dictionaries (myDict) as a dynamically sized table.
   If column names (colList) aren't specified, they will show in random order.
   Author: Thierry Husson - Use it as you want but don't blame me.
   """
   if not colList: colList = list(myDict[0].keys() if myDict else [])
   myList = [colList] # 1st row = header
   for item in myDict: myList.append([str(item[col] if item[col] is not None else '') for col in colList])
   colSize = [max(map(len,col)) for col in zip(*myList)]
   formatStr = ' | '.join(["{{:<{}}}".format(i) for i in colSize])
   myList.insert(1, ['-' * i for i in colSize]) # Seperating line
   for item in myList: print(formatStr.format(*item))

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        add_new_villager()
    elif(ch == 2):
        delete_small_business()
    elif(ch == 3):
        upd_num_emp_small_bsnss()
    elif(ch == 4):
        get_avg_age_villager()
    elif(ch == 5):
        get_vaccination_events()
    elif(ch == 6):
        get_nurse_data()
    elif(ch == 7):
        get_large_farm_owners()
    elif(ch == 8):
        get_income_vs_caste()
    elif(ch == 9):
        get_ppl_in_age_group()
    elif(ch == 10):
        get_major_sources()
    elif(ch == 11):
        complex_query_1()
    elif(ch == 12):
        complex_query_2()
    elif(ch == 13):
        complex_query_3()
    elif(ch == 14):
        get_non_voters()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = "root" #input("Username: ")
    password = "mynewpassword" #input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="mynewpassword",
                              db='DnA_PP4',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                print("1. Add details of a Villager")
                print("2. Delete the detials of a Small Business")
                print("3. Update the Number of Employees of a Small Business")
                print("4. Get the average age of all villagers")
                print("5. Get details of all vaccination events that have taken place")
                print("6. Get all details about all villagers that are nurses")
                print("7. Get all details about villagers that own Farms")
                print("8. Get the average income of each caste")
                print("9. Get the number of people belonging to a particular age group")
                print("10. Get the sources that have contributed the most")
                print("11. List tax waivers and information of Panchayat members with farmland area >= 1000 m2")
                print("12. List number of employed women above the age of 30")
                print("13. List details of people with names starting with \"A\" and are in the top 30 percent of tax payers")
                print("14. List details of people who didn't vote.")
                print("15. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 15:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")