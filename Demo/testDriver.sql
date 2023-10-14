--with no privilege
SELECT * FROM SYSTEM.CUSTOMER;

--can only update his own record
UPDATE SYSTEM.DRIVER SET driver_contact = '123456' where username = 'driverOne';
UPDATE SYSTEM.DRIVER SET driver_contact = '123456' where username = 'NOTdriverOne';

--can only see his own record with id and password masked
SELECT * FROM SYSTEM.DRIVER;

--with no privilege
SELECT * FROM SYSTEM.AGENT;

--with no privilege
SELECT * FROM SYSTEM.MANAGER;

--can only see records related to him with ids and customer_paid masked
SELECT * FROM SYSTEM.BOOKING;

--can only see records related to him with ids and customer_name masked
SELECT * FROM SYSTEM.FEEDBACK;

--select SYS_CONTEXT('IDENTIFIER', 'user_type'), SYS_CONTEXT('driver_ctx', 'driver_id') from dual;

--join booking and feedback with ids and customer_name masked and output necessary infos
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