DROP TABLE users;
DROP TABLE orders;

PRAGMA foreign_keys = ON;

CREATE TABLE users(
  user_id INTEGER PRIMARY KEY,
  email NCHAR NOT NULL,
  password NCHAR NOT NULL,
  provider INTEGER NOT NULL CHECK(provider >= 0 and provider < 2),
  verified INTEGER NOT NULL CHECK(verified >= 0 and verified < 2),
  jerk INTEGER NOT NULL CHECK(jerk >= 0 and jerk < 4)
);

CREATE TABLE orders(
  order_num INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  status INTEGER NOT NULL CHECK(status >= 0 and status < 3),
  burger INTEGER NOT NULL CHECK(burger >= 0 and burger < 3),
  heat INTEGER NOT NULL CHECK(heat >= 0 and heat < 5),
  cheese INTEGER NOT NULL CHECK(cheese >= 0 and cheese < 4),
  lettuce INTEGER NOT NULL CHECK(lettuce >= 0 and lettuce < 2),
  tomato INTEGER NOT NULL CHECK(tomato >= 0 and tomato < 2),
  onion INTEGER NOT NULL CHECK(onion >= 0 and onion < 2),
  pickle INTEGER NOT NULL CHECK(pickle >= 0 and pickle < 2),
  bun INTEGER NOT NULL CHECK(bun >= 0 and bun < 3),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);
