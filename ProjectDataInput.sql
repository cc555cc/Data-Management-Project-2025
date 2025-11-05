use DataManagementProject;

-- add users
insert into User (user_id, first_name, mid_name, last_name, email, role, pwd_hash)
values
(1001,'Alice','M','Tan','alice.tan@student.edu','Student','hash123'),
(1002,'Ben','R','Lee','ben.lee@student.edu','Student','hash123'),
(1003,'Cindy','T','Wong','cindy.wong@student.edu','Student','hash123'),
(1004,'Daniel','J','Kim','daniel.kim@student.edu','Student','hash123'),
(1005,'Ella','L','Ng','ella.ng@student.edu','Student','hash123'),
(1006,'Frank','K','Zhao','frank.zhao@student.edu','Student','hash123'),
(1007,'Grace','A','Chow','grace.chow@student.edu','Student','hash123'),
(1008,'Henry','S','Lo','henry.lo@student.edu','Student','hash123'),
(1009,'Ivy','C','Park','ivy.park@student.edu','Student','hash123'),
(1010,'Jake','H','Lin','jake.lin@student.edu','Student','hash123'),
(2001,'Aaron','J','Wong','aaron.wong@staff.edu','TA','hash123'),
(2002,'Bella','T','Chan','bella.chan@staff.edu','TA','hash123'),
(2003,'Calvin','L','Ng','calvin.ng@staff.edu','TA','hash123'),
(2004,'Doris','R','Ho','doris.ho@staff.edu','TA','hash123'),
(2005,'Evan','S','Yip','evan.yip@staff.edu','TA','hash123'),
(3001,'Peter','V','Chan','peter.chan@faculty.edu','Lecturer','hash123'),
(3002,'Rita','X','Ho','rita.ho@faculty.edu','Lecturer','hash123'),
(3003,'Sam','Y','Chiu','sam.chiu@faculty.edu','Lecturer','hash123'),
(3004,'Tina','Z','Fung','tina.fung@faculty.edu','Lecturer','hash123'),
(3005,'Victor','B','Wu','victor.wu@faculty.edu','Lecturer','hash123');

-- add courses
insert into Course (course_id, course_name) 
values
(4001,'Software Engineering Principles'),
(4002,'Database Management Systems'),
(4003,'Web Application Development'),
(4004,'Artificial Intelligence'),
(4005,'Computer Networks');

-- add sections
insert into Section (section_id, course_id, instructor_id) 
values
(5001,4001,3001),
(5002,4001,3001),
(5003,4002,3002),
(5004,4002,3002),
(5005,4003,3003),
(5006,4003,3003),
(5007,4003,3003),
(5008,4004,3004),
(5009,4005,3005),
(5010,4005,3005);

-- add quizes
insert into Quiz (quiz_id, section_id, start_time, due_time) 
values
(6001,5001,'09:00:00','09:30:00'),
(6002,5003,'10:00:00','10:40:00'),
(6003,5005,'13:00:00','13:45:00'),
(6004,5008,'14:00:00','14:50:00'),
(6005,5009,'15:00:00','15:40:00');

-- add quiz question
insert into Quiz_Question (question_id, quiz_id, context, full_mark, correct_answer) 
values
(7001,6001,'What is software architecture?','It defines the structure and interaction of software components in a system.',2),
(7002,6001,'Explain the Model-View-Controller (MVC) pattern.','MVC separates data (Model), interface (View), and control logic (Controller) to improve modularity.',3),
(7003,6002,'What is database normalization?','A process to organize data and reduce redundancy by dividing tables logically.',2),
(7004,6002,'What is a foreign key?','A field that establishes a relationship between two tables by referencing a primary key.',2),
(7005,6003,'What is REST API?','A web architecture style that uses HTTP methods for data operations like GET, POST, PUT, DELETE.',3),
(7006,6003,'What are CRUD operations?','Create, Read, Update, Delete — the four basic database operations used in applications.',2),
(7007,6004,'What is supervised learning?','A machine learning technique where models learn from labeled training data.',3),
(7008,6004,'What is overfitting in AI?','When a model performs well on training data but poorly on unseen data.',2),
(7009,6005,'What is TCP/IP?','A protocol suite that defines how data is transmitted across networks.',3),
(7010,6005,'What is DNS and why is it important?','Domain Name System converts human-readable domain names into IP addresses.',2);

-- add quiz submissions
insert into Quiz_Submission (q_submission_id, quiz_id, student_id, grade, status) 
values
(8001,6001,1001,9,'submitted'),
(8002,6001,1002,8,'submitted'),
(8003,6002,1003,9,'submitted'),
(8004,6003,1004,7,'submitted'),
(8005,6003,1005,8,'submitted'),
(8006,6004,1006,9,'submitted'),
(8007,6005,1007,10,'submitted'),
(8008,6005,1008,8,'submitted'),
(8009,6001,1009,7,'submitted'),
(8010,6002,1010,8,'submitted'),
(8011,6003,1001,9,'submitted'),
(8012,6004,1002,8,'submitted'),
(8013,6005,1003,9,'submitted'),
(8014,6004,1004,10,'submitted'),
(8015,6001,1005,9,'submitted');

-- add question submission
insert into Question_Submission (submission_id, question_id, answer, grade)
values
(8001,7001,'Architecture defines system structure.',2),
(8001,7002,'MVC: Model-View-Controller.',3),
(8003,7003,'Normalization removes redundancy.',2),
(8003,7004,'Foreign key links tables.',3),
(8004,7005,'REST API uses HTTP requests.',2),
(8004,7006,'GET, POST, PUT, DELETE.',3),
(8006,7007,'Supervised uses labeled data.',3),
(8006,7008,'Overfitting = memorizing data.',2),
(8007,7009,'TCP/IP is the internet protocol suite.',3),
(8007,7010,'Latency is delay in data transfer.',2);

-- make announcement
insert into Announcement (announcement_id, author_id, recipient, publish_time, title, content)
values
(9001,3001,'All Students','09:00:00','Welcome','Welcome to Software Engineering!'),
(9002,3002,'Database Students','10:00:00','Quiz Reminder','Quiz on normalization this Friday.'),
(9003,3003,'Web Dev Students','11:00:00','Assignment Due','CRUD project due soon.'),
(9004,3004,'AI Students','12:00:00','Lab Update','New dataset for neural net lab.'),
(9005,3005,'Network Students','13:00:00','Exam','Midterm exam next week.');

-- add teach relationsip
insert into Teach (staff_id, section_id, course_id) 
values
(2001,5001,4001),
(2002,5002,4001),
(2003,5003,4002),
(2004,5004,4002),
(2005,5005,4003),
(3001,5001,4001),
(3001,5002,4001),
(3002,5003,4002),
(3002,5004,4002),
(3003,5005,4003),
(3003,5006,4003),
(3003,5007,4003),
(3004,5008,4004),
(3005,5009,4005),
(3005,5010,4005);

-- -add study section
insert into Study_Section (section_id, student_id, start_time, end_time, topic, ai_summary)
values
(5001,1001,'18:00:00','19:00:00','Software Design','Reviewed architecture patterns.'),
(5003,1002,'20:00:00','21:00:00','Database Normalization','Reviewed normalization and keys.');

-- add student notes
insert into Student_Notes (note_id, student_id, section_id, title, content, create_date, last_update)
values
(10001,1001,5001,'Week 1 Notes','Intro to software engineering.','2025-09-05','2025-09-06'),
(10002,1002,5003,'Normalization','Discussed 1NF–3NF.','2025-09-06','2025-09-07'),
(10003,1003,5005,'HTTP Basics','GET and POST explained.','2025-09-07','2025-09-07'),
(10004,1004,5008,'AI Overview','Neural networks basics.','2025-09-08','2025-09-08'),
(10005,1005,5009,'Networking','TCP/IP model summary.','2025-09-09','2025-09-09'),
(10006,1006,5001,'Software Req.','Use-case diagrams learned.','2025-09-10','2025-09-10'),
(10007,1007,5003,'SQL Basics','SELECT, JOIN examples.','2025-09-11','2025-09-11'),
(10008,1008,5005,'Express.js','Routing practice.','2025-09-12','2025-09-12'),
(10009,1009,5008,'Machine Learning','Supervised vs unsupervised.','2025-09-13','2025-09-13'),
(10010,1010,5009,'Routers','Routing algorithms.','2025-09-14','2025-09-14');

-- add enroll relationship
INSERT INTO Enrolls_in (student_id, section_id) VALUES
(1001,5001),
(1002,5001),
(1003,5003),
(1004,5003),
(1005,5005),
(1006,5006),
(1007,5008),
(1008,5008),
(1009,5009),
(1010,5009);

-- add calendar event
insert into Calendar_Event (event_id, user_id, event_name, start_date, end_date, description)
values
(11001,1001,'Quiz 1','2025-09-10','2025-09-10','Software Architecture Quiz'),
(11002,1002,'Study Session','2025-09-11','2025-09-11','Database review'),
(11003,1003,'Assignment 1 Due','2025-09-15','2025-09-15','Submit via portal'),
(11004,1004,'Project Meeting','2025-09-16','2025-09-16','Discuss AI proposal'),
(11005,1005,'Networking Lecture','2025-09-18','2025-09-18','TCP/IP overview'),
(11006,1006,'Midterm','2025-09-20','2025-09-20','Course midterm exam'),
(11007,1007,'Office Hours','2025-09-21','2025-09-21','TA help session'),
(11008,1008,'Presentation','2025-09-23','2025-09-23','Web dev presentation'),
(11009,1009,'Lab Work','2025-09-25','2025-09-25','Complete SQL lab'),
(11010,1010,'Final Review','2025-09-27','2025-09-27','Review before final');

-- add assignment
insert into Assignment (assignment_id, section_id, assignment_title, description, due_date, available_date)
values
(12001,5001,'Software Design Doc','Submit architecture diagram.','2025-09-20','2025-09-10'),
(12002,5003,'SQL Project','Create normalized schema.','2025-09-21','2025-09-11'),
(12003,5005,'Web App','Develop CRUD app.','2025-09-22','2025-09-12'),
(12004,5008,'AI Model','Train a neural network.','2025-09-23','2025-09-13'),
(12005,5009,'Network Config','Subnetting plan.','2025-09-24','2025-09-14');

-- add assignment submission
insert into Assignment_Submission (assignment_id, student_id, submission_time, status, grade)
values
(12001,1001,'12:00:00','submitted',9),
(12001,1002,'12:10:00','submitted',8),
(12002,1003,'12:20:00','submitted',9),
(12002,1004,'12:25:00','submitted',7),
(12003,1005,'12:30:00','submitted',8),
(12003,1006,'12:35:00','submitted',9),
(12004,1007,'12:40:00','submitted',10),
(12004,1008,'12:45:00','submitted',9),
(12005,1009,'12:50:00','submitted',9),
(12005,1010,'12:55:00','submitted',8);
