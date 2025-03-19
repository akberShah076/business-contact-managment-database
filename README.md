# business-contact-managment-database
A relational database for managing business contacts, companies, and interactions. It includes tables for contact details, communication events, relationships, and company info. It ensures efficient data retrieval, enforces data integrity with foreign keys, and provides a scalable foundation for CRM and business analysis.

# Files:
DDL.sql: Contains Data Definition Language (DDL) statements to create the database schema. It sets up tables for storing contacts, companies, phone numbers, emails, and interaction events.

Usage: Run this file first to create the necessary database structure on your MySQL server.

DML.sql: Includes Data Manipulation Language (DML) statements to insert, update, and delete data in the database.

Usage: Run this file after DDL.sql to populate your tables with data and manage the records.

Python connector setup.py: A Python script for connecting to the MySQL database and interacting with the data using the MySQL connector.

Usage: Run this script to programmatically query and manage the database via Python.

Steps to Launch Locally:
Install MySQL Server locally.
Run DDL.sql to set up the database and tables.
Execute DML.sql to populate the database with sample data.
Use setup.py to connect and interact with the database using Python.

# Tables
✅ **Contacts** – Names, job titles, and related company details.  
✅ **Companies** – Information about the companies where contacts are employed.  
✅ **Addresses** – Home, office, and mailing addresses associated with each contact.  
✅ **Phone Numbers** – Contact phone details including mobile, office, home, fax, and secretary numbers.  
✅ **Email Addresses** – Work and personal email addresses for each contact.  
✅ **Interaction Events** – Records of interactions (phone calls, emails, postal communications) with each contact.  
✅ **Contact Comments** – Personal notes and context for each contact.  
✅ **Relationships** – Manager-subordinate relationships between contacts.  

---

## 🚀 **What It Does**  
This database serves as a **comprehensive contact management system** by:  

- Storing **contact details** and linking them to companies and other relational data.  
- Tracking **communications** with each contact, including the type, date, and content.  
- Managing multiple **addresses, phone numbers, and emails** for each contact.  
- Allowing hierarchical **relationship mapping** between contacts (e.g., manager-subordinate).  
- Supporting **data integrity** using foreign key constraints and normalized table structures.  

### 🔎 **Example Use Cases:**  
✔️ A business can use this database to track and manage relationships with clients and partners.  
✔️ Sales teams can log communication events with clients to improve customer relationship management (CRM).  
✔️ HR departments can organize employee data and hierarchical relationships within the company.  

---

## 🏗️ **Schema Overview**  
The database consists of **9 interrelated tables** that store and manage data with enforced constraints and relationships to maintain consistency and accuracy.  
- The schema follows **3rd Normal Form (3NF)** to eliminate redundancy and ensure flexibility.  

---

## ✅ **Key Features:**  
- **Efficient Data Retrieval:** Optimized schema design for fast data access and queries.  
- **Consistency and Integrity:** Foreign keys and constraints prevent data duplication and orphaned records.  
- **Scalability:** Designed to handle large datasets and growing business needs.  
- **Flexibility:** Support for multiple contact methods and interaction types.  
- **Security:** Data access limited to authorized users through secure MySQL connections.  

---

## 🔥 **Why It's Useful:**  
- Centralized storage of all contact-related information.  
- Easy tracking of communication history.  
- Clean and scalable data structure for future expansion.  
- Simplifies reporting and analysis of business interactions.  

---

## ✨ **Author**  
Akbar Ali Shah  
