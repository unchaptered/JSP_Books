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
4. 22년 1월 27일 ~ 

## DB

### 전체 구조


┌ 유저
├ 관리자
├ 게시글
│ └ 이벤트
│ └ 공지사항
└ 상품
  └ 신규 도서 - 장르, 발행국가
  └ 중고도서
  └ 음반


### 1.1. 유저


1. user_pk // PK
2. user_email
3. user_name
4. user_password
5. user_phone
6. user_zipcode
7. user_address
8. user_address_detail
9. user_address_etc
10. user_bank
11. user_bank_account


### 1.2. 관리자


1. admin_pk // PK
2. admin_name
3. admin_password
4. admin_authorized
5. admin_expired


### 2. 게시글


1. post_pk
2. post_title
3. post_text
4. post_owner
5. post_created
6. post_viewed


#### 2.1. 이벤트


1. event_pk
2. event_started
3. event_ended
4. event_image <<>>
5. event_image_detail <<>>
6. event_like
7. post_pk // FK


#### 2.2. 공지사항


1. notice_pk
2. notice_files
3. notice_important
4. post_pk // FK


### 3. 상품


1. product_pk // PK
2. product_sort


#### 3.1. 신규 도서


1. new_book_pk // PK
2. new_book_title
3. new_book_subtitle
4. new_book_info
5. new_book_info_short 
6. new_book_imgae <<>>
7. new_book_price
8. new_book_writer
9. new_book_translater
10. new_book_published
11. new_book_pages
12. new_book_mount
13. new_book_genre // FK
14. new_book_country // FK
15. product_pk // FK


### 3.1.1. 도서 > 장르


1. genre_pk // PK
2. genre_name


### 3.1.2. 도서 > 발행국가


1. country_pk // PK
2. country_name


#### 3.2. 중고 도서


1. old_book_pk // PK
2. old_book_one_mount // 재고 10% ~ 50% 까지
3. old_book_two_mount
4. old_book_three_mount
5. old_book_four_mount
6. old_book_five_mount
7. new_book_pk  // FK
8. product_pk // FKK


#### 3.2 음반


1. album_pk // PK
2. album_title
3. album_title_sing
4. album_singer
5. album_price
6. album_relaese
7. product_pk // FK








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

## Contriubters

1. unchaptered [Git Home](https://github.com/unchaptered) [Velog](https://velog.io/@unchapterd/)
2. kogyul [Git Home](https://github.com/kogyul) [Velog](https://velog.io/@kgyul12)
3. capriceksy [Git Home](https://github.com/capriceksy) [Velog](https://velog.io/@capriceksy)
4. sunsetkk [Git Home](https://github.com/sunsetkk) [T-story](https://guul.tistory.com)
5. kmhyeon [Git Home](https://github.com/kmhyeon)
6. HyoChanBae [Git Home](https://github.com/HyoChanBae) [T-story](https://tomset.tistory.com/)
7. jungbc1 [Git Home](https://github.com/jungbc1) [Velog](https://velog.io/@tonkedown)