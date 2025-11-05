use datamanagementproject;

-- add users
insert into User (user_id, name, email, pwd_hash) 
values
(1, 'Carson Chan', 'carson@student.edu', 'hash1'),
(2, 'Emily Wong', 'emily@student.edu', 'hash2'),
(3, 'Jason Lee', 'jason@student.edu', 'hash3'),
(4, 'Sophia Nguyen', 'sophia@student.edu', 'hash4'),
(5, 'Ethan Zhang', 'ethan@student.edu', 'hash5'),
(6, 'Olivia Brown', 'olivia@student.edu', 'hash6'),
(7, 'Liam Davis', 'liam@student.edu', 'hash7'),
(8, 'Ava Patel', 'ava@student.edu', 'hash8'),
(9, 'Noah Garcia', 'noah@student.edu', 'hash9'),
(10, 'Mia Johnson', 'mia@student.edu', 'hash10');

-- add courses
insert into Course (course_id, course_name)
values
(1, 'Software Engineering'),
(2, 'Database Systems'),
(3, 'Operating Systems'),
(4, 'Data Structures'),
(5, 'Web Development'),
(6, 'Computer Networks'),
(7, 'Artificial Intelligence'),
(8, 'Machine Learning'),
(9, 'Discrete Math'),
(10, 'Cybersecurity'),
(11, 'Cloud Computing'),
(12, 'Human Computer Interaction'),
(13, 'Mobile App Dev'),
(14, 'System Design'),
(15, 'Data Science');

-- add ai summary
insert into Summary (sum_id, user_id, course_id, date_created, file_url)
values
(1, 1, 2, '2025-10-10 10:00:00', 'summary1.pdf'),
(2, 1, 4, '2025-10-12 11:30:00', 'summary2.pdf'),
(3, 2, 1, '2025-10-14 09:00:00', 'summary3.pdf'),
(4, 3, 7, '2025-10-16 13:15:00', 'summary4.pdf'),
(5, 3, 8, '2025-10-18 16:00:00', 'summary5.pdf'),
(6, 4, 5, '2025-10-20 14:30:00', 'summary6.pdf'),
(7, 5, 6, '2025-10-22 08:45:00', 'summary7.pdf'),
(8, 7, 3, '2025-10-24 15:10:00', 'summary8.pdf'),
(9, 8, 10, '2025-10-26 17:20:00', 'summary9.pdf'),
(10, 10, 12, '2025-10-28 19:00:00', 'summary10.pdf');

-- add quizzes
insert into Quiz (quiz_id, user_id, course_id, time_spent, date)
values
(1, 1, 2, '00:25:00', '2025-10-11 09:00:00'),
(2, 1, 4, '00:18:00', '2025-10-13 10:00:00'),
(3, 2, 3, '00:30:00', '2025-10-15 14:00:00'),
(4, 3, 1, '00:22:00', '2025-10-17 09:30:00'),
(5, 3, 7, '00:27:00', '2025-10-19 10:30:00'),
(6, 4, 5, '00:20:00', '2025-10-21 15:00:00'),
(7, 6, 6, '00:35:00', '2025-10-23 11:00:00'),
(8, 8, 9, '00:21:00', '2025-10-25 13:00:00'),
(9, 9, 10, '00:28:00', '2025-10-27 16:00:00'),
(10, 10, 12, '00:24:00', '2025-10-29 09:00:00');

-- add quiz question
insert into Quiz_Question (question_id, quiz_id, question, user_answer, correct_answer, full_mark, grade) 
values
(1,1,'What is SQL?','Structured Query Language','Structured Query Language',5,5),
(2,1,'What is a table?','Data structure','Data structure',5,5),
(3,1,'What is a schema?','Database structure','Database structure',5,4),

(4,2,'Define stack.','LIFO structure','LIFO structure',5,5),
(5,2,'What is queue?','FIFO structure','FIFO structure',5,5),
(6,2,'Define linked list.','Nodes with pointers','Nodes with pointers',5,4),

(7,3,'What is process?','Running program','Running program',5,5),
(8,3,'What is thread?','Lightweight process','Lightweight process',5,5),
(9,3,'Define deadlock.','Waiting forever','Waiting forever',5,4),

(10,4,'What is AI?','Machine intelligence','Machine intelligence',5,5),
(11,4,'What is ML?','Learning from data','Learning from data',5,4),
(12,4,'Define dataset.','Collection of data','Collection of data',5,5),

(13,5,'What is function?','Reusable code','Reusable code',5,5),
(14,5,'What is loop?','Repetition structure','Repetition structure',5,5),
(15,5,'Define recursion.','Function calling itself','Function calling itself',5,4),

(16,6,'Define HTTP.','Protocol','Protocol',5,5),
(17,6,'Define API.','Application interface','Application interface',5,5),
(18,6,'Define JSON.','Data format','Data format',5,4),

(19,7,'Define IP.','Internet Protocol','Internet Protocol',5,5),
(20,7,'Define DNS.','Domain Name System','Domain Name System',5,5),
(21,7,'Define TCP.','Transmission Control Protocol','Transmission Control Protocol',5,4),

(22,8,'Define variable.','Container for value','Container for value',5,5),
(23,8,'Define constant.','Fixed value','Fixed value',5,5),
(24,8,'Define array.','List structure','List structure',5,4),

(25,9,'Define cybersecurity.','Protection from attacks','Protection from attacks',5,5),
(26,9,'Define malware.','Malicious software','Malicious software',5,5),
(27,9,'Define firewall.','Network protection','Network protection',5,5),

(28,10,'Define HCI.','Human Computer Interaction','Human Computer Interaction',5,5),
(29,10,'Define usability.','Ease of use','Ease of use',5,4),
(30,10,'Define interface.','User interaction point','User interaction point',5,5);

-- add assignment
insert into assignment (assignment_id, user_id, course_id, assignment_title, description, due_date, grade) 
values
(1, 1, 1, 'Database Project', 'Design ER diagram', '2025-11-05 23:59:00', 90),
(2, 2, 3, 'OS Lab', 'Thread synchronization', '2025-11-06 23:59:00', 80),
(3, 3, 5, 'Web App', 'React frontend', '2025-11-07 23:59:00', 85),
(4, 4, 7, 'AI Essay', 'Discuss AI ethics', '2025-11-08 23:59:00', 92),
(5, 5, 6, 'Networking Task', 'Packet analysis', '2025-11-09 23:59:00', 88),
(6, 6, 10, 'Security Review', 'Firewall setup', '2025-11-10 23:59:00', 91),
(7, 8, 12, 'HCI Design', 'UI prototype', '2025-11-11 23:59:00', 84),
(8, 10, 15, 'Data Science Report', 'Analyze dataset', '2025-11-12 23:59:00', 95);

-- add study section
insert into study_section (section_id, user_id, start_time, end_time)
values
(2,2,'2025-10-31 10:00:00','2025-10-31 11:30:00'),
(3,3,'2025-10-31 14:00:00','2025-10-31 16:00:00'),
(4,4,'2025-11-01 13:00:00','2025-11-01 15:00:00'),
(5,5,'2025-11-02 09:30:00','2025-11-02 10:30:00'),
(6,6,'2025-11-02 14:00:00','2025-11-02 15:00:00'),
(7,7,'2025-11-03 10:00:00','2025-11-03 12:00:00'),
(8,8,'2025-11-03 13:00:00','2025-11-03 15:00:00'),
(9,9,'2025-11-04 15:00:00','2025-11-04 17:00:00'),
(10,10,'2025-11-04 09:00:00','2025-11-04 10:30:00'),
(11,1,'2025-11-05 10:00:00','2025-11-05 11:00:00'),
(12,5,'2025-11-05 14:00:00','2025-11-05 15:00:00');

-- add notes
insert into student_notes (note_id, user_id, course_id, title, content, created_date, last_update) 
values
(1,1,1,'Intro to DB','Database basics','2025-10-25 09:00:00','2025-10-26 10:00:00'),
(2,1,2,'SQL Joins','Inner/Outer Join examples','2025-10-26 13:00:00','2025-10-27 14:00:00'),
(3,2,3,'Process Mgmt','CPU scheduling','2025-10-27 09:00:00','2025-10-27 10:00:00'),
(4,3,5,'HTML Basics','Tags and structure','2025-10-28 15:00:00','2025-10-28 16:00:00'),
(5,3,7,'AI Overview','What is AI?','2025-10-29 09:00:00','2025-10-30 09:00:00'),
(6,4,10,'Cybersecurity','Network protection','2025-10-30 14:00:00','2025-10-31 15:00:00'),
(7,5,12,'UI Principles','Design heuristics','2025-10-31 09:00:00','2025-11-01 10:00:00'),
(8,6,15,'Data Science','Regression basics','2025-11-01 11:00:00','2025-11-02 11:00:00'),
(9,8,8,'ML Models','Linear regression','2025-11-02 12:00:00','2025-11-03 13:00:00'),
(10,10,9,'Discrete Math','Logic gates','2025-11-03 14:00:00','2025-11-04 15:00:00');

-- add calendar event
insert into calendar_event (event_id, user_id, event_name, start_date, end_date, description) 
values
(1,1,'Study Database','2025-11-06 10:00:00','2025-11-06 12:00:00','ER diagram review'),
(2,1,'Quiz Prep','2025-11-07 14:00:00','2025-11-07 15:00:00','Review SQL questions'),
(3,2,'Assignment Work','2025-11-06 13:00:00','2025-11-06 15:00:00','OS assignment'),
(4,2,'Lecture Review','2025-11-07 16:00:00','2025-11-07 17:00:00','Review notes'),
(5,3,'Coding Practice','2025-11-05 11:00:00','2025-11-05 13:00:00','Web app practice'),
(6,3,'Team Meeting','2025-11-08 18:00:00','2025-11-08 19:00:00','Discuss project'),
(7,4,'AI Reading','2025-11-09 09:00:00','2025-11-09 11:00:00','Read AI papers'),
(8,4,'Essay Writing','2025-11-10 14:00:00','2025-11-10 15:30:00','Ethics essay draft'),
(9,5,'Review Session','2025-11-06 12:00:00','2025-11-06 14:00:00','Network review'),
(10,5,'Test Prep','2025-11-07 10:00:00','2025-11-07 11:30:00','Firewall notes'),
(11,6,'Study Time','2025-11-08 13:00:00','2025-11-08 14:30:00','Security quiz'),
(12,6,'Read Paper','2025-11-09 09:00:00','2025-11-09 10:00:00','Cloud system research'),
(13,7,'Practice Quiz','2025-11-09 10:00:00','2025-11-09 11:00:00','Self test'),
(14,7,'Note Review','2025-11-10 12:00:00','2025-11-10 13:00:00','Review notes'),
(15,8,'Work Session','2025-11-11 10:00:00','2025-11-11 12:00:00','ML practice'),
(16,8,'Cleanup Notes','2025-11-12 09:00:00','2025-11-12 10:00:00','Organize notes'),
(17,9,'Plan Review','2025-11-12 10:00:00','2025-11-12 11:00:00','Planning task'),
(18,9,'Study Night','2025-11-13 19:00:00','2025-11-13 21:00:00','Long study'),
(19,10,'Data Review','2025-11-14 09:00:00','2025-11-14 10:00:00','Data science review'),
(20,10,'Summary Update','2025-11-14 11:00:00','2025-11-14 12:00:00','Summaries update');

-- add ai query
insert into ai_query (query_id, user_id, context, response, date)
values
(1,1,'Summarize DB normalization','Normalization reduces redundancy','2025-10-10 09:00:00'),
(2,1,'Explain primary key','Unique identifier','2025-10-12 10:00:00'),
(3,2,'Explain process scheduling','CPU scheduling overview','2025-10-14 11:00:00'),
(4,3,'Generate quiz on AI','AI quiz created','2025-10-15 13:00:00'),
(5,3,'Explain neural networks','Neural nets process layers','2025-10-17 14:00:00'),
(6,4,'Summarize security threats','Malware, phishing, DoS','2025-10-18 16:00:00'),
(7,5,'Generate study plan','Study plan created','2025-10-20 10:00:00'),
(8,7,'Summarize ML concepts','Supervised vs unsupervised','2025-10-21 12:00:00'),
(9,9,'Explain recursion','Function calling itself','2025-10-22 13:00:00'),
(10,10,'Suggest study schedule','2-hour daily plan','2025-10-24 15:00:00');

-- add stat
insert into performance_stat (stat_id, user_id, metric_type, value, record_time)
values
(1,1,'StudyHours',5,'2025-11-05 20:00:00'),
(2,2,'StudyHours',3,'2025-11-05 19:30:00'),
(3,3,'StudyHours',4,'2025-11-05 21:00:00'),
(4,4,'StudyHours',6,'2025-11-06 19:00:00'),
(5,5,'StudyHours',2,'2025-11-06 20:00:00'),
(6,6,'StudyHours',5,'2025-11-07 18:00:00'),
(7,7,'StudyHours',4,'2025-11-07 21:00:00'),
(8,8,'StudyHours',3,'2025-11-08 22:00:00'),
(9,9,'StudyHours',6,'2025-11-08 19:30:00'),
(10,10,'StudyHours',5,'2025-11-09 20:00:00');

