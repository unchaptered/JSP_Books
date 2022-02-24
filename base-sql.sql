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
   post_file_origin VARCHAR(300),
   post_pk INT
);
CREATE TABLE post_notice (
   notice_pk INT AUTO_INCREMENT PRIMARY KEY,
   notice_pin enum('Y','N') default 'N' not null,
   post_pk INT,
   FOREIGN KEY (post_pk)
		REFERENCES post (post_pk)
);
CREATE TABLE post_event (
   event_pk INT AUTO_INCREMENT PRIMARY KEY,
   event_started VARCHAR(300),
   event_ended VARCHAR(300),
   event_like int default 0,
   post_pk INT,
   FOREIGN KEY (post_pk)
		REFERENCES post (post_pk)
);
-- CREATE TABLE book_genre (
--    book_genre_pk INT AUTO_INCREMENT PRIMARY KEY,
--    book_genre_name VARCHAR(300)
-- );
-- CREATE TABLE book_country (
--    book_country_pk INT AUTO_INCREMENT PRIMARY KEY,
--    book_country_name VARCHAR(300)
-- );
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
   -- FOREIGN KEY (new_book_genre)
   --    REFERENCES book_genre (book_genre_pk),
   -- FOREIGN KEY (new_book_country)
   --    REFERENCES book_country (book_country_pk)
);
CREATE TABLE old_book (
   new_book_pk INT,
   old_book_pk INT AUTO_INCREMENT PRIMARY KEY,
   old_book_discount INT,
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk)
);
CREATE TABLE album (
   album_pk INT AUTO_INCREMENT PRIMARY KEY,
   album_title VARCHAR(300),
   album_title_song VARCHAR(300),
   album_singer VARCHAR(300),
   album_release VARCHAR(300)
);

# INSERT 문

INSERT INTO user
(user_email,user_name,user_password,user_phone) VALUES
('dmswo0845@gmail.com','고결','1111','01071468059'),
('seungy98@gmail.com','권승연','1111','01066849394'),
('khyejin9796@gmail.com','권혜진','1111','01099177371'),
('igoodithief@naver.com','김명현','1111','01082174761'),
('tomset92@gmail.com','배효찬','1111','01023347936'),
('hollymolly@gmail.com','이민석','1111','01097818756'),
('tonke1234@naver.com','정병찬','1111','01030833187');
INSERT INTO admin
(admin_email,admin_name,admin_password) VALUES
('sample@gmail.com','샘플','1111');

-- 샘플 DATA 1유형 (오늘 날짜 자동으로 설정)
INSERT INTO new_book
(new_book_title, new_book_subtitle,
new_book_info, new_book_info_short,
new_book_image, new_book_price,
new_book_writer, new_book_translater, new_book_publisher,
new_book_pages, new_book_mount, new_book_genre, new_book_country, new_book_created) VALUES
(
   '익명의 책 AAA', '보조실록',
   '익명의 책 AAA 의 책 설명입니다.', '익명의 책 AAA의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 AAA', '익명의 번역가 AAA', '불광출판사',
   '432', '0', '소설', '국내', '2022-02-09'
),
(
   '익명의 책 BBB', '보조실록',
   '익명의 책 BBB 의 책 설명입니다.', '익명의 책 BBB의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 BBB', '익명의 번역가 BBB', '불광출판사',
   '432', '0', '소설', '국외', '2022-02-09'
),
(
   '익명의 책 CCC', '보조실록',
   '익명의 책 CCC 의 책 설명입니다.', '익명의 책 CCC의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 CCC', '익명의 번역가 CCC', '불광출판사',
   '432', '0', '소설', '국내', '2022-02-09'
),
(
   '익명의 책 DDD', '보조실록',
   '익명의 책 DDD 의 책 설명입니다.', '익명의 책 DDD의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 DDD', '익명의 번역가 DDD', '불광출판사',
   '432', '0', '소설', '국외', '2022-02-09'
),
(
   '익명의 책 EEE', '보조실록',
   '익명의 책 EEE 의 책 설명입니다.', '익명의 책 EEE의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 EEE', '익명의 번역가 EEE', '불광출판사',
   '432', '0', '소설', '국내', '2022-02-09'
),
(
   '익명의 책 FFF', '보조실록',
   '익명의 책 FFF 의 책 설명입니다.', '익명의 책 FFF의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 FFF', '익명의 번역가 FFF', '불광출판사',
   '432', '0', '소설', '국외', '2022-02-09'
),
(
   '익명의 책 GGG', '보조실록',
   '익명의 책 GGG 의 책 설명입니다.', '익명의 책 GGG의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 GGG', '익명의 번역가 GGG', '불광출판사',
   '432', '0', '소설', '국내', '2022-02-09'
),
(
   '익명의 책 HHH', '보조실록',
   '익명의 책 HHH 의 책 설명입니다.', '익명의 책 HHH의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 HHH', '익명의 번역가 HHH', '불광출판사',
   '432', '0', '소설', '국외', '2022-02-09'
);

-- 샘플 DATA 2유형 (오늘 날짜 수동으로 설정)
INSERT INTO new_book
(new_book_title, new_book_subtitle,
new_book_info, new_book_info_short,
new_book_image, new_book_price,
new_book_writer, new_book_translater, new_book_publisher,
new_book_pages, new_book_mount, new_book_genre, new_book_country) VALUES
(
   '익명의 책 A', '보조실록',
   '익명의 책 A 의 책 설명입니다.', '익명의 책 A의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 A', '익명의 번역가 A', '불광출판사',
   '432', '0', '소설', '국내'
),
(
   '익명의 책 B', '보조실록',
   '익명의 책 B 의 책 설명입니다.', '익명의 책 B의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 B', '익명의 번역가 B', '불광출판사',
   '432', '0', '소설', '국외'
),
(
   '익명의 책 C', '보조실록',
   '익명의 책 C 의 책 설명입니다.', '익명의 책 C의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 C', '익명의 번역가 C', '불광출판사',
   '432', '0', '소설', '국내'
),
(
   '익명의 책 D', '보조실록',
   '익명의 책 D 의 책 설명입니다.', '익명의 책 D의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 D', '익명의 번역가 D', '불광출판사',
   '432', '0', '소설', '국외'
),
(
   '익명의 책 E', '보조실록',
   '익명의 책 E 의 책 설명입니다.', '익명의 책 E의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 E', '익명의 번역가 E', '불광출판사',
   '432', '0', '소설', '국내'
),
(
   '익명의 책 F', '보조실록',
   '익명의 책 F 의 책 설명입니다.', '익명의 책 F의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 F', '익명의 번역가 F', '불광출판사',
   '432', '0', '소설', '국외'
),
(
   '익명의 책 G', '보조실록',
   '익명의 책 G 의 책 설명입니다.', '익명의 책 G의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 G', '익명의 번역가 G', '불광출판사',
   '432', '0', '소설', '국내'
),
(
   '익명의 책 H', '보조실록',
   '익명의 책 H 의 책 설명입니다.', '익명의 책 H의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 H', '익명의 번역가 H', '불광출판사',
   '432', '0', '소설', '국외'
);

# SELECT 문

SELECT * FROM new_book;

SELECT * FROM new_book WHERE new_book_created=date(current_date)

-- INSERT INTO book_genre (book_genre_name) VALUES
-- ('소설'),('시/에세이'),('경제/경영'),('자기계발'),('사회/과학'),
-- ('역사/문화'),('인문'),('자연과학'),('어린이'),('문학'),
-- ('경제인문'),('컴퓨터'),('기타');
-- INSERT INTO book_country (book_country_name) VALUES
-- ('국내'),('국외');