DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS shops;

CREATE TABLE shops(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  till INT4
);

CREATE TABLE cars(
  id SERIAL8 PRIMARY KEY,
  shop_id INT8 REFERENCES shops(id) ON DELETE CASCADE,
  make VARCHAR(255),
  model VARCHAR(255),
  style VARCHAR(255),
  price INT4,
  image VARCHAR(255)
);

CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  budget INT4,
  email VARCHAR(255),
  previous_brand VARCHAR(255)
);
