CREATE OR REPLACE CONTEXT IDENTITY USING set_context_pkg;

CREATE OR REPLACE PACKAGE set_context_pkg AS 
  PROCEDURE set_my_value;
  PROCEDURE set_my_value_driver;
  PROCEDURE set_my_value_agent;
  PROCEDURE set_my_value_manager;
END set_context_pkg;
/

CREATE OR REPLACE PACKAGE BODY set_context_pkg AS 
  PROCEDURE set_my_value IS 
  BEGIN 
    DBMS_SESSION.SET_CONTEXT('IDENTITY', 'user_type', 'customer');
    DBMS_SESSION.SET_CONTEXT('IDENTITY', 'user_id', 1);
  END set_my_value;
  PROCEDURE set_my_value_driver IS 
  BEGIN 
    DBMS_SESSION.SET_CONTEXT('IDENTITY', 'user_type', 'driver');
    DBMS_SESSION.SET_CONTEXT('IDENTITY', 'user_id', 2);
  END set_my_value_driver;
  PROCEDURE set_my_value_agent IS 
  BEGIN 
    DBMS_SESSION.SET_CONTEXT('IDENTITY', 'user_type', 'agent');
    DBMS_SESSION.SET_CONTEXT('IDENTITY', 'user_id', 3);
  END set_my_value_agent;
  PROCEDURE set_my_value_manager IS 
  BEGIN 
    DBMS_SESSION.SET_CONTEXT('IDENTITY', 'user_type', 'manager');
    DBMS_SESSION.SET_CONTEXT('IDENTITY', 'user_id', 4);
  END set_my_value_manager;
END set_context_pkg;
/

CREATE OR REPLACE TRIGGER set_context_after_login
AFTER LOGON ON DATABASE
BEGIN
   IF USER = 'CUSTOMER1' THEN
      set_context_pkg.set_my_value;
   ELSIF USER = 'DRIVER2' THEN
      set_context_pkg.set_my_value_driver;
   ELSIF USER = 'AGENT3' THEN
      set_context_pkg.set_my_value_agent;
   ELSIF USER = 'MANAGER4' THEN
      set_context_pkg.set_my_value_manager;
   END IF;
END;
/


