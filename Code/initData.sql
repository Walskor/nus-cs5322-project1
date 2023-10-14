

-- Dummy data for Customer
INSERT INTO Customer (customer_id, username, password, gmt_created, gmt_modified, customer_contact, miles) 
VALUES (1, 'johnDoe', 'password123', SYSDATE, SYSDATE, '123-456-7890', 500);

INSERT INTO Customer (customer_id, username, password, gmt_created, gmt_modified, customer_contact, miles) 
VALUES (2, 'aliceSmith', 'password456', SYSDATE, SYSDATE, '123-456-7891', 600);

INSERT INTO Customer (customer_id, username, password, gmt_created, gmt_modified, customer_contact, miles) 
VALUES (3, 'maryJohnson', 'password789', SYSDATE, SYSDATE, '123-456-7892', 700);

INSERT INTO Customer (customer_id, username, password, gmt_created, gmt_modified, customer_contact, miles) 
VALUES (4, 'jamesBrown', 'password012', SYSDATE, SYSDATE, '123-456-7893', 800);


-- Dummy data for Driver
INSERT INTO Driver (driver_id, username, password, gmt_created, gmt_modified, driver_contact) 
VALUES (1, 'driverOne', 'pass123', SYSDATE, SYSDATE, '987-654-3210');

INSERT INTO Driver (driver_id, username, password, gmt_created, gmt_modified, driver_contact) 
VALUES (2, 'driverTwo', 'pass456', SYSDATE, SYSDATE, '987-654-3211');

INSERT INTO Driver (driver_id, username, password, gmt_created, gmt_modified, driver_contact) 
VALUES (3, 'driverThree', 'pass789', SYSDATE, SYSDATE, '987-654-3212');

INSERT INTO Driver (driver_id, username, password, gmt_created, gmt_modified, driver_contact) 
VALUES (4, 'driverFour', 'pass012', SYSDATE, SYSDATE, '987-654-3213');

-- Dummy data for Agent
INSERT INTO Agent (agent_id, username, password, gmt_created, gmt_modified) 
VALUES (1, 'agentAlpha', 'agent123', SYSDATE, SYSDATE);
INSERT INTO Agent (agent_id, username, password, gmt_created, gmt_modified) 
VALUES (2, 'agentBravo', 'agent456', SYSDATE, SYSDATE);
INSERT INTO Agent (agent_id, username, password, gmt_created, gmt_modified) 
VALUES (3, 'agentCharlie', 'agent789', SYSDATE, SYSDATE);
INSERT INTO Agent (agent_id, username, password, gmt_created, gmt_modified) 
VALUES (4, 'agentDelta', 'agent012', SYSDATE, SYSDATE);


-- Dummy data for Manager
INSERT INTO Manager (manager_id, username, password, gmt_created, gmt_modified) 
VALUES (1, 'managerX', 'manager123', SYSDATE, SYSDATE);
INSERT INTO Manager (manager_id, username, password, gmt_created, gmt_modified) 
VALUES (2, 'managerY', 'manager456', SYSDATE, SYSDATE);
INSERT INTO Manager (manager_id, username, password, gmt_created, gmt_modified) 
VALUES (3, 'managerZ', 'manager789', SYSDATE, SYSDATE);
INSERT INTO Manager (manager_id, username, password, gmt_created, gmt_modified) 
VALUES (4, 'managerA', 'manager012', SYSDATE, SYSDATE);

-- Dummy data for Booking
INSERT INTO Booking (booking_id, customer_id, driver_id, customer_name, driver_name, customer_contact, driver_contact, status, placed_on, customer_paid, driver_earned) 
VALUES (1, 1, 1, 'customer_name_1', 'driver_name_1', '123-456-7890', '987-654-3210', 'placed', SYSTIMESTAMP, 100, 85);
INSERT INTO Booking (booking_id, customer_id, driver_id, customer_name, driver_name, customer_contact, driver_contact, status, placed_on, customer_paid, driver_earned) 
VALUES (2, 2, 2, 'customer_name_2', 'driver_name_2', '123-456-7891', '987-654-3211', 'accepted', SYSTIMESTAMP, 150, 130);
INSERT INTO Booking (booking_id, customer_id, driver_id, customer_name, driver_name, customer_contact, driver_contact, status, placed_on, customer_paid, driver_earned) 
VALUES (3, 3, 3, 'customer_name_3', 'driver_name_3', '123-456-7892', '987-654-3212', 'finished', SYSTIMESTAMP, 200, 175);
INSERT INTO Booking (booking_id, customer_id, driver_id, customer_name, driver_name, customer_contact, driver_contact, status, placed_on, customer_paid, driver_earned) 
VALUES (4, 4, 4, 'customer_name_4', 'driver_name_4', '123-456-7893', '987-654-3213', 'cancelled', SYSTIMESTAMP, 50, 40);

-- Dummy data for FEEDBACK
INSERT INTO FEEDBACK (feedback_id, booking_id, customer_id, driver_id, rating, comments, time) 
VALUES (1, 1, 1, 1, 5, 'Excellent service!', SYSTIMESTAMP);
INSERT INTO FEEDBACK (feedback_id, booking_id, customer_id, driver_id, rating, comments, time) 
VALUES (2, 2, 2, 2, 4, 'Good ride.', SYSTIMESTAMP);
INSERT INTO FEEDBACK (feedback_id, booking_id, customer_id, driver_id, rating, comments, time) 
VALUES (3, 3, 3, 3, 3, 'It was okay.', SYSTIMESTAMP);
INSERT INTO FEEDBACK (feedback_id, booking_id, customer_id, driver_id, rating, comments, time) 
VALUES (4, 4, 4, 4, 2, 'Could be better.', SYSTIMESTAMP);


