/*1. Create an index that will enable a user to pull orders for  
‘1990-10-03’ out of the Orders table quickly. */
create index  order_date_indexon orders(odate); 
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name         | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| orders |          1 | order_date_index |            1 | odate       | A         |           2 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

/* 2. If the Orders table has already been created, how can you force the  
onum field to be unique (assume all current values are unique)?*/

alter table orders add unique (onum);

/* 3. Create an index that would permit salesperson to retrieve his orders. */
create index index_salesperson on orders(snum);
+--------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name          | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| orders |          0 | onum              |            1 | onum        | A         |          10 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| orders |          1 | order_date_index  |            1 | odate       | A         |           2 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| orders |          1 | index_salesperson |            1 | snum        | A         |           5 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

/* 4. Let us assume that each salesperson is to have only one customer of a     
given rating, and this is currently the case. Create an index that          
enforces it.*/
create unique index index_salesperson on customers(snum,cname,rating);


/*5. Create an index on the orders table for the customer number and order date columns. */
create index index_order on orders(cnum,odate);
