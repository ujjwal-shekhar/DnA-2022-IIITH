import subprocess as sp
import pymysql
import pymysql.cursors

def test_db():
    """
    """

    try:
        query = """
           
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


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        test_db()
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
                              password="acharya neela ghora nehn ka lora",
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
                print("1. Test this")  # Test
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