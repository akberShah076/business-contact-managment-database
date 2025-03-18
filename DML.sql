INSERT INTO Companies (CompanyID, CompanyName) VALUES
(1, 'Tech Innovations Inc.'),
(2, 'Green Solutions'),
(3, 'Tesla'),
(4, 'Ford'),
(5, 'University of Miami');


INSERT INTO Contacts (ContactID, name, salutation, jobtitle, employerID) VALUES
(1, 'John Doe', 'Mr.', 'Software Developer', 1),
(2, 'Jane Smith', 'Ms.', 'Project Manager', 2),
(3, 'Ahmed Khan', 'Mr.', 'Research Analyst', 3),
(4, 'Maria Garcia', 'Ms.', 'Data Scientist', 4),
(5, 'Hamza Shah', 'Mr.', 'Product Manager', 5),
(6, 'Laura Jones', 'Ms.', 'Secretary', 1),
(7, 'Omar Said', 'Mr.', 'Operations Manager', 2),
(8, 'Alice Johnson', 'Ms.', 'Marketing Specialist', 3),
(9, 'Raj Patel', 'Mr.', 'Customer Service Lead', 4),
(10, 'Ankita Ali', 'Ms.', 'HR Manager', 5),
(11, 'Michael Brown', 'Mr.', 'Quality Assurance Engineer', 1),
(12, 'Lucy Liu', 'Ms.', 'Financial Analyst', 2),
(13, 'Carlos Diaz', 'Mr.', 'Sales Executive', 3),
(14, 'Nora Fatehi', 'Ms.', 'Secretary', 4),
(15, 'Nate Diaz', 'Mr.', 'Logistics Coordinator', 5),
(16, 'Isabella Tan', 'Ms.', 'IT Support Specialist', 1),
(17, 'Sergey Brin', 'Mr.', 'Secretary', 2),
(18, 'Anne Hathaway', 'Ms.', 'Public Relations Manager', 3),
(19, 'Bruce Willis', 'Mr.', 'Operations Specialist', 4),
(20, 'Tom Ford', 'Ms.', 'Chief Marketing Officer', 5);


INSERT INTO Contacts (ContactID, name, salutation, jobtitle, employerID) VALUES
(21, 'John Hancock', 'Mr.', 'Junior Software Engineer', 1);


INSERT INTO Contacts (ContactID, name, salutation, jobtitle, employerID) VALUES
(22, 'James Hearn', 'Mr.', 'Junior Software Engineer', 1),
(23, 'John Mclain', 'Mr.', 'Software Engineering Intern', 1);

INSERT INTO Relationship_Type (RelationshipType) VALUES
('subordinate'),
('secretary'),
('submanager');


INSERT INTO Relationships (ManagerID, SubordinateID, RelationshipTypeID) VALUES
(11, 1, 1),  -- Contact 11 is the manager of Contact 1 as a subordinate
(11, 6, 2),  -- Contact 11 is the manager of Contact 6 as a secretary
(1, 21, 3),  -- Contact 1 is the manager of Contact 21 as a submanager
(11, 6, 1); -- Contact 11 is the manager of Contact 6 as a subordinate


INSERT INTO Relationships (ManagerID, SubordinateID, RelationshipTypeID) VALUES
(11, 1, 1);  -- Contact 11 is the manager of Contact 1 as a subordinate


INSERT INTO Relationships (ManagerID, SubordinateID, RelationshipTypeID) VALUES
(11, 22, 1),  -- Contact 11 is the manager of Contact 22 as a subordinate
(11, 23, 1);  -- Contact 11 is the manager of Contact 22 as a subordinate

INSERT INTO Addresses (contactID, addressType, street, city, state, postalCode, country) VALUES
(1, 'home', '1234 Oak Street', 'Springfield', 'IL', '62704', 'USA'),
(1, 'office', '100 Enterprise Ave', 'Springfield', 'IL', '62703', 'USA'),

(2, 'home', '5678 Maple Street', 'Decatur', 'IL', '62521', 'USA'),
(2, 'mailing', 'PO Box 1122', 'Decatur', 'IL', '62525', 'USA'),
(3, 'home', '910 Apple Blvd', 'Champaign', 'IL', '61820', 'USA'),
(4, 'office', '2900 Finance Center', 'Chicago', 'IL', '60601', 'USA'),
(5, 'home', '750 Berry Lane', 'Chicago', 'IL', '60647', 'USA'),
(5, 'office', '321 Tech Parkway', 'Chicago', 'IL', '60618', 'USA'),
(6, 'mailing', 'PO Box 1414', 'Chicago', 'IL', '60690', 'USA'),
(7, 'home', '852 River Road', 'Peoria', 'IL', '61602', 'USA');

INSERT INTO Addresses (contactID, addressType, street, city, state, postalCode, country) VALUES
(1, 'mailing', '1234 Oak Street', 'Springfield', 'IL', '62704', 'USA');

INSERT INTO Addresses (contactID, addressType, street, city, state, postalCode, country) VALUES
(10, 'home', '1985 Rose Court', 'Chicago', 'IL', '60610', 'USA'),
(10, 'office', '320 Windy Lane', 'Chicago', 'IL', '60606', 'USA'),
(11, 'mailing', 'PO Box 2233', 'Chicago', 'IL', '60609', 'USA'),
(12, 'home', '75 Peachtree St', 'Atlanta', 'GA', '30303', 'USA'),
(13, 'office', '200 Capitol Ave', 'Springfield', 'IL', '62701', 'USA'),
(14, 'home', '4501 Sunset Blvd', 'Los Angeles', 'CA', '90027', 'USA'),
(14, 'office', '100 Universal City Plaza', 'Los Angeles', 'CA', '91608', 'USA'),
(15, 'mailing', 'PO Box 3300', 'Naperville', 'IL', '60566', 'USA'),
(16, 'home', '2300 Lincoln Park West', 'Chicago', 'IL', '60614', 'USA'),
(17, 'home', '3600 Mystic Pointe', 'Miami', 'FL', '33180', 'USA');

INSERT INTO Phone_Numbers (ContactID, PhoneType, PhoneNumber) VALUES
(1, 'mobile', '555-123-4567'),
(1, 'office', '555-123-8901'),
(2, 'home', '555-321-4321'),
(3, 'fax', '555-456-7890'),
(4, 'secretary', '555-654-0987'),
(5, 'mobile', '555-789-1234'),
(6, 'office', '555-987-6543'),
(7, 'home', '555-567-8901'),
(8, 'fax', '555-345-6789'),
(9, 'secretary', '555-765-4321'),
(10, 'mobile', '555-234-5678'),
(11, 'office', '555-876-5432'),
(12, 'home', '555-678-9012'),
(13, 'fax', '555-987-1234'),
(14, 'secretary', '555-432-1098'),
(15, 'mobile', '555-543-2109'),
(16, 'office', '555-321-0987'),
(17, 'home', '555-210-3456'),
(18, 'fax', '555-654-3210'),
(20, 'mobile', '555-789-2345');

INSERT INTO Email_Addresses (ContactID, EmailType, EmailAddress) VALUES
(1, 'work', 'john.doe@techinnovations.com'),
(1, 'personal', 'johndoe@gmail.com'),
(2, 'work', 'jane.smith@greenenergy.com'),
(2, 'personal', 'jane.smith@hotmail.com'),
(3, 'work', 'ahmed.khan@advancedlabs.com'),
(4, 'work', 'maria.garcia@creativemedia.com'),
(4, 'personal', 'maria.garcia@yahoo.com'),
(5, 'work', 'hamza.shah@globalfinance.com'),
(6, 'work', 'laura.jones@techinnovations.com'),
(7, 'personal', 'omar.said@outlook.com'),
(8, 'work', 'alice.johnson@advancedlabs.com'),
(9, 'work', 'raj.patel@creativemedia.com'),
(10, 'personal', 'ankita.ali@gmail.com'),
(11, 'work', 'michael.brown@techinnovations.com'),
(12, 'work', 'lucy.liu@greenenergy.com'),
(13, 'work', 'carlos.diaz@advancedlabs.com'),
(14, 'personal', 'nora.fatehi@personalmail.com'),
(15, 'work', 'nate.diaz@globalfinance.com'),
(16, 'work', 'isabella.tan@techinnovations.com'),
(17, 'personal', 'sergey.brin@privatemail.com'),
(18, 'work', 'anne.hathaway@advancedlabs.com'),
(19, 'work', 'bruce.willis@creativemedia.com'),
(20, 'work', 'tom.ford@globalfinance.com'),
(21, 'work', 'john.hancock@techinnovations.com'),
(22, 'personal', 'james.hearn@private.com'),
(23, 'work', 'john.mclain@techinnovations.com');

INSERT INTO Interaction_Events (eventID, contactID, interactionType, date, comments, phoneID, emailID, addressID) VALUES
(1, 1, 'phone', '2024-05-01', 'Initial project discussion.', 1, NULL, NULL),
(1, 2, 'phone', '2024-05-01', 'Continued project discussion.', 1, NULL, NULL),
(2, 3, 'email', '2024-05-02', 'Sent project proposal.', NULL, 1, NULL),
(2, 4, 'email', '2024-05-02', 'Feedback received on proposal.', NULL, 1, NULL),
(3, 5, 'postal', '2024-05-03', 'Sent contract documents.', NULL, NULL, 1),
(3, 6, 'postal', '2024-05-03', 'Received signed contracts.', NULL, NULL, 1),
(4, 7, 'phone', '2024-05-04', 'Support call regarding software usage.', 2, NULL, NULL),
(4, 8, 'phone', '2024-05-04', 'Follow-up on support call.', 2, NULL, NULL),
(5, 9, 'email', '2024-05-05', 'Sent invoice details.', NULL, 2, NULL),
(5, 10, 'email', '2024-05-05', 'Confirmation of invoice receipt.', NULL, 2, NULL),
(6, 11, 'postal', '2024-05-06', 'Marketing materials sent.', NULL, NULL, 2),
(6, 12, 'postal', '2024-05-06', 'Received feedback on marketing.', NULL, NULL, 2),
(7, 13, 'phone', '2024-05-07', 'Scheduling delivery arrangements.', 3, NULL, NULL),
(7, 14, 'phone', '2024-05-07', 'Confirming delivery schedule.', 3, NULL, NULL),
(8, 15, 'email', '2024-05-08', 'Monthly performance report sent.', NULL, 3, NULL),
(8, 16, 'email', '2024-05-08', 'Discussion on report findings.', NULL, 3, NULL),
(9, 17, 'postal', '2024-05-09', 'New product samples sent.', NULL, NULL, 3),
(9, 18, 'postal', '2024-05-09', 'Received feedback on new products.', NULL, NULL, 3),
(10, 19, 'phone', '2024-05-10', 'Product return process.', 4, NULL, NULL),
(10, 20, 'phone', '2024-05-10', 'Resolved product return issues.', 4, NULL, NULL),
(10, 21, 'phone', '2024-05-10', 'Mediated product return issues.', 4, NULL, NULL);

INSERT INTO Interaction_Events (eventID, contactID, interactionType, date, comments, phoneID, emailID, addressID) VALUES
(11, 1, 'phone', '2024-05-10', 'Follow-up on project progress with team member.', 1, NULL, NULL),
(11, 2, 'phone', '2024-05-10', 'Participated in project progress follow-up call.', 1, NULL, NULL),
(12, 1, 'email', '2024-05-15', 'Emailed project risk analysis to team.', NULL, 1, NULL),
(12, 2, 'email', '2024-05-15', 'Received project risk analysis and provided feedback.', NULL, 1, NULL),
(13, 1, 'phone', '2024-05-15', 'Initiated call to schedule project closure meeting.', 1, NULL, NULL),
(13, 2, 'phone', '2024-05-15', 'Confirmed availability for project closure meeting.', 1, NULL, NULL);




INSERT INTO Contact_Comments (contactID, comment, context) VALUES
(1, 'Birthday on May 15th, consider getting a tech gadget as a gift.', 'Birthday tracking for gift considerations.'),
(2, 'Potential contact valuable for future mergers and acquisitions.', 'Strategic business planning.'),
(3, 'Advisor has critical skills in financial management, valuable if hired full-time.', 'Recruitment and team development.'),
(4, 'Contact prefers communications via email. Sensitive to phone calls.', 'Communication preferences.'),
(5, 'Has significant influence in the renewable energy sector.', 'Key industry contact for potential partnerships.'),
(6, 'Remembers meeting details very well, mention previous discussions to strengthen rapport.', 'Relationship management tip.'),
(7, 'Allergic to peanuts, ensure all corporate catering is allergy-friendly.', 'Health and safety for corporate events.'),
(8, 'Very interested in arts and culture, good topic for small talk.', 'Personal interests for building rapport.'),
(9, 'Looking to retire in the next two years, potential opportunity for a leadership transition.', 'Strategic succession planning.'),
(10, 'Family is important to them, often attends events on weekends.', 'Personal life understanding for scheduling.');
