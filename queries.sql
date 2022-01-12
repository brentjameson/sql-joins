-- write your queries here
--CREATE TABLE owners (id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT);

-- CREATE TABLE vehicles (id SERIAL PRIMARY KEY, make TEXT, model TEXT, year INTEGER, price REAL, owner_id INTEGER REFERENCES owners (id));

--1
SELECT *
FROM owners
FULL JOIN vehicles
ON owners.id = vehicles.owner_id;

--2
SELECT o.first_name, o.last_name, count(*) as number_of_vehicles
FROM owners o 
JOIN vehicles
ON o.id = vehicles.owner_id
GROUP BY o.first_name, o.last_name
ORDER BY number_of_vehicles;

SELECT o.first_name, o.last_name, ROUND(AVG(v.price)) as average_price, count(v.owner_id)
FROM owners o 
JOIN vehicles v
ON o.id = v.owner_id
GROUP BY (o.first_name, o.last_name)
HAVING count(v.owner_id) > 1 AND ROUND(AVG(v.price)) > 10000
ORDER BY o.first_name DESC;
