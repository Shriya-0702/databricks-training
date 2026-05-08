-- SQL JOINS ASSIGNMENT DAY 2 


-- 1

SELECT s.student_id,
       s.student_name,
       c.course_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id;


-- 2
SELECT c.course_id,
       c.course_name
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.student_id IS NULL;


-- 3

SELECT i.instructor_id,
       i.instructor_name,
       c.course_name
FROM instructors i
LEFT JOIN courses c
ON i.instructor_id = c.instructor_id;


-- 4

SELECT course_id,
       course_name
FROM courses
WHERE instructor_id IS NULL;


-- 5

SELECT s.student_id,
       s.student_name,
       e.course_id
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id;


-- 6

SELECT s.student_id,
       s.student_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
WHERE e.course_id IS NULL;


-- 7
SELECT s.student_id,
       s.student_name,
       e.course_id
FROM students s
FULL OUTER JOIN enrollments e
ON s.student_id = e.student_id;


-- 8

SELECT c.course_id,
       c.course_name
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
WHERE e.course_id IS NULL;


-- 9

SELECT i.instructor_id,
       i.instructor_name,
       c.course_id,
       c.course_name
FROM instructors i
FULL OUTER JOIN courses c
ON i.instructor_id = c.instructor_id;


-- 10.

SELECT s.student_name,
       c.course_name,
       i.instructor_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id
LEFT JOIN instructors i
ON c.instructor_id = i.instructor_id;


-- BONUS CHALLENGE


SELECT s.student_name,
       c.course_name
FROM students s
CROSS JOIN courses c;
