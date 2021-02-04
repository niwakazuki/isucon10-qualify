DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.estate_feature;
DROP TABLE IF EXISTS isuumo.chair;
DROP TABLE IF EXISTS isuumo.chair_feature;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    point point GENERATED ALWAYS AS (st_geometryfromtext(concat('POINT (',`latitude`,' ',`longitude`, ')'))) STORED NOT NULL ,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    minus_popularity INTEGER GENERATED ALWAYS AS (-popularity),
    PRIMARY KEY (`id`),
    KEY `idx_rent` (`rent`) USING BTREE,
    KEY `idx_door_width` (`door_width`) USING BTREE,
    KEY `idx_door_height` (`door_height`) USING BTREE,
    SPATIAL KEY `idx_point` (`point`),
    KEY `idx_minuspopularity_id` (`minus_popularity`,`id`) USING BTREE
);

CREATE TABLE isuumo.`estate_feature` (
    `seq` int(11) NOT NULL AUTO_INCREMENT,
    `feature` varchar(128) NOT NULL,
    `id` int(11) NOT NULL,
    PRIMARY KEY (`seq`),
    KEY `idx_feature` (`feature`) USING BTREE
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    minus_popularity INTEGER GENERATED ALWAYS AS (-popularity),
    stock       INTEGER         NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idx_price` (`price`) USING BTREE,
    KEY `idx_height` (`height`) USING BTREE,
    KEY `idx_width` (`width`) USING BTREE,
    KEY `idx_depth` (`depth`) USING BTREE,
    KEY `idx_color` (`color`) USING BTREE,
    KEY `idx_kind` (`kind`) USING BTREE,
    KEY `idx_minuspopularity_id` (`minus_popularity`,`id`) USING BTREE
);

CREATE TABLE isuumo.`chair_feature` (
    `seq` int(11) NOT NULL AUTO_INCREMENT,
    `feature` varchar(128) NOT NULL,
    `id` int(11) NOT NULL,
    PRIMARY KEY (`seq`),
    KEY `idx_feature` (`feature`) USING BTREE
);
