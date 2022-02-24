-- base-sql.sql 을 전부 실행하고 나서 실행

USE BOOKS;

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
   '432', '0', '시/에세이', '국외', '2022-02-09'
),
(
   '익명의 책 CCC', '보조실록',
   '익명의 책 CCC 의 책 설명입니다.', '익명의 책 CCC의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 CCC', '익명의 번역가 CCC', '불광출판사',
   '432', '0', '경제/경영', '국내', '2022-02-09'
),
(
   '익명의 책 DDD', '보조실록',
   '익명의 책 DDD 의 책 설명입니다.', '익명의 책 DDD의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 DDD', '익명의 번역가 DDD', '불광출판사',
   '432', '0', '자기계발', '국외', '2022-02-09'
),
(
   '익명의 책 EEE', '보조실록',
   '익명의 책 EEE 의 책 설명입니다.', '익명의 책 EEE의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 EEE', '익명의 번역가 EEE', '불광출판사',
   '432', '0', '사회/과학', '국내', '2022-02-09'
),
(
   '익명의 책 FFF', '보조실록',
   '익명의 책 FFF 의 책 설명입니다.', '익명의 책 FFF의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 FFF', '익명의 번역가 FFF', '불광출판사',
   '432', '0', '역사/문화', '국외', '2022-02-09'
),
(
   '익명의 책 GGG', '보조실록',
   '익명의 책 GGG 의 책 설명입니다.', '익명의 책 GGG의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 GGG', '익명의 번역가 GGG', '불광출판사',
   '432', '0', '인문', '국내', '2022-02-09'
),
(
   '익명의 책 HHH', '보조실록',
   '익명의 책 HHH 의 책 설명입니다.', '익명의 책 HHH의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 HHH', '익명의 번역가 HHH', '불광출판사',
   '432', '0', '자연과학', '국외', '2022-02-09'
),
(
   '익명의 책 III', '보조실록',
   '익명의 책 III 의 책 설명입니다.', '익명의 책 III의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 III', '익명의 번역가 III', '불광출판사',
   '432', '0', '어린이', '국외', '2022-02-09'
),
(
   '익명의 책 JJJ', '보조실록',
   '익명의 책 JJJ 의 책 설명입니다.', '익명의 책 JJJ의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 JJJ', '익명의 번역가 JJJ', '불광출판사',
   '432', '0', '문학', '국외', '2022-02-09'
),
(
   '익명의 책 KKK', '보조실록',
   '익명의 책 KKK 의 책 설명입니다.', '익명의 책 KKK의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 KKK', '익명의 번역가 KKK', '불광출판사',
   '432', '0', '경제인문', '국외', '2022-02-09'
),
(
   '익명의 책 LLL', '보조실록',
   '익명의 책 LLL 의 책 설명입니다.', '익명의 책 LLL의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 LLL', '익명의 번역가 LLL', '불광출판사',
   '432', '0', '컴퓨터', '국외', '2022-02-09'
),
(
   '익명의 책 MMM', '보조실록',
   '익명의 책 MMM 의 책 설명입니다.', '익명의 책 MMM의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 MMM', '익명의 번역가 MMM', '불광출판사',
   '432', '0', '기타', '국외', '2022-02-09'
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
   '432', '0', '시/에세이', '국외'
),
(
   '익명의 책 C', '보조실록',
   '익명의 책 C 의 책 설명입니다.', '익명의 책 C의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 C', '익명의 번역가 C', '불광출판사',
   '432', '0', '경제/경영', '국내'
),
(
   '익명의 책 D', '보조실록',
   '익명의 책 D 의 책 설명입니다.', '익명의 책 D의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 D', '익명의 번역가 D', '불광출판사',
   '432', '0', '자기계발', '국외'
),
(
   '익명의 책 E', '보조실록',
   '익명의 책 E 의 책 설명입니다.', '익명의 책 E의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 E', '익명의 번역가 E', '불광출판사',
   '432', '0', '사회/과학', '국내'
),
(
   '익명의 책 F', '보조실록',
   '익명의 책 F 의 책 설명입니다.', '익명의 책 F의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 F', '익명의 번역가 F', '불광출판사',
   '432', '0', '역사/문화', '국외'
),
(
   '익명의 책 G', '보조실록',
   '익명의 책 G 의 책 설명입니다.', '익명의 책 G의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 G', '익명의 번역가 G', '불광출판사',
   '432', '0', '인문', '국내'
),
(
   '익명의 책 H', '보조실록',
   '익명의 책 H 의 책 설명입니다.', '익명의 책 H의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 H', '익명의 번역가 H', '불광출판사',
   '432', '0', '자연과학', '국외'
),
(
   '익명의 책 I', '보조실록',
   '익명의 책 I 의 책 설명입니다.', '익명의 책 I의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 I', '익명의 번역가 I', '불광출판사',
   '432', '0', '어린이', '국외'
),
(
   '익명의 책 J', '보조실록',
   '익명의 책 J 의 책 설명입니다.', '익명의 책 J의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 J', '익명의 번역가 J', '불광출판사',
   '432', '0', '문학', '국외'
),
(
   '익명의 책 K', '보조실록',
   '익명의 책 K 의 책 설명입니다.', '익명의 책 K의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 K', '익명의 번역가 K', '불광출판사',
   '432', '0', '경제인문', '국외'
),
(
   '익명의 책 L', '보조실록',
   '익명의 책 L 의 책 설명입니다.', '익명의 책 L의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 L', '익명의 번역가 L', '불광출판사',
   '432', '0', '컴퓨터', '국외'
),
(
   '익명의 책 M', '보조실록',
   '익명의 책 M 의 책 설명입니다.', '익명의 책 M의 짧은 소개입니다.',
   'none', '43200',
   '익명의 작가 M', '익명의 번역가 M', '불광출판사',
   '432', '0', '기타', '국외'
);


-- 샘플 DATA 1,2 유형 합산 old_book

INSERT INTO old_book
(new_book_pk, old_book_discount_10, old_book_discount_20, old_book_discount_30, old_book_discount_40, old_book_discount_50) VALUES
(1, 100, 20, 10, 3, 4), (2, 100, 20, 10, 3, 4), (3, 100, 20, 10, 3, 4), (4, 100, 20, 10, 3, 4),
(5, 100, 20, 10, 3, 4), (6, 100, 20, 10, 3, 4), (7, 100, 20, 10, 3, 4), (8, 100, 20, 10, 3, 4),
(9, 100, 20, 10, 3, 4), (10, 100, 20, 10, 3, 4), (11, 100, 20, 10, 3, 4), (12, 100, 20, 10, 3, 4),
(13, 100, 20, 10, 3, 4), (14, 100, 20, 10, 3, 4), (15, 100, 20, 10, 3, 4), (16, 100, 20, 10, 3, 4),
(17, 100, 20, 10, 3, 4), (18, 100, 20, 10, 3, 4), (19, 100, 20, 10, 3, 4), (20, 100, 20, 10, 3, 4),
(21, 100, 20, 10, 3, 4), (22, 100, 20, 10, 3, 4), (23, 100, 20, 10, 3, 4), (24, 100, 20, 10, 3, 4),
(25, 100, 20, 10, 3, 4), (26, 100, 20, 10, 3, 4);

INSERT INTO old_book_selled
(new_book_pk, old_book_discount_10, old_book_discount_20, old_book_discount_30, old_book_discount_40, old_book_discount_50) VALUES
(1, 0, 0, 0, 0, 0), (2, 0, 0, 0, 0, 0), (3, 0, 0, 0, 0, 0), (4, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 0), (6, 0, 0, 0, 0, 0), (7, 0, 0, 0, 0, 0), (8, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0), (10, 0, 0, 0, 0, 0), (11, 0, 0, 0, 0, 0), (12, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0), (14, 0, 0, 0, 0, 0), (15, 0, 0, 0, 0, 0), (16, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0), (18, 0, 0, 0, 0, 0), (19, 0, 0, 0, 0, 0), (20, 0, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 0), (22, 0, 0, 0, 0, 0), (23, 0, 0, 0, 0, 0), (24, 0, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 0), (26, 0, 0, 0, 0, 0);

# SELECT 문

SELECT * FROM new_book;

SELECT * FROM new_book WHERE new_book_created=date(current_date);

SELECT * FROM old_book;
SELECT * FROM old_book_selled;

-- 중고도서 조회
SELECT 
new_book.new_book_pk,
new_book_title, new_book_genre, new_book_country,
old_book_pk,
old_book_discount_10, old_book_discount_20, old_book_discount_30, old_book_discount_40, old_book_discount_50
FROM old_book
LEFT OUTER JOIN new_book
ON old_book.new_book_pk = new_book.new_book_pk
LIMIT 6;

-- 장르 기준, 중고 도서 수량 조회
SELECT
new_book.new_book_pk,
new_book_title, new_book_genre, new_book_country,
old_book_pk,
old_book_discount_10, old_book_discount_20, old_book_discount_30, old_book_discount_40, old_book_discount_50
FROM old_book
LEFT OUTER JOIN new_book
ON old_book.new_book_pk = new_book.new_book_pk
WHERE new_book_genre = '시/에세이'
LIMIT 6;

-- 국가 기준, 중고 도서 수량 조회
SELECT
new_book.new_book_pk,
new_book_title, new_book_genre, new_book_country,
old_book_pk,
old_book_discount_10, old_book_discount_20, old_book_discount_30, old_book_discount_40, old_book_discount_50
FROM old_book
LEFT OUTER JOIN new_book
ON old_book.new_book_pk = new_book.new_book_pk
WHERE new_book_country = '국내'
LIMIT 6;

# UPDATE 문

-- 중고 도서 재고 +1, -1

SELECT * FROM old_book;

UPDATE old_book
SET old_book_discount_10 = old_book_discount_10 + 1
WHERE old_book_pk = 1;

UPDATE old_book
SET old_book_discount_10 = old_book_discount_10 - 1
WHERE old_book_pk = 1 AND old_book_discount_10 > 0;

# 제약조건 테스트용 구문

-- FK ON DELETE CASCADE 제약조건 테스트
SELECT * FROM new_book;
SELECT * FROM old_book;

-- 아래 방식으로 코드를 실행하면,
-- Cannot delete or update a parent row 에러가 발생,
-- 따라서 제약 조건 추가가 필요하다.
DELETE FROM new_book WHERE new_book_pk = 1;
-- 위의 코드 실행 후, new_book.new_book_pk 와 old_book.new_book_pk 를 체크해보면 삭제 됨을 알 수 있다.

UPDATE new_book SET new_book_pk = 1 WHERE new_book_pk = 2;
-- 위의 코드 실행 후, new_book.new_book_pk 와 old_book.new_book_pk 를 체크해보면 자동으로 일치되게 변경 됨을 알 수 있다.

# 없어진 테이블의 쿼리문

-- INSERT INTO book_genre (book_genre_name) VALUES
-- ('소설'),('시/에세이'),('경제/경영'),('자기계발'),('사회/과학'),
-- ('역사/문화'),('인문'),('자연과학'),('어린이'),('문학'),
-- ('경제인문'),('컴퓨터'),('기타');
-- INSERT INTO book_country (book_country_name) VALUES
-- ('국내'),('국외');