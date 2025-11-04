use DataManagementProject;

insert into User (user_id, first_name, mid_name, last_name, email, role, pwd_hash)
values
(1, 'Carson', 'L.', 'Chan', 'carson.chan@student.edu', 'Student', 'hash123'),
(2, 'Emily', 'A.', 'Wong', 'emily.wong@student.edu', 'Student', 'hash123'),
(3, 'Jason', 'M.', 'Lee', 'jason.lee@student.edu', 'Student', 'hash123'),
(4, 'Sophia', 'T.', 'Nguyen', 'sophia.nguyen@student.edu', 'Student', 'hash123'),
(5, 'Ethan', 'C.', 'Zhang', 'ethan.zhang@student.edu', 'Student', 'hash123'),
(6, 'Olivia', 'J.', 'Garcia', 'olivia.garcia@student.edu', 'Student', 'hash123'),
(7, 'Liam', 'H.', 'Patel', 'liam.patel@student.edu', 'Student', 'hash123'),
(8, 'Ava', 'S.', 'Kim', 'ava.kim@student.edu', 'Student', 'hash123'),
(9, 'Noah', 'R.', 'Smith', 'noah.smith@student.edu', 'Student', 'hash123'),
(10, 'Isabella', 'P.', 'Davis', 'isabella.davis@student.edu', 'Student', 'hash123'),
(11, 'William', 'B.', 'Brown', 'william.brown@student.edu', 'Student', 'hash123'),
(12, 'Mia', 'C.', 'Johnson', 'mia.johnson@student.edu', 'Student', 'hash123'),
(13, 'James', 'D.', 'Martinez', 'james.martinez@student.edu', 'Student', 'hash123'),
(14, 'Charlotte', 'K.', 'Lopez', 'charlotte.lopez@student.edu', 'Student', 'hash123'),
(15, 'Benjamin', 'N.', 'Wilson', 'benjamin.wilson@student.edu', 'Student', 'hash123'),
(16, 'Amelia', 'E.', 'Anderson', 'amelia.anderson@student.edu', 'Student', 'hash123'),
(17, 'Lucas', 'F.', 'Thomas', 'lucas.thomas@student.edu', 'Student', 'hash123'),
(18, 'Harper', 'L.', 'Taylor', 'harper.taylor@student.edu', 'Student', 'hash123'),
(19, 'Henry', 'Q.', 'Moore', 'henry.moore@student.edu', 'Student', 'hash123'),
(20, 'Evelyn', 'V.', 'Harris', 'evelyn.harris@student.edu', 'Student', 'hash123'),
(21, 'Drake', 'M.', 'Adams', 'drake.adams@faculty.edu', 'Lecturer', 'hash456'),
(22, 'Natalie', 'C.', 'Bennett', 'natalie.bennett@faculty.edu', 'Lecturer', 'hash456'),
(23, 'Samuel', 'R.', 'Clark', 'samuel.clark@faculty.edu', 'Lecturer', 'hash456'),
(24, 'Victoria', 'L.', 'Diaz', 'victoria.diaz@faculty.edu', 'Lecturer', 'hash456'),
(25, 'Andrew', 'K.', 'Evans', 'andrew.evans@faculty.edu', 'Lecturer', 'hash456'),
(26, 'Rachel', 'T.', 'Foster', 'rachel.foster@faculty.edu', 'Lecturer', 'hash456'),
(27, 'Matthew', 'J.', 'Gomez', 'matthew.gomez@faculty.edu', 'Lecturer', 'hash456'),
(28, 'Lauren', 'S.', 'Hughes', 'lauren.hughes@faculty.edu', 'Lecturer', 'hash456'),
(29, 'Christopher', 'P.', 'Ibrahim', 'christopher.ibrahim@faculty.edu', 'Lecturer', 'hash456'),
(30, 'Rebecca', 'W.', 'James', 'rebecca.james@faculty.edu', 'Lecturer', 'hash456');

insert into Course (course_id, course_name)
values 
(1, 'Algorithm'),
(2, 'Data Structure'),
(3, 'System Programming'),
(4, 'Calculus'),
(5, 'Intro to Programming');

insert into Section (section_id, course_id, instructor_id)
values
(1, 1, 21),
(2, 1, 22),
(3, 1, 23),
(1, 2, 24),
(2, 2, 25),
(1, 3, 26),
(2, 3, 21),
(1, 4, 27),
(1, 5, 28),
(2, 5, 23);
enrolls_inquiz_submission






