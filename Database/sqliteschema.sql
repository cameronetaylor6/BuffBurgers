#create database buffburger;
#use buffburger;
#PRAGMA foreign_keys = ON;
CREATE TABLE USERS(
  user_id INT PRIMARY KEY,
  password NCHAR NOT NULL,
  email NCHAR NOT NULL,
  verified INT NOT NULL CHECK(verified >= 0 and verified < 2),
  jerk INT NOT NULL CHECK(verified >= 0 and verified < 4),
);

CREATE TABLE orders (
  order_num INT PRIMARY KEY,
  user_id INT not null,
  status INT not null CHECK(status >= 0 and status < 3), # 0 - not started, 1 - processsing, 2 - finished
  burger INT not null CHECK(verified >= 0 and verified < 3), # hamburger, veggie, daily
  heat INT not null CHECK(verified >= 0 and verified < 5), # 155, 160, 165, 170, 175
  cheese INT not null CHECK(verified >= 0 and verified < 4), # cheddar, provolone, swiss, pepper jack
  lettuce INT not null CHECK(verified >= 0 and verified < 2),
  tomato INT not null CHECK(verified >= 0 and verified < 2),
  onion INT not null CHECK(verified >= 0 and verified < 2),
  pickle INT not null CHECK(verified >= 0 and verified < 2),
  bun INT not null CHECK(verified >= 0 and verified < 3), # regular, lettuce, gluten free
  FOREIGN KEY (user_id) REFERENCES users(user_id),
);
