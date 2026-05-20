delimiter //
CREATE PROCEDURE if not exists show_products()
BEGIN
    select * from vw_active_products;
    select * from products;
END //
delimiter ;

call show_products();

drop procedure show_products;

delimiter //
CREATE PROCEDURE create_product(p_name varchar(100), 
p_brand_id int, p_category_id int, p_price float, p_is_active tinyint)
BEGIN
    insert into products(product_name, brand_id, category_id, price, is_active) 
    values(p_name, p_brand_id, p_category_id, p_price, p_is_active);
    
END //
delimiter ;

call create_product("iPhone 17" , 1 , 1 , 1299, 1);
call create_product("Samsung Galaxy Watch 8" , 2 , 3 , 1299, 1);
