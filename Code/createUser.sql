CREATE USER johnDoe IDENTIFIED BY password;
CREATE USER driverOne IDENTIFIED BY password;
CREATE USER agentAlpha IDENTIFIED BY password;
CREATE USER managerX IDENTIFIED BY password;

--GRANT CREATE SESSION TO johnDoe, driverOne, agentAlpha, managerX;

GRANT CREATE SESSION TO johnDoe WITH ADMIN OPTION;
GRANT CREATE SESSION TO driverOne WITH ADMIN OPTION;
GRANT CREATE SESSION TO agentAlpha WITH ADMIN OPTION;
GRANT CREATE SESSION TO managerX WITH ADMIN OPTION;

GRANT SELECT, INSERT, UPDATE ON system.Customer TO johnDoe;
GRANT SELECT, INSERT, UPDATE ON system.Customer TO agentAlpha;
GRANT SELECT, INSERT, UPDATE ON system.Customer TO managerX;

GRANT SELECT, INSERT, UPDATE ON Driver TO driverOne;
GRANT SELECT, INSERT, UPDATE ON Driver TO agentAlpha;
GRANT SELECT, INSERT, UPDATE ON Driver TO managerX;

GRANT SELECT, INSERT, UPDATE ON Agent TO agentAlpha;
GRANT SELECT, INSERT, UPDATE ON Agent TO managerX;

GRANT SELECT, INSERT, UPDATE ON Manager TO managerX;

GRANT SELECT, INSERT, UPDATE ON Booking TO johnDoe;
GRANT SELECT, INSERT, UPDATE ON Booking TO driverOne;
GRANT SELECT, INSERT, UPDATE ON Booking TO agentAlpha;
GRANT SELECT, INSERT, UPDATE ON Booking TO managerX;

GRANT SELECT, INSERT, UPDATE ON FEEDBACK TO johnDoe;
GRANT SELECT, INSERT, UPDATE ON FEEDBACK TO driverOne;
GRANT SELECT, INSERT, UPDATE ON FEEDBACK TO agentAlpha;
GRANT SELECT, INSERT, UPDATE ON FEEDBACK TO managerX;



-- --------------------------------------------------
--              Create Users for Test
-- --------------------------------------------------

CREATE USER testCustomer IDENTIFIED BY password;
CREATE USER testDriver IDENTIFIED BY password;
CREATE USER testAgent IDENTIFIED BY password;
CREATE USER testManager IDENTIFIED BY password;

GRANT CREATE SESSION TO testCustomer WITH ADMIN OPTION;
GRANT CREATE SESSION TO testDriver WITH ADMIN OPTION;
GRANT CREATE SESSION TO testAgent WITH ADMIN OPTION;
GRANT CREATE SESSION TO testManager WITH ADMIN OPTION;

GRANT SELECT, INSERT, UPDATE ON system.Customer TO testCustomer;
GRANT SELECT, INSERT, UPDATE ON system.Customer TO testAgent;
GRANT SELECT, INSERT, UPDATE ON system.Customer TO testManager;

GRANT SELECT, INSERT, UPDATE ON Driver TO testDriver;
GRANT SELECT, INSERT, UPDATE ON Driver TO testAgent;
GRANT SELECT, INSERT, UPDATE ON Driver TO testManager;

GRANT SELECT, INSERT, UPDATE ON Agent TO testAgent;
GRANT SELECT, INSERT, UPDATE ON Agent TO testManager;

GRANT SELECT, INSERT, UPDATE ON Manager TO testManager;

GRANT SELECT, INSERT, UPDATE ON Booking TO testCustomer;
GRANT SELECT, INSERT, UPDATE ON Booking TO testDriver;
GRANT SELECT, INSERT, UPDATE ON Booking TO testAgent;
GRANT SELECT, INSERT, UPDATE ON Booking TO testManager;

GRANT SELECT, INSERT, UPDATE ON FEEDBACK TO testCustomer;
GRANT SELECT, INSERT, UPDATE ON FEEDBACK TO testDriver;
GRANT SELECT, INSERT, UPDATE ON FEEDBACK TO testAgent;
GRANT SELECT, INSERT, UPDATE ON FEEDBACK TO testManager;

