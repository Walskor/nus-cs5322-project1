select * from system.Customer;

select * from system.Driver;

select * from system.Booking;

select * from system.FEEDBACK;

select sys_context('IDENTITY', 'user_type'),  sys_context('IDENTITY', 'user_id') from dual;