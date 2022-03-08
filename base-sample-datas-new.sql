INSERT INTO user 
(
    user_email,
    user_name,
    user_password,
    user_phone,
    user_zipcode,
    user_address,
    user_address_detail,
    user_address_etc,
    user_bank,
    user_bank_account
) VALUES
(
    'A 이메일',
    'A 이름',
    'A1111',
    'A전화번호',
    'A우편번호',
    'A주소',
    'A상세주소',
    'A기타주소',
    'A은행',
    'A계좌번호'
),
(
    'B 이메일',
    'B 이름',
    'B1111',
    'B전화번호',
    'B우편번호',
    'B주소',
    'B상세주소',
    'B기타주소',
    'B은행',
    'B계좌번호'
),
(
    'C 이메일',
    'C 이름',
    'C1111',
    'C전화번호',
    'C우편번호',
    'C주소',
    'C상세주소',
    'C기타주소',
    'C은행',
    'C계좌번호'
),
(
    'D 이메일',
    'D 이름',
    'D1111',
    'D전화번호',
    'D우편번호',
    'D주소',
    'D상세주소',
    'D기타주소',
    'D은행',
    'D계좌번호'
),
(
    'E 이메일',
    'E 이름',
    'E1111',
    'E전화번호',
    'E우편번호',
    'E주소',
    'E상세주소',
    'E기타주소',
    'E은행',
    'E계좌번호'
),
(
    'F 이메일',
    'F 이름',
    'F1111',
    'F전화번호',
    'F우편번호',
    'F주소',
    'F상세주소',
    'F기타주소',
    'F은행',
    'F계좌번호'
),
(
    'G 이메일',
    'G 이름',
    'G1111',
    'G전화번호',
    'G우편번호',
    'G주소',
    'G상세주소',
    'G기타주소',
    'G은행',
    'G계좌번호'
);

INSERT INTO admin
(adminid, adminpw, adminpw_re, adminname, adminkey) VALUES
('tester@gmail.com','1234','1111','고결','01071468059'),
('seungy98','1111','1111','권승연','01066849394'),
('khyejin9796','1111','1111','권혜진','01099177371'),
('igoodithief','1111','1111','김명현','01082174761'),
('hollymolly','1111','1111','이민석','01097818756'),
('tonke1234','1111','1111','정병찬','01030833187');

-- INSERT INTO admin
-- (
--     admin_email,
--     admin_name,
--     admin_password,
--     admin_authorized,
--     admin_expired
-- ) VALUES
-- (
--     'A이메일',
--     'A이름',
--     'A비밀번호',
--     'A인증',
--     'A만료'
-- ),
-- (
--     'B이메일',
--     'B이름',
--     'B비밀번호',
--     'B인증',
--     'B만료'
-- ),
-- (
--     'C이메일',
--     'C이름',
--     'C비밀번호',
--     'C인증',
--     'C만료'
-- ),
-- (
--     'D이메일',
--     'D이름',
--     'D비밀번호',
--     'D인증',
--     'D만료'
-- ),
-- (
--     'E이메일',
--     'E이름',
--     'E비밀번호',
--     'E인증',
--     'E만료'
-- ),
-- (
--     'F이메일',
--     'F이름',
--     'F비밀번호',
--     'F인증',
--     'F만료'
-- ),
-- (
--     'G이메일',
--     'G이름',
--     'G비밀번호',
--     'G인증',
--     'G만료'
-- );

INSERT INTO new_book 
(
    new_book_title, new_book_subtitle,
    new_book_info, new_book_info_short,
    new_book_org_image, new_book_image,
    new_book_price, new_book_writer,
    new_book_translater, new_book_publisher,
    new_book_pages, new_book_mount,
    new_book_genre, new_book_country
) VALUES
(
    '익명의 책 A', 'A 부제목',
    '익명의 책 A 의 설명입니다.', '익명의 책 A 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 A',
    '역자 A', '발행자 A',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 B', 'B 부제목',
    '익명의 책 B 의 설명입니다.', '익명의 책 B 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 B',
    '역자 B', '발행자 B',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 C', 'C 부제목',
    '익명의 책 C 의 설명입니다.', '익명의 책 C 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 C',
    '역자 C', '발행자 C',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 D', 'D 부제목',
    '익명의 책 D 의 설명입니다.', '익명의 책 D 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 D',
    '역자 D', '발행자 D',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 E', 'E 부제목',
    '익명의 책 E 의 설명입니다.', '익명의 책 E 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 E',
    '역자 E', '발행자 E',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 F', 'F 부제목',
    '익명의 책 F 의 설명입니다.', '익명의 책 F 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 F',
    '역자 F', '발행자 F',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 G', 'G 부제목',
    '익명의 책 G 의 설명입니다.', '익명의 책 G 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 G',
    '역자 G', '발행자 G',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 H', 'H 부제목',
    '익명의 책 H 의 설명입니다.', '익명의 책 H 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 H',
    '역자 H', '발행자 H',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 I', 'I 부제목',
    '익명의 책 I 의 설명입니다.', '익명의 책 I 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 I',
    '역자 I', '발행자 I',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 J', 'J 부제목',
    '익명의 책 J 의 설명입니다.', '익명의 책 J 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 J',
    '역자 J', '발행자 J',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 K', 'K 부제목',
    '익명의 책 K 의 설명입니다.', '익명의 책 K 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 K',
    '역자 K', '발행자 K',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 L', 'L 부제목',
    '익명의 책 L 의 설명입니다.', '익명의 책 L 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 L',
    '역자 L', '발행자 L',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 M', 'M 부제목',
    '익명의 책 M 의 설명입니다.', '익명의 책 M 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 M',
    '역자 M', '발행자 M',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 N', 'N 부제목',
    '익명의 책 N 의 설명입니다.', '익명의 책 N 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 N',
    '역자 N', '발행자 N',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 O', 'O 부제목',
    '익명의 책 O 의 설명입니다.', '익명의 책 O 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 O',
    '역자 O', '발행자 O',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 P', 'P 부제목',
    '익명의 책 P 의 설명입니다.', '익명의 책 P 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 P',
    '역자 P', '발행자 P',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 Q', 'Q 부제목',
    '익명의 책 Q 의 설명입니다.', '익명의 책 Q 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 Q',
    '역자 Q', '발행자 Q',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 R', 'R 부제목',
    '익명의 책 R 의 설명입니다.', '익명의 책 R 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 R',
    '역자 R', '발행자 R',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 S', 'S 부제목',
    '익명의 책 S 의 설명입니다.', '익명의 책 S 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 S',
    '역자 S', '발행자 S',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 T', 'T 부제목',
    '익명의 책 T 의 설명입니다.', '익명의 책 T 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 T',
    '역자 T', '발행자 T',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 U', 'U 부제목',
    '익명의 책 U 의 설명입니다.', '익명의 책 U 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 U',
    '역자 U', '발행자 U',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 V', 'V 부제목',
    '익명의 책 V 의 설명입니다.', '익명의 책 V 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 V',
    '역자 V', '발행자 V',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 W', 'W 부제목',
    '익명의 책 W 의 설명입니다.', '익명의 책 W 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 W',
    '역자 W', '발행자 W',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 S', 'S 부제목',
    '익명의 책 S 의 설명입니다.', '익명의 책 S 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 S',
    '역자 S', '발행자 S',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 Y', 'Y 부제목',
    '익명의 책 Y 의 설명입니다.', '익명의 책 Y 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 Y',
    '역자 Y', '발행자 Y',
    321, 1,
    '소설', '국내'
),
(
    '익명의 책 Z', 'Z 부제목',
    '익명의 책 Z 의 설명입니다.', '익명의 책 Z 의 짧은 설명입니다.',
    'none', 'none',
    43200, '작가 Z',
    '역자 Z', '발행자 Z',
    321, 1,
    '소설', '국내'
);

INSERT INTO old_book
(
    new_book_pk,
    user_pk,
    admin_pk
) VALUES
(1,1,1), (2,1,1), (3,1,1), (4,1,1), (5,1,1), (6,1,1),
(7,1,1), (8,1,1), (9,1,1), (10,1,1), (11,1,1), (12,1,1),
(13,1,1), (14,1,1), (15,1,1), (16,1,1), (17,1,1), (18,1,1),
(19,1,1), (20,1,1), (21,1,1), (22,1,1), (23,1,1), (24,1,1),
(25,1,1), (26,1,1);

UPDATE old_book SET old_book_discount = old_book_discount + 10;

SELECT * FROM old_book WHERE new_book_pk = 1;

DELETE FROM old_book WHERE new_book_pk = 3 AND old_book_discount = 30 ;

SELECT
old_book_discount as oldBookDiscount,
COUNT(*)  as oldBookMount
FROM old_book
WHERE new_book_pk = 9
GROUP BY old_book_discount;

INSERT INTO old_book_selled
(
    new_book_pk
) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26);


SELECT * FROM user;
SELECT * FROM admin;

SELECT * FROM new_book;
SELECT * FROM old_book;

SELECT 
    old_book_pk as oldBookPk,
	new_book_title as bookTitle,
	new_book_price as bookPrice,
	new_book_writer as bookWriter,
	new_book_created as bookCreated
FROM old_book
    LEFT OUTER JOIN new_book
        ON old_book.new_book_pk = new_book.new_book_pk
	LIMIT 5;
SELECT * FROM old_book;


SELECT 
    old_book_pk as oldBookPk,
	new_book_image as bookImage,
	new_book_title as bookTitle,
	new_book_price as bookPrice,
	new_book_writer as bookWriter,
	new_book_created as bookCreated
FROM old_book
    LEFT OUTER JOIN new_book
        ON old_book.new_book_pk = new_book.new_book_pk
WHERE old_book_discount > 0
	LIMIT 5;

SELECT * FROM old_book
    LEFT OUTER JOIN user
        ON old_book.user_pk = user.user_pk;

SELECT * FROM old_book
    LEFT OUTER JOIN admin
        ON old_book.admin_pk = admin.admin_pk;

SELECT * FROM old_book
    LEFT OUTER JOIN new_book
        ON old_book.new_book_pk = new_book.new_book_pk
    LEFT OUTER JOIN user
        ON old_book.user_pk = user.user_pk
    LEFT OUTER JOIN admin
        ON old_book.admin_pk = admin.admin_pk;

SELECT * FROM old_book_selled;

UPDATE old_book_selled
SET old_book_selled_count = old_book_selled_count + 1
WHERE old_book_selled_pk = 12;

SELECT
	old_book_selled.old_book_selled_pk as oldBookSelledPk,
    old_book_selled.old_book_selled_count as oldBookSelledCount,
    old_book_selled.new_book_pk as bookPk,
    new_book.new_book_title as bookTitle,
    new_book.new_book_subtitle as bookSubtitle,
    new_book.new_book_info as bookInfo,
    new_book.new_book_info_short as bookInfoShort,
    new_book.new_book_writer as bookWriter,
    new_book.new_book_created as bookCreate
FROM old_book_selled
LEFT OUTER JOIN new_book
	ON old_book_selled.new_book_pk = new_book.new_book_pk
ORDER BY old_book_selled_count DESC
LIMIT 3;


-- 재고량 가져오기

SELECT
	new_book_genre as bookGenre,
    new_book_writer as bookWriter
FROM old_book
LEFT OUTER JOIN new_book
	ON old_book.new_book_pk = new_book.new_book_pk
WHERE old_book.new_book_pk = 3
GROUP BY new_book.new_book_pk
LIMIT 1;

SELECT
    old_book_pk as oldBookPk,
	new_book_image as bookImage,
	new_book_title as bookTitle,
	new_book_price as bookPrice,
	new_book_writer as bookWriter,
	new_book_created as bookCreated,
    new_book_genre as bookGenre
FROM old_book
LEFT OUTER JOIN new_book
	ON old_book.new_book_pk = new_book.new_book_pk
WHERE new_book.new_book_genre = '소설'
GROUP BY new_book.new_book_pk
ORDER BY old_book_pk DESC
LIMIT 6;

SELECT
	old_book.new_book_pk as bookPk,
    old_book_pk as oldBookPk,
	new_book_image as bookImage,
	new_book_title as bookTitle,
	new_book_price as bookPrice,
	new_book_writer as bookWriter,
	new_book_created as bookCreated
FROM old_book
LEFT OUTER JOIN new_book
	ON old_book.new_book_pk = new_book.new_book_pk
WHERE new_book.new_book_writer = '작가 B'
GROUP BY new_book.new_book_pk
ORDER BY old_book_pk DESC
LIMIT 6;

SELECT * FROM old_book WHERE new_book_pk=12;

SELECT
	old_book_pk as oldBookPk,
    old_book.new_book_pk as bookPk,
	new_book_image as bookImage,
	new_book_title as bookTitle,
	new_book_price as bookPrice,
	new_book_writer as bookWriter,
	new_book_created as bookCreated
FROM old_book
	LEFT OUTER JOIN new_book
		ON old_book.new_book_pk = new_book.new_book_pk
GROUP BY old_book.new_book_pk
ORDER BY old_book_pk DESC
LIMIT 6;

SELECT * FROM old_book;