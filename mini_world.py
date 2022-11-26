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
        row["Age"] = input("Please enter the villager's age: ")
        row["Phone"] = int(input("Please enter the villager's phone number: "))
        row["Literacy"] = int(input("Is the villager literate? (Y / N) : "))
        row["Occupation"] = input("Please enter the villager's occupation (none if not employed): ")
    
        if row["Literacy"] == 'n' or row["Literacy"] == 'N':
            row["Literacy"] = "Illiterate"
        elif row["Literacy"] == 'y' or row["Literacy"] == 'Y':
            row["Literacy"] = "Literate"
        else:
            raise Exception("Invalid input for Literacy")

        query = "INSERT INTO VILLAGER\
                (Aadhar_No, Pan_No, Name, Caste, Sex, Age, Phone, Literacy, Occupation) \
                VALUES('%d', '%d', '%s', '%s', '%s', '%d', '%d', %s, %s)" % (
                row["AADHAR"], row["PAN"], row["Name"], row["Caste"], row["Sex"], \
                row["Sex"],  row["Phone"], row["Literacy"], row["Occupation"])
        
        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def delete_small_business():
    """
    We will delete small business data
    """

    row ={}
    row["AADHAR"] = input("Enter small business owner's AADHAR Number")
    row["name"] = input("Enter name of the small business")

    try:
        query = "DELETE FROM `SMALL BUSINESS`\
                 WHERE Aadhar_No = %d AND Name = %s"

        print(query)
        cur.execute(query, (row["AADHAR"], row["Name"]))
        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return

def upd_num_emp_small_bsnss():
    """
    """

    row = {}
    row["AADHAR"] = input("Enter small business owner's AADHAR Number")
    row["name"] = input("Enter name of the small business")
    row["No_of_employees"] = input("Enter the new number of employees : ")

    try:
        query = "UPDATE `Small_Businesses`\
                 SET No_of_employees = %d\
                 WHERE Aadhar_No = %d AND Name = %s"

        print(query)
        cur.execute(query, (row["No_of_employees"]))
        con.commit()

        print("Updated Database!")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)


    return

def get_avg_age_villager():
    """
    """

    try:
        query = "SELECT AVG(Age) AS `Average Age`\
                FROM VILLAGERS"

        print(query)
        cur.execute(query)
        con.commit()

        print("Fetched average age of villagers!!")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return

def get_vaccination_events():
    """
    """

    try:
        query = "SELECT * FROM Events \
                WHERE Purpose LIKE '%Vaccination%'"

        print(query)
        cur.execute(query)
        con.commit()

        print("Fetched average age of villagers!!")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return

def get_nurse_data():
    """
    """

    try:
        query = "SELECT Aadhar_No, Name, Age, Sex, Phone_No\
                FROM Villagers\
                WHERE Occupation\
                LIKE '%Nurse%'"

        print(query)
        cur.execute(query)
        con.commit()

        print("Fetched average age of villagers!!")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return


def get_large_farm_owners():
    """
    """
    LARGE_FARM_CUTOFF = 500 #sq-m

    try:
        query = "SELECT * \
                FROM Villagers\
                WHERE Occupation\
                LIKE '%Nurse%'"

        print(query)
        cur.execute(query)
        con.commit()

        print("Fetched average age of villagers!!")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return

def get_salary_vs_caste():
    """
    """

    # try:

    # except:

    return

def get_large_farm_owners():
    """
    """

    # try:

    # except:

    return

def get_ppl_in_age_group():
    """
    """

    # try:

    # except:

    return

def get_ppl_availing_MGNREGA():
    """
    """

    # try:

    # except:

    return

def get_major_sources():
    """
    """

    # try:

    # except:

    return

def get_farmlands_with_tubewells():
    """
    """

    # try:

    # except:

    return

def complex_query_1():
    """
    List tax waivers of Panchayat members with farmland area >= 1000 m2.
    This functional requirement could help analyze if panchayat members are abusing powers
    """

    try:
        query = "SELECT Panchayat_Members.Aadhar_No, \
                        Villagers.Name,\
                        Panchayat_Members.Salary,\
                        Panchayat_Members.Years_Of_Service\
                 FROM Panchayat_Members, Villagers, Farmlands\
                 WHERE Panchayat_Members.Aadhar_No = Villagers.Aadhar_No\
                    AND Farmlands.Area >= 1000"

        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)

    return

def hireAnEmployee():
    """
    This is a sample function implemented for the refrence.
    This example is related to the Employee Database.
    In addition to taking input, you are required to handle domain errors as well
    For example: the SSN should be only 9 characters long
    Sex should be only M or F
    If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
    HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
    """
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new employee's details: ")
        name = (input("Name (Fname Minit Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Minit"] = name[1]
        row["Lname"] = name[2]
        row["Ssn"] = input("SSN: ")
        row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
        row["Address"] = input("Address: ")
        row["Sex"] = input("Sex: ")
        row["Salary"] = float(input("Salary: "))
        row["Dno"] = int(input("Dno: "))

        query = "INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Dno) VALUES('%s', '%c', '%s', '%s', '%s', '%s', '%c', %f, %d)" % (
            row["Fname"], row["Minit"], row["Lname"], row["Ssn"], row["Bdate"], row["Address"], row["Sex"], row["Salary"], row["Dno"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        hireAnEmployee()
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="mynewpassword",
                              db='DNA_TEST',
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
                # Here taking example of Employee Mini-world
                print("1. Option 1")  # Hire an Employee
                print("2. Option 2")  # Fire an Employee
                print("3. Option 3")  # Promote Employee
                print("4. Option 4")  # Employee Statistics
                print("5. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 5:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")