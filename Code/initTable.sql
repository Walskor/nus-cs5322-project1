-- -------------------------------------------------
-- User Table
-- -------------------------------------------------


CREATE TABLE Customer (
    customer_id NUMBER,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    gmt_created DATE NOT NULL,
    gmt_modified DATE NOT NULL,
    customer_contact VARCHAR(50) NOT NULL,
    miles NUMBER DEFAULT 0,
    CONSTRAINT pk_Customer PRIMARY KEY (customer_id),
    CONSTRAINT uc_Customer_username UNIQUE (username)
);

CREATE TABLE Driver (
    driver_id NUMBER,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    gmt_created DATE NOT NULL,
    gmt_modified DATE NOT NULL,
    driver_contact VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Driver PRIMARY KEY (driver_id),
    CONSTRAINT uc_Driver_username UNIQUE (username)
);

CREATE TABLE Agent (
    agent_id NUMBER,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    gmt_created DATE NOT NULL,
    gmt_modified DATE NOT NULL,
    CONSTRAINT pk_Agent PRIMARY KEY (agent_id)
);

CREATE TABLE Manager (
    manager_id NUMBER,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    gmt_created DATE NOT NULL,
    gmt_modified DATE NOT NULL,
    CONSTRAINT pk_Manager PRIMARY KEY (manager_id)
);

-- -------------------------------------------------
-- Entity Table
-- -------------------------------------------------

CREATE TABLE Booking (
    booking_id NUMBER,
    customer_id NUMBER NOT NULL,
    driver_id NUMBER NOT NULL,
    customer_contact VARCHAR(50) NOT NULL,
    driver_contact VARCHAR(50) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('placed', 'accepted', 'cancelled', 'finished')),
    placed_on TIMESTAMP NOT NULL,
    accepted_on TIMESTAMP,
    cancelled_on TIMESTAMP,
    finished_on TIMESTAMP,
    customer_paid NUMBER NOT NULL,
    driver_earned NUMBER NOT NULL,
    CONSTRAINT pk_Booking PRIMARY KEY (booking_id),
    CONSTRAINT fk_Booking_Customer FOREIGN KEY(customer_id) REFERENCES Customer (customer_id),
    CONSTRAINT fk_Booking_Driver FOREIGN KEY(driver_id) REFERENCES Driver (driver_id)
);

CREATE TABLE FEEDBACK (
    feedback_id NUMBER,
    booking_id NUMBER NOT NULL,
    rating NUMBER NOT NULL CHECK (rating IN (0,1,2,3,4,5)),
    comments VARCHAR(50),
    time TIMESTAMP NOT NULL,
    CONSTRAINT pk_Feedback PRIMARY KEY (feedback_id),
    CONSTRAINT fk_Feedback_Booking FOREIGN KEY(booking_id) REFERENCES Booking (booking_id)
);