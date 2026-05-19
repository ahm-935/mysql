drop database if exists h_tasks;
create database h_tasks;
use h_tasks;

drop table if exixts brands;
create table if not exists brands(
     id int unsigned primary key auto_increment,
     name varchar(100)
     );
insert into brands(name) values('Apple'),('Samsung'),('Sony');

drop table if exixts categories;    
create table if not exists categories(
     id int unsigned primary key auto_increment,
     name varchar(100)
     );
insert into categories(name) values('Smartphones'),('Laptops'),('Accessories');

drop table if exixts products;
create table if not exists products(
     id int unsigned primary key auto_increment,
     product_name varchar(100),
     brand_id int,
     category_id int,
     price float,
     is_active tinyint default 0
     );

insert into products(product_name, brand_id, category_id, price, is_active) values
('iPhone 13', 1, 1, 999.99, 1),
('Galaxy S21', 2, 1, 799.99, 1),
('Xperia 5', 3, 1, 899.99, 0),
('MacBook Pro', 1, 2, 1999.99, 1),
('Galaxy Book', 2, 2, 1499.99, 0),
('VAIO Z', 3, 2, 1799.99, 1),
('AirPods Pro', 1, 3, 249.99, 1),
('Galaxy Buds Pro', 2, 3, 199.99, 0),
('WF-1000XM4', 3, 3, 279.99, 1);

select * from products;

drop view if exists vw_active_products;
create view vw_active_products as
select p.id, p.product_name, b.name as brand, c.name as category, p.price
from products p, brands b, categories c
where p.brand_id = b.id and p.category_id = c.id and p.is_active = 1;

select * from vw_active_products where price > 1000;
select * from vw_active_products where category = 'Smartphones' and brand = 'Apple';
select * from vw_active_products where category = 'Smartphones' and price >700 and price < 1000;
select * from vw_active_products where category = 'Accessories' and price >= 200 and price <= 1000;

