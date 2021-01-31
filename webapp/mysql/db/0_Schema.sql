DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    minus_popularity INTEGER GENERATED ALWAYS AS (-popularity),
    PRIMARY KEY (`id`),
    KEY `krent` (`rent`) USING BTREE,
    KEY `kdoor_width` (`door_width`) USING BTREE,
    KEY `kdoor_height` (`door_height`) USING BTREE,
    KEY `kminus_popularity` (`minus_popularity`) USING BTREE
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
    KEY `kprice` (`price`) USING BTREE,
    KEY `kwidth` (`width`) USING BTREE,
    KEY `kdepth` (`depth`) USING BTREE,
    KEY `kpopularity` (`popularity`) USING BTREE,
    KEY `kminus_popularity` (`minus_popularity`) USING BTREE,
    KEY `kstock` (`stock`) USING BTREE,
    KEY `kkind_with_stock` (`kind`,`stock`) USING BTREE,
    KEY `kcolor_with_stock` (`color`,`stock`) USING BTREE,
    KEY `kheight_with_stock` (`height`,`stock`) USING BTREE,
    KEY `kprice_with_stock` (`price`,`stock`) USING BTREE,
    KEY `kwidth_with_stock` (`width`,`stock`) USING BTREE,
    KEY `kdepth_with_stock` (`depth`,`stock`) USING BTREE
);
