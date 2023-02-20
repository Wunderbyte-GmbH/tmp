SELECT
    u.id AS user_id,
    u.firstname AS first_name,
    u.lastname AS last_name,
    c.fullname AS course_name,
    CASE WHEN cc.id IS NOT NULL THEN 'Completed' ELSE 'Not Completed' END AS completion_status,
    cc.timecompleted AS completion_date
FROM
    mdl_user u
JOIN
    mdl_user_enrolments ue ON ue.userid = u.id
JOIN
    mdl_enrol e ON e.id = ue.enrolid
JOIN
    mdl_course c ON c.id = e.courseid
LEFT JOIN
    mdl_course_completions cc ON cc.userid = u.id AND cc.course = c.id
WHERE
    c.id = 'your_course_id';

