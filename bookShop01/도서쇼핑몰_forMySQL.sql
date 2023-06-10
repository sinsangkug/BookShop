 -- 상품이미지 정보 테이블    for MySQL
   CREATE TABLE T_GOODS_DETAIL_IMAGE
(
    IMAGE_ID INT(20) primary key, -- 상품 이미지 번호
    GOODS_ID INT(20), -- 상품 번호
    FILENAME VARCHAR(50), -- 상품 이미지 파일명
    REG_ID VARCHAR(20), -- 상품 등록자 아이디
    FILETYPE VARCHAR(40), -- 상품 이미지 파일종류
    CREDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 상품 등록일
);


-- 도서 상품 정보 테이블  for MySQL
CREATE TABLE T_SHOPPING_GOODS
(
    GOODS_ID INT(20) primary key, -- 도서 상품번호
    GOODS_SORT VARCHAR(50), -- 도서 상품종류
    GOODS_TITLE VARCHAR(100), -- 도서 상품제목
    GOODS_WRITER VARCHAR(50), -- 도서 상품 저자이름
    GOODS_PUBLISHER VARCHAR(50), -- 도서상품 출판사이름
    GOODS_PRICE INT(10), -- 도서 상품 정가
    GOODS_SALES_PRICE INT(10), -- 도서 상품 판매가격  
    GOODS_POINT INT(10), -- 도서 상품 포인트
    GOODS_PUBLISHED_DATE DATE, -- 도서 상품 출판일
    GOODS_TOTAL_PAGE INT(5), -- 도서 상품 총페이지수
    GOODS_ISBN VARCHAR(50), -- 도서 상품 isbn번호
    GOODS_DELIVERY_PRICE INT(10), -- 도서 상품 배송비
    GOODS_DELIVERY_DATE DATE,  -- 도서 상품 배송일
    GOODS_STATUS VARCHAR(50), -- 도서 상품 분류
    GOODS_INTRO VARCHAR(2000), -- 도서 상품 저자 소개
    GOODS_WRITER_INTRO VARCHAR(2000), -- 도서 상품 소개
    GOODS_PUBLISHER_COMMENT VARCHAR(2000),  -- 도서 상품 출판사 평
    GOODS_RECOMMENDATION VARCHAR(2000), -- 도서 상품 추천사
    GOODS_CONTENTS_ORDER TEXT, -- 도서 상품 목차
    GOODS_CREDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 도서 상품 입고일
);




-- 온라인 쇼핑몰의 회원 정보를 저장하는 테이블

CREATE TABLE T_SHOPPING_MEMBER
(
    MEMBER_ID VARCHAR(20) primary key, -- 회원 아이디
    MEMBER_PW VARCHAR(30), -- 회원 비밀번호
    MEMBER_NAME VARCHAR(50), -- 회원 이름
    MEMBER_GENDER VARCHAR(10), -- 회원 성별
    TEL1 VARCHAR(20), -- 회원 전화번호(첫 번째 부분)
    TEL2 VARCHAR(20), -- 회원 전화번호(두 번째 부분)
    TEL3 VARCHAR(20), -- 회원 전화번호(세 번째 부분)
    HP1 VARCHAR(20), -- 회원 휴대폰 번호(첫 번째 부분)
    HP2 VARCHAR(20), -- 회원 휴대폰 번호(두 번째 부분)
    HP3 VARCHAR(20), -- 회원 휴대폰 번호(세 번째 부분)
    SMSSTS_YN VARCHAR(20), -- 문자 수신 여부
    EMAIL1 VARCHAR(20), -- 회원 이메일주소(첫 번째 부분)
    EMAIL2 VARCHAR(20), -- 회원 이메일주소(두 번째 부분)
    EMAILSTS_YN VARCHAR(20), -- 이메일 수신 여부
    ZIPCODE VARCHAR(20), -- 우편번호
    ROADADDRESS VARCHAR(500), -- 도로명 주소
    JIBUNADDRESS VARCHAR(500), -- 지번 주소
    NAMUJIADDRESS VARCHAR(500), -- 참고 주소
    MEMBER_BIRTH_Y VARCHAR(20), -- 회원 생년
    MEMBER_BIRTH_M VARCHAR(20), -- 회원 생월
    MEMBER_BIRTH_D VARCHAR(20), -- 회원 생일
    MEMBER_BIRTH_GN VARCHAR(20), -- 회원 양/음력 구분
    JOINDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 가입 일시
    DEL_YN VARCHAR(20) DEFAULT 'N' -- 삭제 여부
);




-- 주문 정보를 담는 T_SHOPPING_ORDER 테이블
-- 이 테이블은 쇼핑몰에 대한 주문 정보를 저장하며, 주문 아이디, 회원 아이디, 상품 아이디, 주문자 이름 등과 같은 정보들을 포함하고 있습니다.
CREATE TABLE T_SHOPPING_ORDER
(
    ORDER_SEQ_NUM INT(20) PRIMARY KEY,   -- 주문 고유 번호
    ORDER_ID INT(20),                    -- 주문 아이디
    MEMBER_ID VARCHAR(20),               -- 회원 아이디
    GOODS_ID INT(20),                    -- 상품 아이디
    ORDERER_NAME VARCHAR(50),            -- 주문자 이름
    GOODS_TITLE VARCHAR(100),            -- 상품 제목
    ORDER_GOODS_QTY INT(5),              -- 주문 상품 수량
    GOODS_SALES_PRICE INT(5),            -- 상품 판매 가격
    GOODS_FILENAME VARCHAR(60),          -- 상품파일이름
    RECEIVER_NAME VARCHAR(50),           -- 수령인 이름
    RECEIVER_HP1 VARCHAR(20),            -- 수령인 휴대폰 번호 첫번째 자리
    RECEIVER_HP2 VARCHAR(20),            -- 수령인 휴대폰 번호 두번째 자리
    RECEIVER_HP3 VARCHAR(20),            -- 수령인 휴대폰 번호 세번째 자리
    RECEIVER_TEL1 VARCHAR(20),           -- 수령인 전화 번호 첫번째 자리
    RECEIVER_TEL2 VARCHAR(20),           -- 수령인 전화 번호 두번째 자리
    RECEIVER_TEL3 VARCHAR(20),           -- 수령인 전화 번호 세번째 자리
    DELIVERY_ADDRESS VARCHAR(500),       -- 배송 주소
    DELIVERY_METHOD VARCHAR(40),         -- 배송 방법
    DELIVERY_MESSAGE VARCHAR(300),       -- 배송 메시지
    GIFT_WRAPPING VARCHAR(20),           -- 선물 포장 여부
    PAY_METHOD VARCHAR(200),             -- 결제 방법
    CARD_COM_NAME VARCHAR(50),           -- 카드사 이름
    CARD_PAY_MONTH VARCHAR(20),          -- 카드 결제 개월 수
    PAY_ORDERER_HP_NUM VARCHAR(20),      -- 결제자 휴대폰 번호
    DELIVERY_STATE VARCHAR(20) DEFAULT 'delivery_prepared', -- 배송 상태
    PAY_ORDER_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 결제 주문 시각
    ORDERER_HP VARCHAR(50)               -- 주문자 휴대폰 번호
);



--  온라인 쇼핑몰에서 회원들이 구매를 고려하는 상품을 임시로 담아두는 장바구니 정보를 기록하는 테이블
CREATE TABLE T_SHOPPING_CART
(
    CART_ID INT(10) PRIMARY KEY,          -- 장바구니 아이디 : 장바구니 항목의 고유 식별자입니다. 데이터베이스에서 기본 키로 사용됩니다.
    GOODS_ID INT(20),                     -- 상품 아이디 : 담겨있는 상품의 고유 식별자를 나타냅니다.
    MEMBER_ID VARCHAR(20),                -- 회원 아이디 : 장바구니를 사용하는 회원의 고유 식별자(아이디)입니다.
    DEL_YN VARCHAR(20) DEFAULT 'N',       -- 삭제 여부 ('Y': 삭제됨, 'N': 삭제되지 않음)    :     장바구니 항목이 삭제되었는지 여부를 나타내며, 'Y'는 삭제됨, 'N'은 삭제되지 않음을 의미합니다.
    CREDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 생성 날짜  : 장바구니 항목이 생성된 날짜와 시간을 나타냅니다.
    CART_GOODS_QTY INT(4) DEFAULT 1       -- 장바구니 상품 수량   : 상품의 개수(수량)를 나타냅니다.
);



