use datamanagementproject;

-- add users
insert into user (user_id, name, email, pwd_hash) 
values
(1001, 'Carson Chan', 'carson@student.edu', 'hash1'),
(1002, 'Emily Wong', 'emily@student.edu', 'hash2'),
(1003, 'Jason Lee', 'jason@student.edu', 'hash3'),
(1004, 'Sophia Nguyen', 'sophia@student.edu', 'hash4'),
(1005, 'Ethan Zhang', 'ethan@student.edu', 'hash5');

-- add courses
insert into course (course_id,course_name)
values
(2001, 'Software Engineering'),
(2002, 'Database Systems'),
(2003, 'Operating Systems'),
(2004, 'Data Structures'),
(2005, 'Web Development'),
(2006, 'Artificial Intelligence'),
(2007, 'Computer Networks'),
(2008, 'Human Computer Interaction');

-- add ai summary
insert into summary (sum_id, user_id, course_id, date_created, file_url)
values
(3001, 1001, 2002, '2025-10-10 10:00:00', 'summary1.pdf'),
(3002, 1001, 2004, '2025-10-12 11:30:00', 'summary2.pdf'),
(3003, 1002, 2001, '2025-10-14 09:00:00', 'summary3.pdf'),
(3004, 1003, 2006, '2025-10-16 13:15:00', 'summary4.pdf'),
(3005, 1004, 2005, '2025-10-20 14:30:00', 'summary5.pdf');

-- add quizzes
insert into quiz (quiz_id, user_id, course_id, time_spent, date)
values
(4001, 1001, 2002, '00:25:00', '2025-10-11 09:00:00'),
(4002, 1002, 2003, '00:30:00', '2025-10-15 14:00:00'),
(4003, 1003, 2006, '00:27:00', '2025-10-19 10:30:00'),
(4004, 1004, 2005, '00:20:00', '2025-10-21 15:00:00'),
(4005, 1005, 2004, '00:22:00', '2025-10-23 11:00:00');

-- add quiz questions
insert into quiz_question (question_id, quiz_id, question, user_answer, correct_answer, full_mark, grade) 
values
(5001,4001,'What is SQL?','Structured Query Language','Structured Query Language',5,5),
(5002,4001,'What is a table?','Data structure','Data structure',5,4),
(5003,4001,'What is a schema?','Database structure','Database structure',5,5),
(5004,4002,'Define process.','Running program','Running program',5,5),
(5005,4002,'What is thread?','Lightweight process','Lightweight process',5,4),
(5006,4002,'Define deadlock.','Waiting forever','Waiting forever',5,5),
(5007,4003,'Define AI.','Machine intelligence','Machine intelligence',5,5),
(5008,4003,'What is ML?','Learning from data','Learning from data',5,5),
(5009,4003,'Define dataset.','Collection of data','Collection of data',5,4),
(5010,4004,'Define HTML.','Markup language','Markup language',5,5),
(5011,4004,'Define CSS.','Styling language','Styling language',5,4),
(5012,4004,'Define JS.','Programming language','Programming language',5,5),
(5013,4005,'Define stack.','LIFO structure','LIFO structure',5,5),
(5014,4005,'Define queue.','FIFO structure','FIFO structure',5,5),
(5015,4005,'Define linked list.','Nodes with pointers','Nodes with pointers',5,4);

-- add course work
insert into course_work (cw_id, user_id, course_id, cw_title, cw_type, description, due_date, grade) 
values
(6001, 1001, 2002, 'Database Report', 'assignment', 'Write a short report on normalization and examples.', '2025-11-10 23:59:00', 92),
(6002, 1002, 2003, 'OS Midterm', 'midterm', 'Midterm test on CPU scheduling and synchronization.', '2025-11-13 10:00:00', 85),
(6003, 1003, 2006, 'AI Quiz', 'quiz', 'Short quiz on neural networks and ethics.', '2025-11-15 14:00:00', 88),
(6004, 1004, 2005, 'Web Project', 'project', 'Design a responsive website using Flexbox.', '2025-11-17 23:59:00', 91),
(6005, 1005, 2004, 'Data Structures Assignment', 'assignment', 'Implement and analyze stack operations.', '2025-11-19 23:59:00', 90);

-- add study section
insert into study_section (section_id, user_id, start_time, end_time)
values
(7001,1001,'2025-10-31 09:00:00','2025-10-31 11:00:00'),
(7002,1002,'2025-11-01 10:00:00','2025-11-01 11:30:00'),
(7003,1003,'2025-11-02 13:00:00','2025-11-02 15:00:00'),
(7004,1004,'2025-11-03 14:00:00','2025-11-03 15:30:00'),
(7005,1005,'2025-11-04 09:00:00','2025-11-04 10:00:00');

-- add notes
insert into student_notes (note_id, user_id, course_id, title, content, created_date, last_update) 
values
(8001,1001,2001,'Intro to SE','Software development lifecycle','2025-10-25 09:00:00','2025-10-26 10:00:00'),
(8002,1001,2002,'SQL Basics','Introduction to SQL and queries','2025-10-26 13:00:00','2025-10-27 14:00:00'),
(8003,1002,2003,'Processes','Process scheduling basics','2025-10-27 09:00:00','2025-10-27 10:00:00'),
(8004,1003,2006,'AI Overview','Fundamentals of Artificial Intelligence','2025-10-29 09:00:00','2025-10-30 09:00:00'),
(8005,1004,2005,'HTML Basics','Tags, elements, and structure','2025-10-28 15:00:00','2025-10-28 16:00:00');

-- add calendar events
insert into calendar_event (event_id, user_id, event_name, start_date, end_date, description) 
values
(9001,1001,'Study Database','2025-11-06 10:00:00','2025-11-06 12:00:00','Review normalization'),
(9002,1001,'Quiz Prep','2025-11-07 14:00:00','2025-11-07 15:00:00','Prepare for SQL quiz'),
(9003,1002,'Assignment Work','2025-11-06 13:00:00','2025-11-06 15:00:00','Work on OS assignment'),
(9004,1002,'Lecture Review','2025-11-07 16:00:00','2025-11-07 17:00:00','Review lecture slides'),
(9005,1003,'Coding Practice','2025-11-08 11:00:00','2025-11-08 13:00:00','Practice Python for AI');


-- add ai query
insert into ai_query (query_id, user_id, context, response, date)
values
(10001,1001,'Explain normalization','It organizes data efficiently','2025-10-10 09:00:00'),
(10002,1002,'Explain process scheduling','It decides which process runs next','2025-10-12 10:00:00'),
(10003,1003,'Summarize AI','AI simulates human intelligence','2025-10-15 13:00:00'),
(10004,1004,'Explain HTML tags','Tags define elements in HTML','2025-10-18 16:00:00'),
(10005,1005,'Explain queues','Queues follow FIFO structure','2025-10-22 13:00:00');

-- add performance stats
insert into performance_stat (stat_id, user_id, metric_type, value, record_time)
values
(11001,1001,'StudyHours',5,'2025-11-05 20:00:00'),
(11002,1002,'StudyHours',3,'2025-11-05 19:30:00'),
(11003,1003,'StudyHours',4,'2025-11-05 21:00:00'),
(11004,1004,'StudyHours',6,'2025-11-06 19:00:00'),
(11005,1005,'StudyHours',2,'2025-11-06 20:00:00');

-- add event tag
insert into event_tag (tag_id, event_id, tag_name)
values
(12001, 9001, 'study'),
(12002, 9002, 'study'),
(12003, 9002, 'quiz'),
(12004, 9003, 'assignment'),
(12005, 9004, 'study');


-- additional entries for view testing
insert into course_work (cw_id, user_id, course_id, cw_title, cw_type, description, due_date, grade) 
values
(6006, 1001, 2001, 'Software Design Project', 'project', 'Develop a mini software application demonstrating design patterns.', '2025-11-25 23:59:00', 93),
(6007, 1001, 2001, 'Software Requirements Report', 'assignment', 'Write a detailed requirements document for a small system.', '2025-11-22 23:59:00', 90),
(6008, 1001, 2002, 'SQL Optimization Quiz', 'quiz', 'Quiz on query optimization and indexing techniques.', '2025-11-18 10:00:00', 88),
(6009, 1001, 2002, 'ER Diagram Lab', 'assignment', 'Design and document an ER diagram for an online store database.', '2025-11-20 23:59:00', 94);


