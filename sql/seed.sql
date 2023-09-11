DROP
    DATABASE IF EXISTS `blog-db`;
CREATE
    DATABASE `blog-db`;
USE
    `blog-db`;

DROP
    USER IF EXISTS `admin`;
CREATE
    USER `admin` IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON *.* TO `admin` WITH GRANT OPTION;

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`
(
    id         int(11)      NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title      varchar(255) NOT NULL,
    content    text         NOT NULL,
    created_at timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB
  CHARSET = utf8
  COLLATE = utf8_general_ci;

INSERT INTO `posts` (id, title, content, created_at)
VALUES (1, 'Article One', 'Lorem ipsum dolor one', CURRENT_TIMESTAMP),
       (2, 'Article Two', 'Lorem ipsum dolor two', CURRENT_TIMESTAMP),
       (3, 'Article Three', 'Lorem ipsum dolor three', CURRENT_TIMESTAMP);

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`
(
    id         int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    post_id    int(11)      NOT NULL,
    name       varchar(250) NOT NULL,
    email      varchar(250) NOT NULL,
    content    text         NOT NULL,
    created_at timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES `posts` (id)
) ENGINE = InnoDB
  CHARSET = utf8
  COLLATE = utf8_general_ci;


