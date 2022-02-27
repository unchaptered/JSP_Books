DROP DATABASE books;

CREATE DATABASE books;
USE BOOKS;

CREATE TABLE user (
   user_pk INT AUTO_INCREMENT PRIMARY KEY,
   user_email VARCHAR(1000) NOT NULL,
   user_name VARCHAR(500) NOT NULL,
   user_password VARCHAR(500) NOT NULL,
   user_phone VARCHAR(500) NOT NULL,
   user_zipcode VARCHAR(500),
   user_address VARCHAR(2000),
   user_address_detail VARCHAR(2000),
   user_address_etc VARCHAR(2000),
   user_bank VARCHAR(1000),
   user_bank_account VARCHAR(1000)
);
CREATE TABLE admin (
   admin_pk INT AUTO_INCREMENT PRIMARY KEY,
   admin_email VARCHAR(1000) NOT NULL,
   admin_name VARCHAR(500) NOT NULL,
   admin_password VARCHAR(500) NOT NULL,
   admin_authorized VARCHAR(300),
   admin_expired VARCHAR(300)
);
CREATE TABLE post (
   post_pk INT AUTO_INCREMENT PRIMARY KEY,
   post_title VARCHAR(300) not null,
   post_text VARCHAR(1000) not null,
   post_owner int,
   post_created datetime default now(),
   post_viewed int default 0,
   FOREIGN KEY (post_owner) 
		REFERENCES user (user_pk)
);
CREATE TABLE post_files (
   post_file_pk BIGINT PRIMARY KEY,
   post_file_system VARCHAR(1000),
   post_file_origin VARCHAR(300)
);
CREATE TABLE post_notice (
   notice_pk INT AUTO_INCREMENT PRIMARY KEY,
   notice_pin enum('Y','N') default 'N',
   notice_file BIGINT,
   post_pk INT,
   FOREIGN KEY (post_pk)
		REFERENCES post (post_pk)
);
CREATE TABLE post_event (
   event_pk INT AUTO_INCREMENT PRIMARY KEY,
   event_started VARCHAR(300),
   event_ended VARCHAR(300),
   event_file BIGINT,
   event_file_detail BIGINT,
   event_like int default 0,
   post_pk INT,
   FOREIGN KEY (post_pk)
		REFERENCES post (post_pk)
);
CREATE TABLE new_book (
   new_book_pk INT AUTO_INCREMENT PRIMARY KEY,
   new_book_title VARCHAR(300),
   new_book_subtitle VARCHAR(300),
   new_book_info TEXT,
   new_book_info_short TEXT,
   new_book_image VARCHAR(300),
   new_book_org_image VARCHAR(300),
   new_book_price VARCHAR(300),
   new_book_writer VARCHAR(300),
   new_book_translater VARCHAR(300),
   new_book_publisher VARCHAR(300),
   new_book_pages VARCHAR(300),
   new_book_mount VARCHAR(300),
   new_book_genre VARCHAR(300),
   new_book_country VARCHAR(300),
   new_book_created DATE DEFAULT (current_date)
);
CREATE TABLE old_book (
   old_book_pk INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL,
   old_book_discount_10 INT DEFAULT 0 NOT NULL CHECK ( old_book_discount_10 >= 0 ),
   old_book_discount_20 INT DEFAULT 0 NOT NULL CHECK ( old_book_discount_20 >= 0 ),
   old_book_discount_30 INT DEFAULT 0 NOT NULL CHECK ( old_book_discount_30 >= 0 ),
   old_book_discount_40 INT DEFAULT 0 NOT NULL CHECK ( old_book_discount_40 >= 0 ),
   old_book_discount_50 INT DEFAULT 0 NOT NULL CHECK ( old_book_discount_50 >= 0 ),
   new_book_pk INT UNIQUE NOT NULL,
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
CREATE TABLE old_book_selled (
   old_book_selled_pk INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL,
   old_book_selled_10 INT DEFAULT 0 NOT NULL CHECK ( old_book_selled_10 >= 0 ),
   old_book_selled_20 INT DEFAULT 0 NOT NULL CHECK ( old_book_selled_20 >= 0 ),
   old_book_selled_30 INT DEFAULT 0 NOT NULL CHECK ( old_book_selled_30 >= 0 ),
   old_book_selled_40 INT DEFAULT 0 NOT NULL CHECK ( old_book_selled_40 >= 0 ),
   old_book_selled_50 INT DEFAULT 0 NOT NULL CHECK ( old_book_selled_50 >= 0 ),
   new_book_pk INT UNIQUE NOT NULL,
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
CREATE TABLE album (
   album_pk INT AUTO_INCREMENT PRIMARY KEY,
   album_title VARCHAR(300),
   album_title_song VARCHAR(300),
   album_singer VARCHAR(300),
   album_release VARCHAR(300)
);