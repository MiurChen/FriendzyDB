CREATE DATABASE FRIENDZY;
USE FRIENDZY;
CREATE TABLE member_info(
member_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(50) NOT NULL,
mpassword VARCHAR(64) NOT NULL,
member_name VARCHAR(20) NOT NULL,
member_nick_name VARCHAR(20),
member_pic VARCHAR(500),
phone VARCHAR(20),
introduction VARCHAR(100),
companion_comment INT,
companion_score INT,
custmer_comment INT,
custmer_score INT,
registration_time DATETIME,
member_status BOOLEAN,
member_token VARCHAR(255),

CONSTRAINT unique_token UNIQUE (member_token)
)ENGINE InnoDB;

INSERT INTO member_info 
(email, mpassword, member_name, member_nick_name, member_pic, phone, introduction, companion_comment, companion_score, custmer_comment, custmer_score, registration_time, member_status, member_token)
VALUES
('john.doe@example.com', 'hashedpassword1', 'John Doe', 'Johnny', 'http://example.com/pic1.jpg', '0912345678', 'Love to travel and explore new places.', 10, 4, 5, 3, '2024-12-29 10:30:00', TRUE, 'token1'),
('jane.smith@example.com', 'hashedpassword2', 'Jane Smith', 'Janey', 'http://example.com/pic2.jpg', '0923456789', 'A passionate cook and a bookworm.', 20, 5, 10, 4, '2024-12-28 09:20:00', TRUE, 'token2'),
('alex.jones@example.com', 'hashedpassword3', 'Alex Jones', 'Alex', 'http://example.com/pic3.jpg', '0934567890', 'Enthusiast in tech and gadgets.', 15, 3, 8, 2, '2024-12-27 11:45:00', TRUE, 'token3'),
('mary.johnson@example.com', 'hashedpassword4', 'Mary Johnson', 'Mary', 'http://example.com/pic4.jpg', '0945678901', 'Lover of pets and nature walks.', 12, 4, 9, 4, '2024-12-26 14:00:00', TRUE, 'token4'),
('peter.brown@example.com', 'hashedpassword5', 'Peter Brown', 'Pete', 'http://example.com/pic5.jpg', '0956789012', 'Avid photographer and traveler.', 18, 5, 7, 4, '2024-12-25 16:10:00', TRUE, 'token5');

CREATE TABLE applicant(
service_id INT AUTO_INCREMENT,
applicant_account INT,
application_date DATETIME,
apply_status TINYINT,
application_result TINYINT,
PRIMARY KEY (service_id,applicant_account)
)ENGINE InnoDB;

INSERT INTO applicant (applicant_account, application_date, apply_status, application_result)
VALUES
(1, '2024-12-29 10:00:00', 1, 0),
(2, '2024-12-28 12:00:00', 1, 1),
(3, '2024-12-27 14:30:00', 1, 0),
(4, '2024-12-26 16:15:00', 1, 1),
(5, '2024-12-25 09:45:00', 0, 0);

CREATE TABLE favorites(
hunter INT NOT NULL,
be_hunted INT NOT NULL,
PRIMARY KEY (hunter,be_hunted),
FOREIGN KEY (hunter) REFERENCES member_info(member_no),
FOREIGN KEY (be_hunted) REFERENCES member_info(member_no)
)ENGINE InnoDB;

INSERT INTO favorites (hunter, be_hunted)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

CREATE TABLE notification(
notif_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
reciver INT,
notif_content VARCHAR(100),
notif_date DATETIME,
notif_read_status TINYINT,
FOREIGN KEY (reciver) REFERENCES member_info(member_no)
)ENGINE InnoDB;

INSERT INTO notification (reciver, notif_content, notif_date, notif_read_status)
VALUES
(1, 'You have a new message from Alex.', '2024-12-29 10:05:00', 0),
(2, 'Your application has been accepted!', '2024-12-28 12:10:00', 1),
(3, 'Reminder: Your service is starting in 30 minutes.', '2024-12-27 11:50:00', 0),
(4, 'You have been added to a new chat room.', '2024-12-26 16:30:00', 1),
(5, 'Your service has been successfully completed.', '2024-12-25 16:20:00', 0);

CREATE TABLE areas_of_expertise(
expertise_no CHAR(5) PRIMARY KEY NOT NULL,
expertise_label VARCHAR(30) NOT NULL
)ENGINE InnoDB;

INSERT INTO areas_of_expertise (expertise_no, expertise_label)
VALUES
('SK001', 'Web Development'),
('SK002', 'Graphic Design'),
('SK003', 'Photography'),
('SK004', 'Cooking'),
('SK005', 'Basketball');

CREATE TABLE skill_deploy(
member_no INT NOT NULL,
expertise_no CHAR(5) NOT NULL,
PRIMARY KEY(member_no, expertise_no),
FOREIGN KEY (member_no) REFERENCES member_info(member_no),
FOREIGN KEY (expertise_no) REFERENCES areas_of_expertise(expertise_no)
)ENGINE InnoDB;

INSERT INTO skill_deploy (member_no, expertise_no)
VALUES
(1, 'SK001'),
(2, 'SK002'),
(3, 'SK003'),
(4, 'SK004'),
(5, 'SK005');

CREATE TABLE service_area(
area_no CHAR(5) PRIMARY KEY NOT NULL,
area_city VARCHAR(30) NOT NULL,
area_district VARCHAR(30) NOT NULL
)ENGINE InnoDB;

INSERT INTO service_area (area_no, area_city, area_district)
VALUES
('A001', 'Taipei', 'Xinyi'),
('A002', 'Kaohsiung', 'Lingya'),
('A003', 'Taichung', 'West'),
('A004', 'Tainan', 'East'),
('A005', 'Hsinchu', 'North');

CREATE TABLE area_deploy(
member_no INT NOT NULL,
area_info_no CHAR(5) NOT NULL,
PRIMARY KEY(member_no, area_info_no),
FOREIGN KEY (member_no) REFERENCES member_info(member_no),
FOREIGN KEY (area_info_no) REFERENCES service_area(area_no)
)ENGINE InnoDB;

INSERT INTO area_deploy (member_no, area_info_no)
VALUES
(1, 'A001'),
(2, 'A002'),
(3, 'A003'),
(4, 'A004'),
(5, 'A005');

-- 可預約時間已拿掉
-- CREATE TABLE booking_status(
-- member_no INT,
-- booking_date DATE,
-- booking_time VARCHAR(24),
-- PRIMARY KEY(member_no,booking_date,booking_time),
-- FOREIGN KEY (member_no) REFERENCES member_info(member_no)
-- )ENGINE InnoDB;

CREATE TABLE service(
service_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
service_poster INT NOT NULL,
sverice VARCHAR(30) NOT NULL,
servicr_detail VARCHAR(100),
service_pic VARCHAR(500),
start_time DATETIME NOT NULL,
finished_time DATETIME NOT NULL,
sverice_charge DOUBLE NOT NULL,
service_status TINYINT NOT NULL,
service_location CHAR(5),
FOREIGN KEY (service_poster) REFERENCES member_info(member_no),
FOREIGN KEY (service_location) REFERENCES service_area(area_no)
)ENGINE InnoDB;

INSERT INTO service (service_poster, sverice, servicr_detail, service_pic, start_time, finished_time, sverice_charge, service_status, service_location)
VALUES
(1, 'Website Design', 'Complete website development and design.', 'http://example.com/service1.jpg', '2024-12-30 09:00:00', '2024-12-30 18:00:00', 1000, 1, 'A001'),
(2, 'Photography', 'Professional photography for events.', 'http://example.com/service2.jpg', '2024-12-29 10:00:00', '2024-12-29 15:00:00', 500, 1, 'A002'),
(3, 'Gardening', 'Landscape gardening and design services.', 'http://example.com/service3.jpg', '2024-12-28 11:00:00', '2024-12-28 16:00:00', 300, 1, 'A003'),
(4, 'Cooking', 'Catering for events and private dinners.', 'http://example.com/service4.jpg', '2024-12-27 12:00:00', '2024-12-27 17:00:00', 700, 1, 'A004'),
(5, 'Graphic Design', 'Custom logo and branding designs.', 'http://example.com/service5.jpg', '2024-12-26 13:00:00', '2024-12-26 18:00:00', 1200, 1, 'A005');

CREATE TABLE order_list(
order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
service_idno INT,
order_person INT NOT NULL,
customer_rate INT,
customer_rate_content VARCHAR(50),
companion_rate INT,
companion_rate_content VARCHAR(50),
order_price DOUBLE NOT NULL,
order_status TINYINT,
order_poster INT,
FOREIGN KEY (service_idno) REFERENCES service(service_id),
FOREIGN KEY (order_person) REFERENCES member_info(member_no),
FOREIGN KEY (order_poster) REFERENCES member_info(member_no)
)ENGINE InnoDB;

INSERT INTO order_list (service_idno, order_person, customer_rate, customer_rate_content, companion_rate, companion_rate_content, order_price, order_status, order_poster)
VALUES
(1, 2, 5, 'Excellent service, very happy with the design.', 4, 'Great photography.', 1500, 0, 1),
(2, 3, 4, 'Good photography but could improve lighting.', 5, 'Great job on the event shoot!', 700, 1, 2),
(3, 4, 3, 'Service was okay, not as expected.', 4, 'Good gardening work.', 500, 2, 3),
(4, 5, 5, 'Delicious food, will book again.', 5, 'Food was amazing!', 900, 3, 4),
(5, 1, 5, 'Loved the logo design, very creative!', 5, 'Perfect branding work.', 1200, 1, 5);

CREATE TABLE complaint_mgmt(
order_id INT NOT NULL,
complaint INT NOT NULL,
complaint_content VARCHAR(100) NOT NULL,
complaint_date DATETIME,
resolution_status TINYINT,
closure_date DATETIME,
PRIMARY KEY (order_id,complaint),
FOREIGN KEY (order_id) REFERENCES order_list(order_id)
)ENGINE InnoDB;

INSERT INTO complaint_mgmt (order_id, complaint, complaint_content, complaint_date, resolution_status, closure_date)
VALUES
(1, 1, 'Service not completed on time.', '2024-12-30 10:30:00', 0, NULL),
(2, 2, 'The photos were not as expected.', '2024-12-29 12:20:00', 1, '2024-12-29 14:00:00'),
(3, 1, 'The gardening work was not done well.', '2024-12-28 13:30:00', 0, NULL),
(4, 1, 'Food was cold during delivery.', '2024-12-27 15:10:00', 1, '2024-12-27 16:00:00'),
(5, 2, 'Logo design was not to my liking.', '2024-12-26 17:00:00', 0, NULL);

CREATE TABLE blacklist(
user_id INT NOT NULL,
blacklist_id INT NOT NULL,
blacklist_reason VARCHAR(100),
PRIMARY KEY (user_id,blacklist_id),
FOREIGN KEY (user_id) REFERENCES member_info(member_no),
FOREIGN KEY (blacklist_id) REFERENCES member_info(member_no)
)ENGINE InnoDB;

INSERT INTO blacklist (user_id, blacklist_id, blacklist_reason)
VALUES
(1, 2, 'Unacceptable behavior during service.'),
(2, 3, 'Repeated cancellations of services.'),
(3, 4, 'Inappropriate comments during bookings.'),
(4, 5, 'Failure to follow service terms.'),
(5, 1, 'Non-payment after service completion.');

CREATE TABLE FAQ(
question VARCHAR(50),
answer VARCHAR(100)
)ENGINE InnoDB;

INSERT INTO FAQ (question, answer)
VALUES
('How do I book a service?', 'Simply select the service, choose the date and time, and confirm your booking.'),
('How can I change my profile picture?', 'Go to your profile settings and upload a new picture.'),
('How do I report a problem with my order?', 'You can file a complaint from your order details page.'),
('How can I contact customer support?', 'You can contact customer support through the app or website.'),
('What is the cancellation policy?', 'You can cancel the service up to 24 hours before the scheduled time.');

ALTER TABLE applicant
ADD FOREIGN KEY (applicant_account) REFERENCES member_info(member_no),
ADD FOREIGN KEY (service_id) REFERENCES service(service_id);

CREATE TABLE chat_room(
room_no INT PRIMARY KEY AUTO_INCREMENT,
room_user_one INT,
room_user_two INT,
FOREIGN KEY (room_user_one) REFERENCES member_info(member_no),
FOREIGN KEY (room_user_two) REFERENCES member_info(member_no)
)ENGINE InnoDB;

INSERT INTO chat_room (room_user_one, room_user_two)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);

CREATE TABLE messages(
message_no INT PRIMARY KEY AUTO_INCREMENT,
room_no INT,
sender_id INT,
message TEXT,
sent_time DATETIME,
receiver_id int,
sender_token VARCHAR(255),
receiver_token VARCHAR(255),
FOREIGN KEY (room_no) REFERENCES chat_room(room_no),
FOREIGN KEY (sender_id) REFERENCES member_info(member_no),
FOREIGN KEY (receiver_id) REFERENCES member_info(member_no),
FOREIGN KEY (sender_token) REFERENCES member_info(member_token),
FOREIGN KEY (receiver_token) REFERENCES member_info(member_token)
)ENGINE InnoDB;

INSERT INTO messages (room_no, sender_id, message, sent_time, receiver_id, sender_token, receiver_token)
VALUES
(1, 1, 'Hello, I have a question about your service.', '2024-12-29 10:10:00', 2, 'token1', 'token2'),
(2, 2, 'I am interested in your photography service.', '2024-12-28 12:15:00', 3, 'token2', 'token3'),
(3, 3, 'Can you please send me more details about your gardening service?', '2024-12-27 14:35:00', 4, 'token3', 'token4'),
(4, 4, 'Looking forward to working with you!', '2024-12-26 16:40:00', 5, 'token4', 'token5'),
(5, 5, 'Thanks for the branding, it looks great!', '2024-12-25 16:50:00', 1, 'token5', 'token1');