# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.



# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET AUTOCOMMIT=1;
#SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
#SET FOREIGN_KEY_CHECKS=1;



# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

DROP TABLE IF EXISTS skills;
CREATE TABLE skills (
    id int NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255) DEFAULT NULL,
    time_commitment int DEFAULT NULL,
    primary key (id)
);



# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills ( id, name, description, tag ) values
(1, 'Programming', 'Proficient in multiple programming languages, including Python, Java, and C++', 'Skill 1'),
(2, 'Data Analysis', 'Skilled in data analysis and visualization using tools like Excel, R, and Tableau', 'Skill 2'),
(3, 'Web Development', 'Experienced in creating dynamic and responsive web applications with HTML, CSS, and JavaScript', 'Skill 3'),
(4, 'Database Management', 'Adept at designing and maintaining relational databases with SQL', 'Skill 4'),
(5, 'Project Management', 'Strong project management skills with a focus on planning, execution, and team coordination', 'Skill 5'),
(6, 'Digital Marketing', 'Proficient in digital marketing strategies, including SEO, SEM, and social media advertising', 'Skill 6'),
(7, 'Graphic Design', 'Skilled in graphic design tools like Adobe Photoshop and Illustrator', 'Skill 7'),
(8, 'Machine Learning', 'Knowledgeable in machine learning techniques and frameworks such as TensorFlow and scikit-learn', 'Skill 8');


# Section 4
# Create people( people_id, people_first_name, people_last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

DROP TABLE IF EXISTS people;
CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name VARCHAR(255) DEFAULT NULL,
    people_last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) DEFAULT NULL,
    linkedin_url VARCHAR(255) DEFAULT NULL,
    headshot_url VARCHAR(255) DEFAULT NULL,
    discord_handle VARCHAR(255) DEFAULT NULL,
    brief_bio VARCHAR(255) DEFAULT NULL,
    date_joined date DEFAULT (CURRENT_DATE),
    PRIMARY KEY (people_id)
);



# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, email) VALUES
(1, 'Liam', 'Person 1', 'liam.Person1@gmail.com'),
(2, 'Olivia', 'Person 2', 'olivia.Person2@gmail.com'),
(3, 'Noah', 'Person 3', 'noah.Person3@gmail.com'),
(4, 'Emma', 'Person 4', 'emma.Person4@gmail.com'),
(5, 'Jackson','Person 5', 'jackson.Person5@gmail.com'),
(6, 'Ava', 'Person 6', 'ava.Person6@gmail.com'),
(7, 'Aiden', 'Person 7', 'aiden.Person7@gmail.com'),
(8, 'Sophia', 'Person 8', 'sophia.Person8@gmail.com'),
(9, 'Lucas', 'Person 9', 'lucas.Person9@gmail.com'),
(10, 'Mia', 'Person 10', 'mia.Person10@gmail.com');



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

DROP TABLE IF EXISTS peopleskills;
CREATE TABLE peopleskills (
id int auto_increment NOT NULL,
skills_id int NOT NULL,
people_id int NOT NULL,
date_acquired date DEFAULT (CURRENT_DATE),
PRIMARY KEY (id),
FOREIGN KEY (skills_id) REFERENCES skills (id),
FOREIGN KEY (people_id) REFERENCES people (people_id)
);



# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills ( people_id, skills_id ) VALUES
(1,1), (1,3), (1,6),
(2,3), (2,4), (2,5),
(3,1), (3,5),
(5,3), (5,6),
(6,2), (6,3), (6,4),
(7,3), (7,5), (7,6),
(8,1), (8,3), (8,5), (8,6),
(9,2), (9,5), (9,6),
(10,1), (10,4), (10,5);




# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
id int,
name VARCHAR(255),
sort_priority int,
PRIMARY KEY (id)
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles ( id, name, sort_priority ) VALUES
(1,'Designer',10),
(2,'Developer',20),
(3,'Recruit',30),
(4,'Team Lead',40),
(5,'Boss',50),
(6,'Mentor',60);



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

DROP TABLE IF EXISTS peopleroles;
CREATE TABLE peopleroles (
id int auto_increment NOT NULL,
people_id int NOT NULL,
role_id int NOT NULL,
date_assigned date DEFAULT (CURRENT_DATE),
PRIMARY KEY (id),
FOREIGN KEY (people_id) REFERENCES people (people_id),
FOREIGN KEY (role_id) REFERENCES roles (id)
);




# Section 11
# Populate peopleroles
# Person 1 is Developer
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles ( people_id, role_id ) VALUES
(1,2),
(2,5), (2,6),
(3,2), (3,4),
(4,3),
(5,3),
(6,2), (6,1),
(7,1),
(8,1), (8,4),
(9,2),
(10,2), (10,1);