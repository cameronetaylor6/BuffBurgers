insert into `users` (`email`, `password`, `provider`, `verified`, `jerk`) values
  ('cata5492@colorado.edu', 'doggydog155', 0, 0, 0),
  ('stco8901@colorado.edu', 'kittykat266', 0, 1, 0),
  ('rtz@colorado.edu', 'ti6', 1, 1, 1);
  
insert into `orders` (`user_id`, `status`, `burger`, `heat`, `cheese`, `lettuce`, `tomato`, `onion`, `pickle`, `bun`) values
  (0, 2, 0, 4, 0, 1, 1, 1, 1, 0),
  (1, 0, 2, 0, 1, 0, 0, 1, 1, 2),
  (1, 1, 1, 2, 3, 1, 1, 0, 1, 0),
  (2, 2, 0, 1, 2, 1, 0, 1, 0, 1);
