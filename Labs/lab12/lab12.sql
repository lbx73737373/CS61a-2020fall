.read data.sql


CREATE TABLE bluedog AS
  SELECT color AS color, pet AS pet 
  FROM students
  WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color AS color, pet AS pet, song AS songs
  FROM students
  WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE smallest_int AS
  SELECT time AS time, smallest AS smallest
  FROM students
  WHERE smallest > 2
  ORDER BY smallest
  LIMIT 20;

CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color
  FROM students AS a, students AS b
  WHERE a.pet = b.pet AND a.song = b.song AND a.time < b.time;

CREATE TABLE sevens AS
  SELECT students.seven
  FROM students, numbers
  WHERE students.number = 7 AND students.time = numbers.time AND numbers.'7' = 'True';
  
