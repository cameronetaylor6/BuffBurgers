create database buffburger;
use buffburger;
create table if not exists `users` (
  `user_id` int(1) not null auto_increment,
  `username` varchar(25) not null,
  `password` varchar(25) not null,
  `email` varchar(25) not null,
  `verified` int(1) not null,
  `jerk` int(1) not null,
  primary key (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=7;

insert into `users` (`user_id`, `username`, `password`, `email`, `verified`, `jerk`) values
  (0, 'cata5492', 'doggydog155', 'cata5492@colorado.edu', 0, 0),
  (1, 'stco8901', 'kittykat266', 'stco8901@colorado.edu', 1, 0),
  (2, 'arteezy', 'ti6', 'rtz@colorado.edu', 1, 1);

create table if not exists `orders` (
  `order_num` int(1) not null auto_increment,
  `user_id` int(1) not null,
  `provider_id` int(1) not null,
  `status` int(1) not null, # 0 - not started, 1 - processsing, 2 - finished
  `burger` int(1) not null, # hamburger, veggie, daily
  `heat` int(1) not null, # 155, 160, 165, 170, 175
  `cheese` int(1) not null, # cheddar, provolone, swiss, pepper jack
  `lettuce` int(1) not null,
  `tomato` int(1) not null,
  `onion` int(1) not null,
  `pickle` int(1) not null,
  `bun` int(1) not null, # regular, lettuce, gluten free
  foreign key (user_id) references users(user_id),
  foreign key (provider_id) references providers(provider_id),
  primary key (`order_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=8;

insert into `orders` (`order_num`, `user_id`, `provider_id`, `status`, `burger`, `heat`, `cheese`, `lettuce`, `tomato`, `onion`, `pickle`, `bun`) values
  (1, 0, 1, 2, 0, 4, 0, 1, 1, 1, 1, 0),
  (2, 1, 1, 0, 2, 0, 1, 0, 0, 1, 1, 2),
  (3, 1, 1, 1, 1, 2, 3, 1, 1, 0, 1, 0),
  (4, 2, 1, 2, 0, 1, 2, 1, 0, 1, 0, 1);

create table if not exists `providers` (
  `provider_id` int(1) not null auto_increment,
  `name` varchar(25) not null,
  primary key (`provider_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

insert into `providers` (`provider_id`, `name`) values
  (1, 'Farrand');