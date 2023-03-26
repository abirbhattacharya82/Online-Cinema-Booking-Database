create table customers(
  id INT AUTO_INCREMENT,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  PRIMARY KEY(id)
  );

create table films(
  id INT AUTO_INCREMENT,
  name VARCHAR NOT NULL,
  length_min INT NOT NULL,
  PRIMARY KEY (id)
  );

create table rooms(
  id INT AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  no_seats INT NOT NULL,
  PRIMARY KEY (id)
  );

create table screenings(
  id INT AUTO_INCREMENT,
  film_id INT NOT NULL,
  room_id INT NOT NULL,
  start_time DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (film_id) REFERENCES films(id),
  FOREIGN KEY (room_id) REFERENCES rooms(id)
  );

create table seats (
  id INT AUTO_INCREMENT,
  row CHAR(1) NOT NULL,
  number INT NOT NULL,
  room_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (room_id) REFERENCES rooms(id)
  );

create table bookings(
  id INT AUTO_INCREMENT,
  screening_id INT NOT NULL,
  customer_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (screening_id) REFERENCES screenings(id)
  );

create table reserved_seats(
  id INT AUTO_INCREMENT,
  booking_id INT NOT NULL,
  seat_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (booking_id) REFERENCES bookings (id),
  FOREIGN KEY (seat_id) REFERENCES seats (id)
  );