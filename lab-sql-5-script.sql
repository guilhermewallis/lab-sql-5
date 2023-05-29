	-- 1.
alter table staff
drop column picture;

	-- 2.
alter table staff
	modify address_id varchar(255) default null,
	modify username varchar(255) default null;

insert into staff (staff_id, first_name, last_name, address_id, store_id, active, last_update)
select customer_id, first_name, last_name, address_id, store_id, active, last_update
from customer
where first_name = 'TAMMY' and last_name = 'SANDERS';

update staff
set
	first_name = concat(left(first_name,1), lower(substring(first_name,2,length(first_name)))),
	last_name = concat(left(last_name,1), lower(substring(last_name,2,length(last_name)))),
    email = concat(
		left(first_name, 1), lower(substring(first_name, 2, length(first_name))),'.',
		left(last_name,1), lower(substring(last_name,2,length(last_name))), '@sakilastaff.com'
	),
    username = concat(left(first_name,1), lower(substring(first_name,2,length(first_name))))
where staff_id = 75;

	-- 3.
select customer_id from customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';

select * from staff
where first_name = 'Mike' and last_name = 'Hillyer';

select * from film
where title = 'ACADEMY DINOSAUR';

select * from inventory
where film_id = 1 and store_id = 1;

select * from rental
order by rental_id desc;

insert into rental
values (16050, '2023-08-23 21:32:00', 1, 130, null, 1, '2023-08-23 21:32:00');

	-- 4.
create table deleted_users (
	customer_id int unique not null,
    email varchar(255) default null,
    create_date varchar(255) default null,
    constraint primary key (customer_id)
    );
    
insert into deleted_users
select customer_id, email, create_date from customer
where active = 0;

delete from customer
where active = 0;
