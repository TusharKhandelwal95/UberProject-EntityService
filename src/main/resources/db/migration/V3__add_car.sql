ALTER TABLE booking_review
DROP
FOREIGN KEY FK_BOOKING_REVIEW_ON_BOOKING;

ALTER TABLE passenger_review
DROP
FOREIGN KEY FK_PASSENGERREVIEW_ON_ID;

CREATE TABLE car
(
    id           BIGINT AUTO_INCREMENT NOT NULL,
    created_at   datetime     NOT NULL,
    updated_at   datetime     NOT NULL,
    plate_number VARCHAR(255) NOT NULL,
    color_id     BIGINT NULL,
    brand        VARCHAR(255) NULL,
    model        VARCHAR(255) NULL,
    car_type     VARCHAR(255) NULL,
    driver_id    BIGINT NULL,
    CONSTRAINT pk_car PRIMARY KEY (id)
);

CREATE TABLE color
(
    id         BIGINT AUTO_INCREMENT NOT NULL,
    created_at datetime     NOT NULL,
    updated_at datetime     NOT NULL,
    name       VARCHAR(255) NOT NULL,
    CONSTRAINT pk_color PRIMARY KEY (id)
);

ALTER TABLE driver
    ADD aadhar_card VARCHAR(255) NULL;

ALTER TABLE driver
    ADD active_city VARCHAR(255) NULL;

ALTER TABLE driver
    ADD rating DOUBLE NULL;

ALTER TABLE car
    ADD CONSTRAINT uc_car_platenumber UNIQUE (plate_number);

ALTER TABLE color
    ADD CONSTRAINT uc_color_name UNIQUE (name);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_COLOR FOREIGN KEY (color_id) REFERENCES color (id);

ALTER TABLE car
    ADD CONSTRAINT FK_CAR_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id);

DROP TABLE booking_review;

DROP TABLE passenger_review;

ALTER TABLE driver
DROP
COLUMN address;

ALTER TABLE passenger
    MODIFY phone_number VARCHAR (255);


ALTER TABLE driver
    ADD CONSTRAINT check_rating CHECK ( driver.rating >= 0 AND driver.rating <=5);