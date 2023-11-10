CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100),
  `slug` varchar(50),
  `email` varchar[unique],
  `bio` text,
  `created_at` timestamp DEFAULT "now()"
);

CREATE TABLE `tweet` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `content` varchar(150),
  `user_id` int,
  `created_at` timestamp DEFAULT "now()"
);

CREATE TABLE `follower` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `follwer_id` int,
  `followed_id` int,
  `created_at` timestamp DEFAULT "now()"
);

ALTER TABLE `tweet` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `follower` ADD FOREIGN KEY (`follwer_id`) REFERENCES `user` (`id`);

ALTER TABLE `follower` ADD FOREIGN KEY (`followed_id`) REFERENCES `user` (`id`);
