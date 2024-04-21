-- SELECT
SELECT * FROM `user`;
SELECT * FROM `persistent_logins`;
SELECT * FROM `product`;
SELECT * FROM `product_io`;
SELECT * FROM `order`;
SELECT * FROM `ship`;

SELECT * FROM `order` WHERE user_id = 'joeun' ;
SELECT * FROM `product` WHERE name = '자바 프로그래밍` ;
 SELECT * FROM joeun.order ORDER BY order_no ASC ;
 
 SELECT *
FROM joeun.order
ORDER BY `order_no` DESC
LIMIT 1;

SELECT * FROM joeun.order WHERE phone = '01012345678' AND order_pw = '1234';

