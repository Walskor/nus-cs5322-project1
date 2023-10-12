CREATE TABLE Customer (
    planner_id number,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    gmt_created DATE NOT NULL,
    gmt_modified DATE NOT NULL,
    customer_contact VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Planner PRIMARY KEY (planner_id),
    CONSTRAINT uc_Planner_username UNIQUE (username)
);