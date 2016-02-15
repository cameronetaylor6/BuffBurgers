create database buffburger;
use buffburger;
create table if not exists `users` (
  `id` int(1) not null auto_increment,
  `username` varchar(25) not null,
  `password` varchar(25) not null,
  `email` varchar(25) not null,
  `jerk` int(1) not null,
  primary key (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=7;

insert into `users` (`id`, `username`, `password`, `email`, `jerk`) values
  (1, 'cata5492', 'doggydog155', 'cata5492@colorado.edu', 0),
  (2, 'stco8901', 'kittykat266', 'stco8901@colorado.edu', 1);

create table if not exists `orders` (
  `order_num` int(1) not null auto_increment,
  `provider_id` tinyint(1) not null,
  `status` tinyint(1) not null,
  `bun` tinyint(1) not null,
  `lettuce` tinyint(1) not null,
  `tomato` tinyint(1) not null,
  `onion` tinyint(1) not null,
  primary key (`order_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=8;

insert into `orders` (`order_num`, `provider_id`, `status`, `bun`, `lettuce`, `tomato`, `onion`) values
  (1, 0, 1, 0, 1, 1, 1),
  (2, 0, 1, 0, 1, 1, 0),
  (3, 0, 1, 0, 1, 0, 1),
  (4, 0, 1, 1, 1, 0, 0),
  (5, 0, 1, 1, 0, 1, 1),
  (6, 0, 1, 1, 0, 1, 0),
  (7, 0, 1, 2, 0, 0, 1),
  (8, 0, 1, 2, 0, 0, 0);

create table if not exists `providers` (
  `provider_id` int(1) not null auto_increment,
  `name` varchar(25) not null,
  primary key (`provider_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

insert into `providers` (`provider_id`, `name`) values
  (1, 'Farrand');