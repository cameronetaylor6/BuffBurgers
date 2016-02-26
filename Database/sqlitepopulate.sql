#modify into lite

insert into `users` (`user_id`, `username`, `password`, `email`, `verified`, `jerk`) values
  (0, 'cata5492', 'doggydog155', 'cata5492@colorado.edu', 0, 0),
  (1, 'stco8901', 'kittykat266', 'stco8901@colorado.edu', 1, 0),
  (2, 'arteezy', 'ti6', 'rtz@colorado.edu', 1, 1);
  
insert into `orders` (`order_num`, `user_id`, `provider_id`, `status`, `burger`, `heat`, `cheese`, `lettuce`, `tomato`, `onion`, `pickle`, `bun`) values
  (1, 0, 2, 0, 4, 0, 1, 1, 1, 1, 0),
  (2, 1, 0, 2, 0, 1, 0, 0, 1, 1, 2),
  (3, 1, 1, 1, 2, 3, 1, 1, 0, 1, 0),
  (4, 2, 2, 0, 1, 2, 1, 0, 1, 0, 1);
