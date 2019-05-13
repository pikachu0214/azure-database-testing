CREATE TABLE Category (
	id						INTEGER	 IDENTITY(1,1)			NOT NULL		PRIMARY KEY,
	name					VARCHAR(255)		NOT NULL 		UNIQUE,

) 

/*Event_Type Table */
CREATE TABLE Event_Type (
	id						INTEGER 	IDENTITY(1,11)				NOT NULL		PRIMARY KEY,
	name					VARCHAR(255)		NOT NULL 	Unique,					

	
) 


/* Event Workshop */

CREATE TABLE Workshop (
	id						INTEGER	IDENTITY(1,21)			NOT NULL		PRIMARY KEY,
	name					VARCHAR(255)		NOT NULL 		UNIQUE,

) 

CREATE TABLE Event (
	id 				INTEGER IDENTITY(1,101) 				NOT NULL 		PRIMARY KEY,
	name 				VARCHAR(255) 		NOT NULL 		UNIQUE,
	start_date	 	DATE,
	end_date 		DATE,
	total_duration	int, 
	certification	tinyint,	
	categoryId		int REFERENCES Category (id), 			
	typeId			int REFERENCES Event_Type (id)								
	
) 

CREATE TABLE Workshop_Event (
	eventId						INTEGER				NOT NULL REFERENCES Event (id),
	workshopId					Integer				NOT NULL REFERENCES workshop (id)
	
) 

CREATE TABLE Country (
	id		 		int IDENTITY(1,2001) NOT NULL PRIMARY KEY,
  	iso 			varchar(2) NOT NULL,
  	name 			varchar(80) NOT NULL,
  	iso3	 		char(3) DEFAULT NULL,
  	numcode	 	int DEFAULT NULL,
  	phonecode 	int NOT NULL,
  	
) 

CREATE TABLE Participants (
	id 											INTEGER IDENTITY(1,3001)				NOT NULL 		PRIMARY KEY,
	firstName									VARCHAR(255)		Not null,
	lastName										VARCHAR(255)		Not null,
	email											NVARCHAR(320)		Not null			unique,		
	gender										varchar(255),
	age											varchar(255),	
	countryId									int REFERENCES country (id),		
	background									varchar(255),
	employment_situation						varchar(255),
	career_satisfaction						int,
	attendance_rate							int,
	SIB_label									varchar(255),
	recommendation_done						varchar(5),
	newsletter_subscription					varchar(5),
	linkedIn_link								varchar(255),
							
		
) 

CREATE TABLE Registration (
	id 											INTEGER IDENTITY(1,1001)				NOT NULL 		PRIMARY KEY,
	attending_status							VARCHAR(255)		Not null,
	employment_status							VARCHAR(255)		Not null,
	career_satisfaction						int					Not null,
	expectation									varchar(255),			
	workshopId									int REFERENCES workshop (id),
	eventId										int REFERENCES Event (id),			
	participantId								int REFERENCES Participants (id),		


) 
