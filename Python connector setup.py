import pymysql
import sys
import time

def displayMenu():
    print()
    print("BCTIS Database Interaction")
    print("***************************")
    print("1. List all interaction events for a specific contact")
    print("2. List all interaction events within a specific date range")
    print("3. List all contacts for a specific company")
    print("4. List the total number of phone calls within a specific period")
    print("5. List all subordinates of a specific manager")
    print("6. List all managers with more than 2 subordinates and a secretary")
    print("7. List all companies and the number of contacts associated with them")
    print("8. List all contacts with more than 3 interaction events")
    print("9. List total number of each type of interaction events")
    print("10. List all contacts with a home address in a specific city")
    print("11. Quit")

def getChoice():
    choice = input(">> ")
    while (not choice.isdigit()):
        print("Invalid choice...")
        displayMenu()
        choice = input(">> ")
    return int(choice)

def main():
    cnx = pymysql.connect(host='127.0.0.1', user='root', password='fortknox', database='BCITS_schema')
    cursor = cnx.cursor()
    displayMenu()
    choice = getChoice()
    while choice != 11:
        if choice == 1:
            contactID = input("Enter contact ID: ")
            query = "SELECT date, interactionType, comments FROM Interaction_Events WHERE contactID = %s"
            cursor.execute(query, (contactID,))
            for (date, interactionType, comments) in cursor:
                print(date, interactionType, comments)
        elif choice == 2:
            start_date = input("Enter start date (YYYY-MM-DD): ")
            end_date = input("Enter end date (YYYY-MM-DD): ")
            query = "SELECT eventID, contactID, date, interactionType, comments FROM Interaction_Events WHERE date BETWEEN %s AND %s"
            cursor.execute(query, (start_date, end_date))
            for row in cursor:
                print(row)
        elif choice == 3:
            companyID = input("Enter Company ID: ")
            query = "SELECT ContactID, Name, JobTitle FROM Contacts WHERE EmployerID = %s"
            cursor.execute(query, (companyID,))
            for (ContactID, Name, JobTitle) in cursor:
                print(ContactID, Name, JobTitle)
        elif choice == 4:
            start_date = input("Enter start date (YYYY-MM-DD): ")
            end_date = input("Enter end date (YYYY-MM-DD): ")
            query = "SELECT COUNT(*) AS TotalPhoneCalls FROM Interaction_Events WHERE interactionType = 'phone' AND date BETWEEN %s AND %s"
            cursor.execute(query, (start_date, end_date))
            print("Total phone calls:", cursor.fetchone()[0])
        elif choice == 5:
            managerID = input("Enter manager's ID: ")
            query = """
                SELECT 
                    c.name AS SubordinateName,
                    c.jobTitle AS JobTitle,
                    (SELECT pn.phoneNumber FROM Phone_Numbers pn WHERE pn.contactID = c.contactID AND pn.phoneType = 'office' LIMIT 1) AS OfficePhoneNumber,
                    (SELECT ea.emailAddress FROM Email_Addresses ea WHERE ea.contactID = c.contactID AND ea.emailType = 'work' LIMIT 1) AS PrimaryEmailAddress
                FROM 
                    Contacts c
                WHERE 
                    c.contactID IN (
                        SELECT r.subordinateID 
                        FROM Relationships r
                        JOIN Relationship_Type rt ON r.relationshipTypeID = rt.relationshipTypeID
                        WHERE r.managerID = %s AND rt.relationshipType = 'subordinate'
                    );
            """
            cursor.execute(query, (managerID,))
            for row in cursor:
                print(row)
        elif choice == 6:
            query = """
                SELECT r.managerID, c.name AS ManagerName,
                    COUNT(DISTINCT CASE WHEN rt.relationshipType = 'Subordinate' THEN r.subordinateID END) AS NumberOfSubordinates,
                    COUNT(DISTINCT CASE WHEN rt.relationshipType = 'Secretary' THEN r.subordinateID END) AS NumberOfSecretaries
                FROM Relationships r JOIN Contacts c ON r.managerID = c.contactID
                JOIN Relationship_Type rt ON r.relationshipTypeID = rt.relationshipTypeID
                GROUP BY r.managerID, c.name
                HAVING NumberOfSubordinates > 2 AND NumberOfSecretaries > 0;
            """
            cursor.execute(query)
            for row in cursor:
                print(row)
        elif choice == 7:
            query = """
                SELECT c.CompanyID, c.CompanyName, COUNT(ct.ContactID) AS NumberOfContacts
                FROM Companies c
                JOIN Contacts ct ON c.CompanyID = ct.EmployerID
                GROUP BY c.CompanyID, c.CompanyName
                ORDER BY NumberOfContacts DESC;
            """
            cursor.execute(query)
            for row in cursor:
                print(row)
        elif choice == 8:
            query = "SELECT contactID, COUNT(*) AS NumberOfInteractions FROM Interaction_Events GROUP BY contactID HAVING NumberOfInteractions > 3;"
            cursor.execute(query)
            for row in cursor:
                print(row)
        elif choice == 9:
            query = """
                SELECT 
                    SUM(CASE WHEN interactionType = 'phone' THEN 1 ELSE 0 END) AS TotalPhoneEvents,
                    SUM(CASE WHEN interactionType = 'email' THEN 1 ELSE 0 END) AS TotalEmailEvents,
                    SUM(CASE WHEN interactionType = 'postal' THEN 1 ELSE 0 END) AS TotalPostalEvents
                FROM Interaction_Events;
            """
            cursor.execute(query)
            for row in cursor:
                print(row)
        elif choice == 10:
            city = input("Enter city name: ")
            query = """
                SELECT c.ContactID, c.Name, a.street, a.city, a.state, a.postalCode, a.country
                FROM Contacts c
                JOIN Addresses a ON c.contactID = a.contactID
                WHERE a.addressType = 'home' AND a.city = %s;
            """
            cursor.execute(query, (city,))
            for row in cursor:
                print(row)

        displayMenu()
        choice = getChoice()

    cursor.close()
    cnx.close()

if __name__ == "__main__":
    main()
