CREATE TABLE IF NOT EXISTS customer
(
    customer_id SERIAL PRIMARY KEY,
    first_name character varying(30),
    last_name character varying(30)
);


CREATE TABLE IF NOT EXISTS car
(
    car_id SERIAL PRIMARY KEY,
    customer_id integer REFERENCES customer(customer_id),
    is_serviced boolean,
    make character varying(30),
    model character varying(50),
    year_made numeric(4, 0)
);

CREATE TABLE IF NOT EXISTS salesperson
(
    salesperson_id SERIAL PRIMARY KEY,
    first_name character varying(30),
    last_name character varying(30)
);


CREATE TABLE IF NOT EXISTS invoice
(
    invoice_id SERIAL PRIMARY KEY,
    billing_information_id INTEGER,
    car_id INTEGER,
    salesperson_id INTEGER REFERENCES salesperson(salesperson_id)
);


CREATE TABLE IF NOT EXISTS service_ticket
(
    service_ticket_id SERIAL PRIMARY KEY,
    price numeric(5, 2),
    car_id integer REFERENCES car(car_id),
    description character varying(200),
	sales_person_id INTEGER REFERENCES  salesperson(salesperson_id)
);


