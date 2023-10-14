--with no privilege
SELECT * FROM SYSTEM.CUSTOMER;

--with no privilege
SELECT * FROM SYSTEM.DRIVER;

--can only see his own record with id and password masked
SELECT * FROM SYSTEM.AGENT;

--with no privilege
SELECT * FROM SYSTEM.MANAGER;

--can see all records with ids masked
SELECT * FROM SYSTEM.BOOKING;

--select SYS_CONTEXT('IDENTIFIER', 'user_type'), SYS_CONTEXT('agent_ctx', 'agent_id') from dual;

--join booking and feedback with nothing masked and output necessary infos
SELECT 
    feedback_id, 
    f.booking_id as booking_id, 
    b.customer_name,
    b.driver_name,
    rating, 
    comments, 
    time 
FROM 
    SYSTEM.FEEDBACK f left join SYSTEM.Booking b on f.booking_id=b.booking_id
/