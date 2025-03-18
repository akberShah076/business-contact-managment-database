CREATE TABLE `Addresses` (
  `addressID` int NOT NULL AUTO_INCREMENT,
  `contactID` int NOT NULL,
  `addressType` enum('home','office','mailing') NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `postalcode` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`addressID`),
  KEY `contactID_fk2_idx` (`contactID`),
  CONSTRAINT `contactID_fk2` FOREIGN KEY (`contactID`) REFERENCES `Contacts` (`contactID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `Companies` (
  `companyID` int NOT NULL,
  `companyName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`companyID`),
  UNIQUE KEY `CompanyID_UNIQUE` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Contact_Comments` (
  `personalCommentID` int NOT NULL AUTO_INCREMENT,
  `contactID` int NOT NULL,
  `comment` varchar(500) NOT NULL,
  `context` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`personalCommentID`),
  KEY `contactID_fk_1_idx` (`contactID`),
  CONSTRAINT `contactID_fk_1` FOREIGN KEY (`contactID`) REFERENCES `Contacts` (`contactID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Contacts` (
  `contactID` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `salutation` varchar(45) DEFAULT NULL,
  `jobTitle` varchar(45) NOT NULL,
  `employerID` int NOT NULL,
  PRIMARY KEY (`contactID`),
  UNIQUE KEY `contactID_UNIQUE` (`contactID`),
  KEY `employerID_fk` (`employerID`),
  CONSTRAINT `employerID_fk` FOREIGN KEY (`employerID`) REFERENCES `Companies` (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Email_Addresses` (
  `EmailID` int NOT NULL AUTO_INCREMENT,
  `ContactID` int NOT NULL,
  `EmailType` enum('work','personal') NOT NULL,
  `EmailAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`EmailID`),
  KEY `ContactID` (`ContactID`),
  CONSTRAINT `email_addresses_ibfk_1` FOREIGN KEY (`ContactID`) REFERENCES `Contacts` (`contactID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Interaction_Events` (
  `eventID` int NOT NULL,
  `contactID` int NOT NULL,
  `interactionType` enum('phone','email','postal') NOT NULL,
  `date` date NOT NULL,
  `comments` text,
  `phoneID` int DEFAULT NULL,
  `emailID` int DEFAULT NULL,
  `addressID` int DEFAULT NULL,
  PRIMARY KEY (`eventID`,`contactID`),
  KEY `contactID` (`contactID`),
  KEY `phoneID` (`phoneID`),
  KEY `emailID` (`emailID`),
  KEY `addressID` (`addressID`),
  CONSTRAINT `interaction_events_ibfk_1` FOREIGN KEY (`contactID`) REFERENCES `Contacts` (`contactID`) ON DELETE CASCADE,
  CONSTRAINT `interaction_events_ibfk_2` FOREIGN KEY (`phoneID`) REFERENCES `Phone_Numbers` (`phoneID`) ON DELETE SET NULL,
  CONSTRAINT `interaction_events_ibfk_3` FOREIGN KEY (`emailID`) REFERENCES `Email_Addresses` (`EmailID`) ON DELETE SET NULL,
  CONSTRAINT `interaction_events_ibfk_4` FOREIGN KEY (`addressID`) REFERENCES `Addresses` (`addressID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Phone_Numbers` (
  `phoneID` int NOT NULL AUTO_INCREMENT,
  `contactID` int NOT NULL,
  `phoneType` enum('mobile','office','home','fax','secretary') NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`phoneID`),
  KEY `contactID` (`contactID`),
  CONSTRAINT `phone_numbers_ibfk_1` FOREIGN KEY (`contactID`) REFERENCES `Contacts` (`contactID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Relationships` (
  `relationshipID` int NOT NULL AUTO_INCREMENT,
  `managerID` int NOT NULL,
  `subordinateID` int NOT NULL,
  `relationshipTypeID` int NOT NULL,
  PRIMARY KEY (`relationshipID`),
  KEY `managerID` (`managerID`),
  KEY `relationships_ibfk_2` (`subordinateID`),
  KEY `relationshipTypeID_fk_3_idx` (`relationshipTypeID`),
  CONSTRAINT `relationships_ibfk_1` FOREIGN KEY (`managerID`) REFERENCES `Contacts` (`contactID`) ON DELETE CASCADE,
  CONSTRAINT `relationships_ibfk_2` FOREIGN KEY (`subordinateID`) REFERENCES `Contacts` (`contactID`) ON DELETE CASCADE,
  CONSTRAINT `relationshipTypeID_fk_3` FOREIGN KEY (`relationshipTypeID`) REFERENCES `Relationship_Type` (`relationshipTypeID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

CREATE TABLE `Relationship_Type` (
  `relationshipTypeID` int NOT NULL AUTO_INCREMENT,
  `relationshipType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`relationshipTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci