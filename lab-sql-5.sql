-- 1.Drop column picture from staff.
-- ALTER TABLE staff
-- DROP COLUMN picture;

-- 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
use sakila;
select* from customer
where first_name = 'tammy' and last_name = 'sanders';
select* from staff;


INSERT INTO STAFF (STAFF_ID, FIRST_NAME, LAST_NAME, ADDRESS_ID, PICTURE, EMAIL, STORE_ID, ACTIVE, USERNAME, PASSWORD, LAST_UPDATE)
VALUES (
    3,'TAMMY','SANDERS',1,NULL,'TAMMY.SANDERS@sakilacustomer.org',1,1,'tsanders',
    'password123',CURRENT_TIMESTAMP                       
);
select* from inventory;
-- 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.
select customer_id from customer where first_name = 'charlotte' and last_name = 'hunter';
SELECT FILM_ID FROM FILM WHERE TITLE = 'Academy Dinosaur';
SELECT STAFF_ID FROM STAFF WHERE FIRST_NAME = 'MIKE' AND LAST_NAME = 'HILLYER';

SELECT inventory.inventory_id
FROM sakila.inventory
JOIN sakila.store ON inventory.store_id = store.store_id
JOIN sakila.film ON inventory.film_id = film.film_id
WHERE film.title = 'Academy Dinosaur' AND store.store_id = 1;


INSERT INTO sakila.rental (rental_date, inventory_id, customer_id, staff_id)
VALUES (NOW(), 4, 130, 1);
select * from rental
order by rental_date desc; 

-- 4.Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

Check if there are any non-active users
Create a table backup table as suggested
Insert the non active users in the table backup table
Delete the non active users from the table customer

CREATE TABLE deleted_users (
    customer_id INT,
    email VARCHAR(255),
    deletion_date DATE
);

SELECT *
FROM customer
WHERE active = 0;

INSERT INTO deleted_users (customer_id, email, deletion_date)
SELECT customer_id, email, CURRENT_DATE
FROM customers
WHERE active = 0;

-- DELETE FROM customers
-- WHERE active = 0;