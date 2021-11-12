create FUNCTION ORDERDETAILES(@DATE1 varchar(20),@DATE2 varchar(20))
RETURNS TABLE
AS
RETURN

SELECT 
order_id,
customer_id,
order_status,
order_date,
store_id,
staff_id

FROM
        sales.orders
    WHERE
        order_date BETWEEN @DATE1 AND @DATE2
select * from [dbo].[ORDERDETAILES](2016,2018);


create table sales.customer_audit
( 
change_id INT IDENTITY PRIMARY KEY,
    customer_id INT NOT NULL,
    first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
    phone varchar(20)  NULL,
	
	street varchar(20)  NULL,
	city varchar(20)  NULL,
	state_name varchar(20)  NULL,
	zip_code varchar(20)  NULL,
	updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
   
	)

create TRIGGER sales_customers_Deleteds
ON sales.customers
AFTER  DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO sales.customer_audit(
       customer_id,
         first_name,
         last_name,
        phone,
	
        street, 
		city,
		zip_code,
        updated_at, 
        operation
    )
   
    SELECT
       d.customer_id,
         first_name,
         last_name,
        phone,
       
        street, 
		city,
		
		zip_code,
        GETDATE(),
        'DEL'
    FROM
        deleted d ;
END

select * from sales.customers

delete from sales.customers
where [customer_id]=8;



SELECT 
    * 
FROM 
    sales.customer_audit;



	
