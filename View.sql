use datamanagementproject;

-- view 1:
Create View quiz_question_details as
Select qq.question_id, qq.quiz_id, q.user_id, 
u.name as user_name, q.course_id, c.course_name, qq.question,
qq.user_answer, qq.grade, q.date as quiz_date
From quiz_question qq
Join quiz q on qq.quiz_id = q.quiz_id
Join user u on q.user_id = u.user_id
Join course c on q.course_id = c.course_id;

-- view 2:
create view all_user_top_Quizzes as
select
	qz.user_id ,
    qz.quiz_id,
    sum(qq.grade) as quiz_grade
from quiz qz
join quiz_question qq on qq.quiz_id = qz.quiz_id
group by qz.quiz_id, qz.user_id
having
sum(qq.grade) >= all (  -- comapre the selected quiz grade to all recorded quiz grade
	select sum(qqi.grade) -- get the grades of quiz from one user
    from quiz_question qqi 
    join quiz qzi on qqi.quiz_id = qzi.quiz_id
    where qzi.user_id = qz.user_id
    group by qzi.quiz_id
);

-- view 3:
Create View user_section_compare_average_time as
Select u.user_id, u.name, s.section_id, s.start_time, s.end_time,
Case when 
	Timestampdiff(minute, s.start_time, s.end_time) > (
	Select AVG(Timestampdiff(minute, si.start_time, si.end_time))
	From study_section si
	Where si.user_id = u.user_id)Then 'Above Average'
	Else 'Below Average'
End as comparison_to_avg
From user u
Join study_section s on s.user_id = u.user_id;

-- view 4:
Create View user_performance_full as
Select u.user_id, u.name, ps.stat_id, ps.metric_type, ps.value, ps.record_time
From user u
left Join performance_stat ps On u.user_id = ps.user_id -- full join not accepted, use union instead
union
Select u.user_id, u.name, ps.stat_id, ps.metric_type, ps.value, ps.record_time
from user u
right join performance_stat ps on u.user_id = ps.user_id;

-- view 5:
CREATE OR REPLACE VIEW v_failed_quizzes_same_course AS
SELECT
    q.quiz_id,
    q.user_id,
    u.name AS user_name,
    q.course_id,
    c.course_name,
    AVG(qq.grade) AS avg_grade,
    q.date AS quiz_date
FROM 
    quiz q
JOIN 
    quiz_question qq ON q.quiz_id = qq.quiz_id
JOIN 
    user u ON u.user_id = q.user_id
JOIN 
    course c ON c.course_id = q.course_id
WHERE 
    (q.user_id, q.course_id) IN (
        SELECT user_id, course_id
        FROM quiz
        GROUP BY user_id, course_id
        HAVING COUNT(*) > 1
    )
GROUP BY 
    q.quiz_id, q.user_id, u.name, q.course_id, c.course_name, q.date
HAVING 
    AVG(qq.grade) < 50
ORDER BY 
    u.name, c.course_name, q.date;
    
-- view 6:
CREATE OR REPLACE VIEW v_assignments_due_within_week AS
SELECT cw.cw_id,
       cw.user_id,
       u.name               AS user_name,
       cw.course_id,
       c.course_name,
       cw.cw_title,
       cw.cw_type,
       cw.description,
       cw.due_date,
       cw.grade
FROM course_work cw
JOIN user   u ON u.user_id   = cw.user_id
JOIN course c ON c.course_id = cw.course_id
WHERE cw.due_date >= NOW()
  AND cw.due_date <  DATE_ADD(NOW(), INTERVAL 7 DAY)
ORDER BY cw.due_date;

-- view 7:
CREATE OR REPLACE VIEW vw_open_learning_items AS
SELECT *
FROM (
    SELECT
        cw.user_id,
        cw.course_id,
        'COURSE_WORK' AS item_type,
        cw.cw_title   AS title,
        cw.due_date   AS when_at
    FROM course_work cw
    WHERE cw.due_date IS NOT NULL
      AND (cw.grade IS NULL)
    UNION ALL
    SELECT
        q.user_id,
        q.course_id,
        'QUIZ'        AS item_type,
        CONCAT('Quiz #', q.quiz_id) AS title,
        q.date      AS when_at
    FROM quiz q
    UNION ALL
    SELECT
        ss.user_id,
        NULL          AS course_id,
        'STUDY_SECTION' AS item_type,
        CONCAT('Study Section #', ss.section_id) AS title,
        ss.start_time AS when_at
    FROM study_section ss
    WHERE ss.start_time IS NOT NULL
) AS items
WHERE items.when_at BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 30 DAY)
ORDER BY items.user_id, items.when_at;

-- View 8:
create view user_accumulated_study_time as
select u.user_id, u.name , sum(timestampdiff(minute, ss.start_time, ss.end_time))/60 as time_accumulated_in_hour -- get the time different of each section, then add them up
from User u 
join study_section ss on u.user_id = ss.user_id
group by u.user_id, u.name;

-- view 9:
create view user_1001_assignment_or_quiz_tag as
select ce.event_name, ce.start_date, ce.end_date, ce.description
from user u 
join calendar_event ce on ce.user_id = u.user_id
join event_tag et on et.event_id = ce.event_id
where et.tag_name in ('assignment','quiz') and u.user_id = '1001';

-- view 10:
create view user_1001_courses_average as
select c.course_name, avg(cw.grade) as average_course_grade
from user u
join course_work cw on cw.user_id = u.user_id
join course c on c.course_id = cw.course_id
where u.user_id = 1001
group by c.course_name;



    