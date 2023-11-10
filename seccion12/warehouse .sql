CREATE TABLE `product` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `serial` varchar(255),
  `name` varchar(200),
  `merchant_id` int,
  `price` float(8,2),
  `status` ENUM ('in_stock', 'out_of_stock', 'running_low'),
  `stock` int,
  `created_at` timestamp DEFAULT "now()"
);

CREATE TABLE `merchant` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `country_id` int,
  `created_at` timestamp DEFAULT "now()"
);

CREATE TABLE `country` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `status` ENUM ('placed', 'confirm', 'processed', 'complete'),
  `user_id` int,
  `total` float(12,2),
  `created_at` timestamp DEFAULT "now()"
);

CREATE TABLE `order_item` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `product_id` int,
  `quantity` int
);

ALTER TABLE `product` ADD FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`);

ALTER TABLE `merchant` ADD FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

ALTER TABLE `order_item` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `order_item` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
