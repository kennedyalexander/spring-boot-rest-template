CREATE TABLE USERS (
    u_username VARCHAR(25) NOT NULL,
    u_password VARCHAR(50) NOT NULL,
    u_active INT NOT NULL,
    PRIMARY KEY (u_username));


CREATE TABLE USER_ROLES (
    r_id int(11) auto_increment primary key,
    r_username varchar(45) NOT NULL,
    r_role varchar(45) NOT NULL,
    UNIQUE KEY uis_username_role (r_role,r_username),
    FOREIGN KEY (r_username) REFERENCES USERS(u_username));
  
CREATE TABLE USER_INFORMATION (
    ui_username VARCHAR(25) NOT NULL,
    ui_firstname VARCHAR(25) NOT NULL,
    ui_lastname VARCHAR(25) NOT NULL,
    ui_email VARCHAR(100) NOT NULL,
    ui_dob DATE NOT NULL,
    ui_location VARCHAR(25) NOT NULL,
    PRIMARY KEY (ui_username),
    FOREIGN KEY (ui_username) REFERENCES USERS(u_username));
    
CREATE TABLE MEETING_EVENTS (
    e_uuid UUID primary key,
    e_name VARCHAR(25) NOT NULL,
    e_date DATE NOT NULL,
    e_guestSpace int(11) NOT NULL,
    e_location VARCHAR(25) NOT NULL);
    
    
CREATE TABLE USER_EVENT (
    ue_username VARCHAR(25) NOT NULL,
    ue_eventid UUID NOT NULL,
    ue_userPosition VARCHAR(25) NOT NULL,
    PRIMARY KEY (ue_username, ue_eventid),
    FOREIGN KEY (ue_username) REFERENCES USERS(u_username),
    FOREIGN KEY (ue_eventid) REFERENCES MEETING_EVENTS(e_uuid));
  