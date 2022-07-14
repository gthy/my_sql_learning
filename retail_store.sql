create database store;
use store;
create table retail_store(customer_id varchar(200), date_of_purcharse date, order_id int primary key, item_id int, price int);
insert into retail_store values ( 'a1', '1996-08-09', 1, 001, 10);
insert into retail_store values ( 'a2', '1996-08-09', 2, 002, 100);
insert into retail_store values ( 'a3', '1996-08-09', 3, 003, 10);
insert into retail_store values ( 'a1', '1996-08-09', 4, 001, 102);
insert into retail_store values ( 'a1', '1996-08-09', 5, 010, 10);
insert into retail_store values ( 'a1', '1996-08-10', 6, 001, 100);
insert into retail_store values ( 'a3', '1996-08-10', 7, 002, 10);
insert into retail_store values ( 'a1', '1996-08-10', 8, 009, 11);
insert into retail_store values ( 'a4', '1996-08-10', 9, 001, 16);
insert into retail_store values ( 'a1', '1996-08-11', 10, 003, 10);
insert into retail_store values ( 'a1', '1996-08-11', 11, 003, 1000);
insert into retail_store values ( 'a4', '1996-08-11', 12, 001, 10);
insert into retail_store values ( 'a1', '1996-08-12', 13, 003, 16);
insert into retail_store values ( 'a5', '1996-08-12', 14, 001, 176);
insert into retail_store values ( 'a1', '1996-08-13', 15, 004, 50);
insert into retail_store values ( 'a3', '1996-08-13', 16, 001, 10);
insert into retail_store values ( 'a1', '1996-08-15', 17, 001, 10);

insert into retail_store values ( 'a1', '1996-08-15', 18, 001, 10);
insert into retail_store values ( 'a6', '1996-08-15', 19, 001, 102);
insert into retail_store values ( 'a1', '1996-08-15', 20, 001, 102);
insert into retail_store values ( 'a3', '1996-08-15', 21, 001, 103);
insert into retail_store values ( 'a6', '1996-08-15', 22, 008, 104);
insert into retail_store values ( 'a7', '1996-08-15', 23, 001, 106);
insert into retail_store values ( 'a1', '1996-08-15', 24, 001, 150);
insert into retail_store values ( 'a8', '1996-08-15', 25, 003, 160);
insert into retail_store values ( 'a1', '1996-08-15', 26, 001, 10);
insert into retail_store values ( 'a9', '1996-08-15', 27, 003, 310);
insert into retail_store values ( 'a10', '1996-08-15', 28, 001, 510);
insert into retail_store values ( 'a11', '1996-08-15', 29, 004, 510);
insert into retail_store values ( 'a12', '1996-08-15', 30, 001, 160);
insert into retail_store values ( 'a1', '1996-08-15', 31, 001, 10);
insert into retail_store values ( 'a11', '1996-08-15', 32, 001, 10);
insert into retail_store values ( 'a10', '1996-08-16', 33, 001, 10);
insert into retail_store values ( 'a6', '1996-08-16', 34, 0055, 300);
insert into retail_store values ( 'a1', '1996-08-17', 35, 001, 90);
insert into retail_store values ( 'a5', '1996-08-17', 36, 001, 45);
insert into retail_store values ( 'a7', '1996-08-18', 37, 003, 87);
insert into retail_store values ( 'a13', '1996-08-15', 38, 001, 1691);


select * from retail_store;

-- gives the highest price puschase
select customer_id, price from retail_store where price IN (select max(price) from retail_store);


-- gives the top customer detail who made the purchase till now
SELECT 
    customer_id, SUM(price) AS total
FROM
    retail_store
GROUP BY customer_id
ORDER BY total DESC
limit 1;

select a.customer_id, d.max_sum_price from  (SELECT 
    customer_id, SUM(price)  AS total
FROM
    retail_store
GROUP BY customer_id
ORDER BY total DESC) as a 
join (select max(total) as max_sum_price from  (SELECT 
    customer_id, SUM(price)  AS total
FROM
    retail_store
GROUP BY customer_id
ORDER BY total DESC) as a) as d on a.total= d.max_sum_price;






-- SELECT 
--     customer_id, SUM(price) AS total
-- FROM
--     retail_store
-- GROUP BY customer_id
-- ORDER BY total DESC;  

-- select max(total) as w from  (SELECT 
-- --     customer_id, SUM(price)  AS total
-- -- FROM
-- --     retail_store
-- -- GROUP BY customer_id
-- -- ORDER BY total DESC) as a;

      
      

-- gives the top 10 customers who made the purchase with highest amount

SELECT 
    customer_id, SUM(price) AS total
FROM
    retail_store
GROUP BY customer_id
ORDER BY total DESC
LIMIT 10;


-- use store;
-- select distinct sum(price) as total from retail_store group by customer_id order by total desc limit 5;

-- select customer_id,sum(price) as total from retail_store group by customer_id;


select customer_id, total from  (SELECT 
        customer_id, SUM(price) AS total
    FROM
        retail_store
    GROUP BY customer_id) as a where total in (SELECT DISTINCT
        SUM(price) AS total
    FROM
        retail_store
    GROUP BY customer_id
    ORDER BY total DESC
    LIMIT 10);
    
    
    -- top 10% of customers who made the purchase
    
    
    
select min(10/100 * (select (sum(price)) from retail_store )) from retail_store;
select s.emp_no,e.first_name, e.last_name,s.salary from salaries s
join employees e on e.emp_no = s.emp_no
order by salary desc
limit 96733;  
    
    
    
    
select 10/100 * (select (sum(price)) from retail_store ) from retail_store;
    
    
    
  select max(10/100 * (  SELECT
        SUM(price) AS total
    FROM
        retail_store
    GROUP BY customer_id
    ORDER BY total DESC)) from retail_store;
    
    
    
    
    
    
    select * from retail_store;
    
    
    
    
    
    
    
    