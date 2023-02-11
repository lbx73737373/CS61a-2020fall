.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price
  FROM products
  GROUP BY category;

CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) AS price
  FROM inventory
  GROUP BY item;

CREATE TABLE shopping_list AS
  SELECT name, store
  FROM products, lowest_prices
  WHERE name = item 
  GROUP BY category having MSRP / rating = MIN(MSRP / rating);

CREATE TABLE total_bandwidth AS
  SELECT SUM(Mbs)
  FROM stores, shopping_list
  WHERE shopping_list.store = stores.store;

