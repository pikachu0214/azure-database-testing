/* CREATE TABLES */
-- ------------------------- 80-character-line marker  ------------------------
/* Category */
CREATE TABLE Category (
	id						INTEGER				NOT NULL		AUTO_INCREMENT,
	name					VARCHAR(255)		NOT NULL 		UNIQUE,
	CONSTRAINT PK_Category PRIMARY KEY (id)

) ENGINE=InnoDB;
ALTER TABLE Category AUTO_INCREMENT=1;

/*Event_Type Table */
CREATE TABLE Event_Type (
	id						INTEGER				NOT NULL		AUTO_INCREMENT,
	name					VARCHAR(255)		NOT NULL 	Unique,					
	CONSTRAINT PK_Type PRIMARY KEY (id)
	
) ENGINE=InnoDB;
ALTER TABLE Event_Type AUTO_INCREMENT=11; 

/* Event Workshop */

CREATE TABLE Workshop (
	id						INTEGER				NOT NULL		AUTO_INCREMENT,
	name					VARCHAR(255)		NOT NULL 		UNIQUE,
	CONSTRAINT PK_Workshop PRIMARY KEY (id)

) ENGINE=InnoDB;
ALTER TABLE Workshop AUTO_INCREMENT=21;

CREATE TABLE Event (
	id 				INTEGER 				NOT NULL 		AUTO_INCREMENT,
	name 				VARCHAR(255) 		NOT NULL 		UNIQUE,
	start_date	 	DATE,
	end_date 		DATE,
	total_duration	int, 
	certification	tinyint,	
	categoryId		int, 			
	typeId			int, 									

	CONSTRAINT PK_Event PRIMARY KEY (id),
	
	CONSTRAINT FK_Event_Category
		FOREIGN KEY (categoryId) REFERENCES Category (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT FK_Event_Type
		FOREIGN KEY (typeId) REFERENCES Event_Type (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT
	
) ENGINE=InnoDB;
ALTER TABLE Event AUTO_INCREMENT=101;

CREATE TABLE Workshop_Event (
	eventId						INTEGER				NOT NULL,
	workshopId					Integer				NOT NULL,
	CONSTRAINT PK_Workshop PRIMARY KEY (eventid, workshopId),
	
	CONSTRAINT FK_Workshop_Event
		FOREIGN KEY (eventId) REFERENCES Event (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
		FOREIGN KEY (workshopId) REFERENCES workshop (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT

) ENGINE=InnoDB;

CREATE TABLE Country (
	id		 		int NOT NULL AUTO_INCREMENT,
  	iso 			char(2) NOT NULL,
  	name 			varchar(80) NOT NULL,
  	nicename 	varchar(80) NOT NULL,
  	iso3	 		char(3) DEFAULT NULL,
  	numcode	 	smallint(6) DEFAULT NULL,
  	phonecode 	int(5) NOT NULL,
  	CONSTRAINT PK_Country PRIMARY KEY (id)

) ENGINE=InnoDB;
ALTER TABLE Country AUTO_INCREMENT=2001;

CREATE TABLE Participants (
	id 											INTEGER 				NOT NULL 		AUTO_INCREMENT,
	firstName									VARCHAR(255)		Not null,
	lastName										VARCHAR(255)		Not null,
	email											NVARCHAR(320)		Not null			unique,		
	gender										varchar(255),
	age											varchar(255),	
	countryId									int,		
	background									varchar(255),
	employment_situation						varchar(255),
	career_satisfaction						int,
	attendance_rate							int,
	SIB_label									varchar(255),
	recommendation_done						varchar(5),
	newsletter_subscription					varchar(5),
	linkedIn_link								varchar(255),
							
			
	CONSTRAINT PK_Participants PRIMARY KEY (id),
	
	CONSTRAINT FK_Participants_Country
		FOREIGN KEY (countryId) REFERENCES country (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT

		
) ENGINE=InnoDB;
ALTER TABLE Participants AUTO_INCREMENT=3001;

CREATE TABLE Registration (
	id 											INTEGER 				NOT NULL 		AUTO_INCREMENT,
	attending_status							VARCHAR(255)		Not null,
	employment_status							VARCHAR(255)		Not null,
	career_satisfaction						int					Not null,
	expectation									varchar(255),			
	workshopId									int,
	eventId										int,			
	participantId								int,		
			
	CONSTRAINT PK_Order PRIMARY KEY (id),
	
	CONSTRAINT FK_Registration_Workshop
		FOREIGN KEY (workshopId) REFERENCES workshop (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT FK_Registration_Event
		FOREIGN KEY (eventId) REFERENCES Event (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT,
	CONSTRAINT FK_Registration_Participants
		FOREIGN KEY (participantId) REFERENCES Participants (id)
		ON DELETE RESTRICT
		ON UPDATE RESTRICT

) ENGINE=InnoDB;
ALTER TABLE Registration AUTO_INCREMENT=1001;
