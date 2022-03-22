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
create table admin(
	admin_pk INT AUTO_INCREMENT PRIMARY KEY,
	adminid varchar(300) unique not null,
   adminpw varchar(300) not null,
   adminname varchar(300) not null,
   adminkey varchar(300) not null
);
create table chart(
   title varchar(300) not null,
   price int not null
);

CREATE TABLE post (
   post_pk INT AUTO_INCREMENT PRIMARY KEY,
   post_title VARCHAR(300) not null,
   post_text VARCHAR(1000) not null,
   post_owner int,
   post_created datetime default now(),
   post_viewed int default 0,
   FOREIGN KEY (post_owner) 
		REFERENCES admin (admin_pk)
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
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
CREATE table post_event_like(
	event_like_pk INT primary key auto_increment,
    event_like_post int,
    event_like_user INT
);
CREATE TABLE post_notice (
   notice_pk INT AUTO_INCREMENT PRIMARY KEY,
   notice_pin enum('Y','N') default 'N',
   notice_file BIGINT,
   post_pk INT,
   FOREIGN KEY (post_pk)
	REFERENCES post (post_pk)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
CREATE TABLE post_files (
   post_file_pk BIGINT AUTO_INCREMENT PRIMARY KEY,
   post_file_system VARCHAR(1000),
   post_file_origin VARCHAR(1000)
);

CREATE TABLE new_book (
   new_book_pk INT AUTO_INCREMENT PRIMARY KEY,
   new_book_title VARCHAR(300) UNIQUE NOT NULL,
   new_book_subtitle VARCHAR(300),
   new_book_info TEXT,
   new_book_info_short TEXT,
   new_book_org_image VARCHAR(300) NOT NULL,
   new_book_image VARCHAR(300) NOT NULL,
   new_book_price INT NOT NULL,
   new_book_writer VARCHAR(300) NOT NULL,
   new_book_translater VARCHAR(300),
   new_book_publisher VARCHAR(300) NOT NULL,
   new_book_created DATE DEFAULT (current_date) NOT NULL,
   new_book_pages INT NOT NULL,
   new_book_mount INT DEFAULT 0 NOT NULL,
   new_book_genre VARCHAR(300) NOT NULL,
   new_book_country VARCHAR(300) NOT NULL
);

CREATE TABLE old_book_discount (
	discount_value INT PRIMARY KEY UNIQUE NOT NULL CHECK ( discount_value >= 0 AND discount_value <=50 )
);
INSERT INTO old_book_discount VALUES (10), (20), (30), (40), (50);

CREATE TABLE old_book (
   old_book_pk INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL,
   new_book_pk INT NOT NULL,
   user_pk INT DEFAULT 1 NOT NULL,
   admin_pk INT,
   old_book_discount INT DEFAULT 10 NOT NULL,
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (old_book_discount)
      REFERENCES old_book_discount (discount_value)
);
CREATE TABLE old_book_selled (
   old_book_selled_pk INT AUTO_INCREMENT PRIMARY KEY UNIQUE NOT NULL,
   old_book_selled_count INT DEFAULT 0 NOT NULL CHECK ( old_book_selled_count >= 0),
   new_book_pk INT UNIQUE NOT NULL,
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
CREATE TABLE old_book_log (
	old_book_selled_pk INT UNIQUE NOT NULL,
    old_book_seller INT NOT NULL,
    old_book_buyer INT NOT NULL,
    new_book_pk INT UNIQUE NOT NULL
);

CREATE TABLE bill (
	bill_pk BIGINT AUTO_INCREMENT PRIMARY KEY,		-- 주문번호
   bill_payment VARCHAR(300) NOT NULL,				   -- 결제수단
	bill_total_price VARCHAR(300) NOT NULL,			-- 결제총금액
   bill_date datetime default now() NOT NULL,		-- 주문일시
   bill_zipcode VARCHAR(300) NOT NULL,				   -- 배송우편번호
   bill_addr VARCHAR(300) NOT NULL,				      -- 배송주소
   bill_cost VARCHAR(300) DEFAULT '0',				   -- 배송비
   bill_status VARCHAR(300) DEFAULT '배송준비중', 	-- 배송상태
   user_pk INT NOT NULL,
	FOREIGN KEY (user_pk)
      REFERENCES user (user_pk)
);

CREATE TABLE products (
   product_pk BIGINT AUTO_INCREMENT PRIMARY KEY,   -- 주문상품번호
   product_quantity INT NOT NULL,					   -- 상품수량
   product_total_price VARCHAR(300) NOT NULL,	   -- n개상품 총금액, 구매시점에 따라 상품가격변동
--  product_discount INT NOT NULL,					   -- 할인율
   new_book_pk INT NOT NULL,						      -- 책번호
   bill_pk BIGINT NOT NULL,						      -- 주문번호
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk),
   FOREIGN KEY (bill_pk)
      REFERENCES bill (bill_pk)
);

CREATE TABLE cart (
   cart_pk BIGINT AUTO_INCREMENT PRIMARY KEY,		-- 장바구니 카트번호
   cart_quantity INT DEFAULT 1,					      -- 구매수량
   user_pk INT NOT NULL,
   new_book_pk INT NOT NULL,
   FOREIGN KEY (user_pk)
      REFERENCES user (user_pk),
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk)
);

