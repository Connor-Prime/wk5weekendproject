ALTER TABLE service_ticket
ADD description VARCHAR(200);

INSERT INTO salesperson(
	first_name,
	last_name
) VALUES(
	'Billy',
	'Mays'
);

INSERT INTO customer(
	first_name,
	last_name
) VALUES(
	'Johny',
	'Cash'
);

CREATE OR REPLACE FUNCTION add_customer(
	_first_name VARCHAR(30),
	_last_name VARCHAR(30)
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(
		first_name,
		last_name
	)VALUES(
		_first_name,
		_last_name
	);
END;
$$;

SELECT "add_customer"('Jimmy','Cricket');
SELECT * FROM customer;


CREATE OR REPLACE PROCEDURE set_if_serviced(
   
)
LANGUAGE plpgsql    
AS $$
BEGIN
	UPDATE car 
	SET is_serviced = TRUE
	FROM service_ticket
	WHERE service_ticket.car_id = car.car_id;
END
$$;

CALL set_if_serviced();

SELECT * FROM car;

CREATE OR REPLACE FUNCTION add_service_ticket(
	_price NUMERIC(7,2),
	_car_id INTEGER,
	_description VARCHAR(200)
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO service_ticket(
		price,
		car_id,
		description
	)VALUES(
		_price,
		_car_id,
		_description
	);
END;
$$;

SELECT "add_service_ticket"(45, 2,'oil_changed');

SELECT * FROM service_ticket;

CREATE OR REPLACE FUNCTION add_car(
	_customer_id INTEGER,
	_is_serviced BOOLEAN,
	_make VARCHAR(30),
	_model VARCHAR(50),
	_year_made NUMERIC(4,0)
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO car(
		customer_id,
		is_serviced,
		make,
		model,
		year_made
	)VALUES(
		_customer_id,
		_is_serviced,
		_make,
		_model,
		_year_made
	);
END;
$$;

DO $$ BEGIN
	PERFORM "add_car"(1,FALSE,'Ford','Freestyle',2008);
END $$

SELECT * FROM car