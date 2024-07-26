
CREATE TABLE board
(
  board_number   INT         NOT NULL AUTO_INCREMENT COMMENT '게시물 번호',
  writer_email   VARCHAR(50) NOT NULL COMMENT '작성자 이메일',
  title          TEXT        NOT NULL COMMENT '제목',
  content        TEXT        NOT NULL COMMENT '내용',
  write_datetime DATETIME    NOT NULL COMMENT '작성날짜',
  favorite_count INT         NOT NULL DEFAULT 0 COMMENT '좋아요 수',
  comment_count  INT         NOT NULL DEFAULT 0 COMMENT '댓글 수',
  view_count     INT         NOT NULL DEFAULT 0 COMMENT '조회 수',
  PRIMARY KEY (board_number)
) COMMENT '게시물 테이블';

CREATE TABLE comment
(
  comment_number INT         NOT NULL COMMENT '댓글 번호',
  board_number   INT         NOT NULL AUTO_INCREMENT COMMENT '게시물 번호',
  user_email     VARCHAR(50) NOT NULL COMMENT '사용자 이메일',
  content        TEXT        NOT NULL COMMENT '내용',
  write_datetime DATETIME    NOT NULL COMMENT '작성날짜',
  PRIMARY KEY (comment_number)
) COMMENT '댓글 테이블';

CREATE TABLE favorite
(
  board_number INT         NOT NULL AUTO_INCREMENT COMMENT '게시물 번호',
  email        VARCHAR(50) NOT NULL COMMENT '사용자 이메일'
) COMMENT '좋아요 테이블';

CREATE TABLE image
(
  board_number INT  NOT NULL AUTO_INCREMENT COMMENT '게시물 번호',
  image        TEXT NOT NULL COMMENT '이미지 URL'
) COMMENT '게시물 이미지 테이블';

CREATE TABLE search_log
(
  sequence      INT     NOT NULL COMMENT '시퀀스',
  search_word   TEXT    NOT NULL COMMENT '검색어',
  relation_word TEXT    NULL     COMMENT '관련 검색어',
  relation      BOOLEAN NOT NULL COMMENT '관련 검색어 여부',
  PRIMARY KEY (sequence)
) COMMENT '검색기록 테이블';

CREATE TABLE user
(
  email          VARCHAR(50)  NOT NULL COMMENT '사용자 이메일',
  password       VARCHAR(100) NOT NULL COMMENT '사용자 비밀번호',
  nickname       VARCHAR(20)  NOT NULL UNIQUE COMMENT '사용자 닉네임',
  tel_number     VARCHAR(15)  NOT NULL UNIQUE COMMENT '휴대전화번호',
  address        TEXT         NOT NULL COMMENT '사용자 주소',
  address_detail TEXT         NULL     COMMENT '사용자 주소상세',
  profile_image  TEXT         NULL     COMMENT '프로필사진',
  PRIMARY KEY (email)
) COMMENT '사용자 테이블';

ALTER TABLE image
  ADD CONSTRAINT FK_board_TO_image
    FOREIGN KEY (board_number)
    REFERENCES board (board_number);

ALTER TABLE board
  ADD CONSTRAINT FK_user_TO_board
    FOREIGN KEY (writer_email)
    REFERENCES user (email);

ALTER TABLE favorite
  ADD CONSTRAINT FK_user_TO_favorite
    FOREIGN KEY (email)
    REFERENCES user (email);

ALTER TABLE favorite
  ADD CONSTRAINT FK_board_TO_favorite
    FOREIGN KEY (board_number)
    REFERENCES board (board_number);

ALTER TABLE comment
  ADD CONSTRAINT FK_board_TO_comment
    FOREIGN KEY (board_number)
    REFERENCES board (board_number);

ALTER TABLE comment
  ADD CONSTRAINT FK_user_TO_comment
    FOREIGN KEY (user_email)
    REFERENCES user (email);
