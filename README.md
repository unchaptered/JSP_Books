# Introduce

본 문서는 _2022년 1월 26일_ 에 작성되었습니다.

[JSP_BOOKS Git Repository](https://github.com/unchaptered/JSP_Books)

```javascript

// 2022-01-26 이게 원본 == 서버에있는 에러 
login_func.jsp
마지막 커밋을 한 이후에, 그 파일을 다시 건드리실 거면 git fetch, git pull
git fetch
git pull
```

## BOOKs

BOOKs(가제) 는 JSP 기반 웹 프로젝트입니다.

<hr>

## Process

본 프로젝트는 다음과 같은 절차로 진행되었습니다.

1. Frontend Prototype
2. Merge to JSP
3. Backend Dev

### Frontend Prototype

팀원들과 협업으로 진행한 첫 프로젝트였습니다.
프로토타입 제작 일정은 다음과 같았습니다.

1. 22년 1월 14일 (1일) : 최초 기획 회의
2. 22년 1월 17일 ~ 21일 (5일) : 프로토 타입 제작
3. 22년 1월 24일 ~ 26일 (3일) : 프로토 타입 제작 및 JSP로 파일 이전 준비
4. 22년 1월 27일 ~ xx일 () : 이전 하고 작업
5. 22년 2월 16일 ~ 

<hr>

## Function

1. 유저 CRUD UserDto UserController *.us
2. 새책 CRUD BookDto NewBookController *.nb
3. 중고책 CRUD BookDto OldBookController *.ob
4. 공지사항 CRUD NoticeDto PostController *.po
5. 이벤트 CRUD EventDto PostController *.po
6. 관리자 CRUD AdminDto AdminController *.adm
7. 음반 CRUD AlbumDto AlbumController *.al

### 기타

1. 고결 | 우편번호API, 인증시스템(이메일, 전화번호)
2. 권혜진 | 작품 별 별점
3. 김명현 | 작가 설명 및 작품 조회
3. 정병찬 | 구매, 장바구니, 결제내용
4. 정병찬 | 추천 기능(구매한 책이랑 비슷한 책 추천하기)
5. 배효찬 | 관리자 인증
6. 배효찬 | 통계 기능 (방문자 분석, 카테고리 분석, 주문통계, 매출통계)
7. 권승연 | 게시글 좋아요, 조회수 집계  
8. 권승연 | 게시글 검색 (제목 + ...)
8. 이민석 | 책 검색 (제목 + ...)
9. 이민석 | BookAPI https://steemit.com/kr/@anpigon/open-api

<hr>

## DB

1. 유저 및 관리자
2. 공지사항 및 이벤트글
3. 신규도서 및 중고도서
4. 앨범

### 1. 유저 및 관리자

#### 1.1. 유저

```sql
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
```

#### 1.2. 관리자

```sql
CREATE TABLE admin (
   admin_pk INT AUTO_INCREMENT PRIMARY KEY,
   admin_email VARCHAR(1000) NOT NULL,
   admin_name VARCHAR(500) NOT NULL,
   admin_password VARCHAR(500) NOT NULL,
   admin_authorized VARCHAR(300),
   admin_expired VARCHAR(300)
);
```

### 2. 게시글

```sql
CREATE TABLE post (
   post_pk INT AUTO_INCREMENT PRIMARY KEY,
   post_title VARCHAR(300),
   post_text VARCHAR(300),
   post_owner VARCHAR(300),
   post_created VARCHAR(300),
   post_viewed VARCHAR(300)
);
```

#### 2.0. 게시글 첨부 파일

```sql
CREATE TABLE post_files (
   post_file_pk BIGINT PRIMARY KEY,
   post_file_system VARCHAR(1000),
   post_file_origin VARCHAR(1000)
);
```

#### 2.1. 공지사항 게시글

```sql
CREATE TABLE post_notice (
   notice_pk INT AUTO_INCREMENT PRIMARY KEY,
   notice_file BIGINT,
   notice_important VARCHAR(300),
   post_pk INT,
   FOREIGN KEY (notice_file)
      REFERENCES post_files (post_file_pk)
);
```

#### 2.2. 이벤트 게시글

```sql
CREATE TABLE post_event (
   event_pk INT AUTO_INCREMENT PRIMARY KEY,
   event_started VARCHAR(300),
   event_ended VARCHAR(300),
   event_file BIGINT,
   event_file_detail BIGINT,
   event_like VARCHAR(300),
   post_pk INT,
   FOREIGN KEY (event_file)
      REFERENCES post_files (post_file_pk),
   FOREIGN KEY (event_file_detail)
      REFERENCES post_files (post_file_pk)
);
```
### 3. 도서

#### 3.1. 신규도서

```sql
CREATE TABLE new_book (
   new_book_pk INT AUTO_INCREMENT PRIMARY KEY,
   new_book_title VARCHAR(300),
   new_book_subtitle VARCHAR(300),
   new_book_info VARCHAR(300),
   new_book_info_short VARCHAR(300),
   new_book_imgae VARCHAR(300),
   new_book_price VARCHAR(300),
   new_book_writer VARCHAR(300),
   new_book_translater VARCHAR(300),
   new_book_published VARCHAR(300),
   new_book_pages VARCHAR(300),
   new_book_mount VARCHAR(300),
   new_book_genre INT,
   new_book_country INT,
   FOREIGN KEY (new_book_genre)
      REFERENCES book_genre (book_genre_pk),
   FOREIGN KEY (new_book_country)
      REFERENCES book_country (book_country_pk)
);
```

#### 3.2. 중고도서

```sql
CREATE TABLE old_book (
   new_book_pk INT,
   old_book_pk INT AUTO_INCREMENT PRIMARY KEY,
   old_book_one_mount VARCHAR(300),
   old_book_two_mount VARCHAR(300),
   old_book_three_mount VARCHAR(300),
   old_book_four_mount VARCHAR(300),
   old_book_five_mount VARCHAR(300),
   FOREIGN KEY (new_book_pk)
      REFERENCES new_book (new_book_pk)
);
```

### 4. 앨범

```sql
CREATE TABLE album (
   album_pk INT AUTO_INCREMENT PRIMARY KEY,
   album_title VARCHAR(300),
   album_title_song VARCHAR(300),
   album_singer VARCHAR(300),
   album_release VARCHAR(300)
);
```

<hr>

## Git

Git 사용 관련된 규칙 및 주의사항을 정리하였습니다.

이 모든 내용을 알고 있을 필요는 없습니다.
확실한 것은 **GIt Upload** 와 **Git 주의사항 1,2** 만 지켜주셔도 아무 문제가 발생하지 않습니다.

또한 저희가 사용하기로 약속한 기능 외의 커맨드는 **절대로 사용하지 말아주세요.**
만약 테스트하고 싶은 코드가 있다면 **개인 저장소** 에서 진행해주세요.

### Git download

**최초**에 깃 저장소를 받아올 때, 다음과 같은 방법으로 작성을 해주세요.

1. git init
2. git pull 원본경로
3. git branch -m main
4. git remote add origin 원본경로

### Git Upload

**중요한 것은 작업 시작전에 fetch, pull 을 하여야 합니다.**
**Git 주의사항 1 을 참고해주세요**

1. git add 수정한 파일명
2. git coomit -m "ADD 파일명 (아래 ###Git Naming 참고)"
3. git push -u origin main

### Git 주의사항 - 내가 당당한 파일만 수정하기

A와 B는 동일한 index.jsp 를 가지고 있습니다.

이 파일의 담당자는 A 이지만 B 도 일부분을 수정했다고 해봅시다.

1. index.jsp _ A 가 수정한 부분
2. index.jsp _ B 가 수정한 부분

또한 B 가 먼저 commit, push 하였다고 가정해봅시다.

지금 서버의 최신 파일읜 index.jsp _ B 가 수정한 부분입니다.

이러한 경우 발생 가능한 문제는 다음과 같습니다.

1. fetch, pull, add , commit, push 순으로 입력할 경우
2. add, commit, push 순으로 입력할 경우

1.의 경우, 최신 버전인 index.jsp(B가 수정) 한 파일로 덮어 씌워지면서 내 파일을 잃어버립니다. git add 나 commit 을 하지 않았으므로 되돌릴 수도 없습니다.

2.의 경우, index.jsp(B) 와 index.jsp(A) 가 충돌을 일으킵니다.
이러한 경우 **GIt 주의사항 3** 대로 해주세요.


### Git 주의사항 1 - 작업 시작하기 전에 꼭 할 일

작업 시작하기 전에 꼭 할 일은 **최종 커밋 이후의 추가 작업 초기** 만을 의미합니다.
로그인 기능을 3일에 걸쳐 작업한다고 매일 pull 하면 안됩니다.

다음의 커맨드로 최신화를 할 수 있습니다.

1. git fetch
2. git pull

꼭 **최신화 완료 후 작업을 진행해주세요**

### Git 주의사항 2 - fetch, pull 없이 작업을 시작했을 경우

Git Repository (인터넷) 의 index.jsp 과 
local/ (내 컴퓨터) 의 index.jsp 가 다른 버전일 경우가 있습니다.

A 가 index.jsp 를 수정해서 커밋했는데,
B 가 index.jsp 를 작업하고 커밋을 완료하면 높은 확률로 충돌이 발생합니다.

따라서,
git fetch, pull 을 생활하여야 합니다.

만약 git fetch, pull, add "파일명", commit -m "커밋메세지" 의 절차를 준수하였는데,
알 수 없는 에러가 발생하였다면 **해당 문제를 공유해주세요.**

### Git 주의사항 3 - 충돌이 발생한 경우

무슨 경고창 뜨면서 충돌이 일어났으면, 그 어떤 커맨드도 입력하지말고 **해당 문제를 공유해주세요.**

### Git 주의사항 4 - revert 등 사용 금지

구 버전의 파일이 필요하다고 revert 를 사용하지 말아주세요.
그 상태에서 coomit, push 를 하였을 떄 연결된 파일이 얼마나 손상될지 예상하기 어렵습니다.

<hr>

### Git Naming

> [좋은 git commit 메시지를 위한 영어 사전](https://blog.ull.im/engineering/2019/03/10/logs-on-git.html)

위 포스트를 기반으로 Git Commit Nmaing 을 재작성해보았습니다.<br>
Git Commit 은 **어떠한 기능** 에 대한 **완성, 수정, 삭제, 단순화, 교체** 등에 대해서 기록하는 내용입니다. 따라서 협의 후, 확정된 내용은 아래 규칙을 준수해주세요.

1. ADD
2. FIX
3. REMOVE
4. SIMPLIFY
5. EXCHANGE

#### 시나리오

예를 들어,
담당하고 있는 부분이 로그인 페이지라고 한다면 다음과 같은 프로세스가 있을 수 있습니다.

- **로그인 프론트 구현** login.jsp, login.css / ADD login.jsp, login.css
- **로그인 기능 구현**  login_func.jsp / ADD login_func.jsp
- **로그인 기능 에러 수정** login_func.jsp / FIX 404 error in login_func.jsp
- **로그인 기능 전면 교체** login_func.jsp / EXCHANGE login_func.jsp
- **로그인 기능 전면 제거** login_func.jsp / REMOVE login_func.jsp
- **로그인 기능 리펙토링** login_func.jsp / SIMPLIFY login_func.jsp

#### ADD 파일명

기능 추가를 위해 새로운 파일을 만들었다면 다음과 같은 형식으로 커밋을 올려주세요.

- **파일 추가** / ADD index.jsp, css, js
- **파일 추가**  / ADD old_book.jsp, css, js

- **일부 코드 추가** / ADD content box in index.jsp

#### FIX 파일명

커밋이 완료된 부분에서 에러가 발생하였고 이를 수정하게 되면 다음과 같은 형식으로 커밋을 올려주세요.

- **파일 전체의 수정** / FIX index.jsp
- **파일 일부의 수정** / FIX a(href) 404 in index.jsp

#### REMOVE 파일명

복수의 css 파일 및 jsp 파일의 병합, 사용하지 않는 파일 등이 있다면 제거하고 다음과 같은 형식으로 커밋을 올려주세요.

- **파일 전체의 삭제** / REMOVE old_book.jsp, css, js
- **파일 일부의 삭제** / REMOVE content box in index.jsp

#### SIMPLIFY 파일명

반복구문을 줄이거나 코드를 보기좋기 정리하는 등의 작업 후 다음과 같은 형식으로 커밋을 올려주세요.

- **파일 전체의 정리** / SIMPLIFY sample.js
- **파일 일부의 정리** / SIMPLIFY function sample in sample.js

#### EXCHANGE 파일명

파일 자체를 새로 만들어서 교체한 작업은 다음과 같은 형식으로 커밋을 올려주세요.

- **파일 전체의 교체** / EXCHANGE login.css

<hr>

## Git Error

### There is no tracking information for the current branch.

>
There is no tracking information for the current branch.
Please specify which branch you want to merge with.
See git-pull(1) for details.

    git pull <remote> <branch>

If you wish to set tracking information for this branch you can do so with:

    git branch --set-upstream-to=origin/<branch> main

git fetch, git pull 을 시도했을 때 위와 같은 에러가 뜰 수 있습니다.

위 에러는 branch 가 추적 중인 원본 branch 가 없거나 있는데 잘못된 경우입니다.

다음의 커맨드로 branch 를 확인, 제거 및 재등록합시다.

1. 추적 중인 origin 이 있는지 확인 (있다면 2번으로 제거)
>
1. git remote -v
2. git remote rm origin

2. 추적 중인 origin 새로 등록
>
1. git remote add origin 경로

3. git pull 시도했는데 다시 위의 에러가 뜰 경우 (추적 대상을 origin/main 깃 원본 저장소의 main 브렌치 로 변경)
>
1. git branch --set-upstream-to=origin/main main


<hr>

## Contributors

1. unchaptered [Git Home](https://github.com/unchaptered) [Velog](https://velog.io/@unchapterd/) | <strong> 조장, 기획서, 중고도서 및 할인율 별 집계</strong>
2. kogyul [Git Home](https://github.com/kogyul) [Velog](https://velog.io/@kgyul12) | <strong> 기획서 대본, AJAX 기반 유저 구현 </strong>
3. capriceksy [Git Home](https://github.com/capriceksy) [Velog](https://velog.io/@capriceksy) | <strong> 기획서, 이벤트 및 공지사항(검색 및 정렬 등 포함) </strong>
4. sunsetkk [Git Home](https://github.com/sunsetkk) [T-story](https://guul.tistory.com) | <strong> 신규 도서 등록 및 수정 </strong>
5. kmhyeon [Git Home](https://github.com/kmhyeon) | <strong> 신규 도서 리스트 및 자세히 보기 </strong>
6. HyoChanBae [Git Home](https://github.com/HyoChanBae) [T-story](https://tomset.tistory.com/) | <strong> 관리자, 통계 </strong>
7. jungbc1 [Git Home](https://github.com/jungbc1) [Velog](https://velog.io/@tonkedown) | <strong> 장바구니, 구매, 구매내역 </strong>