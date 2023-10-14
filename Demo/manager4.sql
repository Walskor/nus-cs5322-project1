select * from system.Customer;

select * from system.Driver;

select * from system.Booking;

select * from system.FEEDBACK;

select SYS_CONTEXT('IDENTIFIER', 'user_type'), SYS_CONTEXT('manager_ctx', 'manager_id') from dual;