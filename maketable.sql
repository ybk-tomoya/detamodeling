-- 拠点テーブル
CREATE TABLE 拠点 (
    拠点ID INT PRIMARY KEY,
    拠点名 VARCHAR(100) NOT NULL,
    住所 VARCHAR(255)
);

-- レッスン室テーブル
CREATE TABLE レッスン室 (
    拠点ID INT,
    レッスン室番号 INT,
    レッスンID INT,
    PRIMARY KEY (拠点ID, レッスン室番号),
    FOREIGN KEY (拠点ID) REFERENCES 拠点(拠点ID),
    FOREIGN KEY (レッスンID) REFERENCES レッスン(レッスンID)
);

-- レッスンテーブル
CREATE TABLE レッスン (
    レッスンID INT PRIMARY KEY,
    生徒ID INT,
    指導者ID INT,
    拠点ID INT,
    レッスン室番号 INT,
    コースID INT,
    曜日 VARCHAR(10),
    時間 TIME,
    FOREIGN KEY (生徒ID) REFERENCES 生徒(生徒ID),
    FOREIGN KEY (指導者ID) REFERENCES 指導者(指導者ID),
    FOREIGN KEY (拠点ID) REFERENCES 拠点(拠点ID),
    FOREIGN KEY (レッスン室番号, 拠点ID) REFERENCES レッスン室(レッスン室番号, 拠点ID),
    FOREIGN KEY (コースID) REFERENCES コース(コースID)
);

-- コーステーブル
CREATE TABLE コース (
    コースID INT PRIMARY KEY,
    コース名 VARCHAR(100) NOT NULL
);

-- 指導者テーブル
CREATE TABLE 指導者 (
    指導者ID INT PRIMARY KEY,
    氏名 VARCHAR(100) NOT NULL,
    住所 VARCHAR(255),
    携帯電話番号 VARCHAR(15),
    固定電話番号 VARCHAR(15),
    メールアドレス VARCHAR(100)
);

-- 生徒テーブル
CREATE TABLE 生徒 (
    生徒ID INT PRIMARY KEY,
    保護者ID INT,
    氏名 VARCHAR(100) NOT NULL,
    住所 VARCHAR(255),
    携帯電話番号 VARCHAR(15) NULL,
    固定電話番号 VARCHAR(15) NULL,
    メールアドレス VARCHAR(100) NULL,
    FOREIGN KEY (保護者ID) REFERENCES 保護者(保護者ID)
);

-- 保護者テーブル
CREATE TABLE 保護者 (
    保護者ID INT PRIMARY KEY,
    氏名 VARCHAR(100) NOT NULL,
    住所 VARCHAR(255),
    携帯電話番号 VARCHAR(15),
    固定電話番号 VARCHAR(15),
    メールアドレス VARCHAR(100)
);
