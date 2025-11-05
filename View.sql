use datamanagementproject;

-- View 8:
create view user_accumulated_study_time as
select u.user_id, u.name , sum(timestampdiff(minute, ss.start_time, ss.end_time))/60 as time_accumulated_in_hour
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



insert into event_tag (tag_id, event_id, tag_name)
values
(12006,9006,'assignment'),
(12007,9007,'project');

select * from user_1001_assignment_or_quiz_tag;
 drop view if exists assignment_or_quiz_tag;

    