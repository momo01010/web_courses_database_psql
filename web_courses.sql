CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "description" varchar NOT NULL
);

CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar(30) NOT NULL,
  "email" varchar(30) UNIQUE NOT NULL,
  "password" varchar(30) NOT NULL,
  "age" varchar NOT NULL,
  "role_id" int NOT NULL
);

CREATE TABLE "level" (
  "id" serial PRIMARY KEY,
  "name" varchar(30) NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "title" varchar NOT NULL,
  "teacher_id" int NOT NULL,
  "description" varchar NOT NULL,
  "level_id" int NOT NULL,
  "category_id" int NOT NULL
);

CREATE TABLE "user_course" (
  "id" serial NOT NULL,
  "description" varchar NOT NULL,
  "course_id" int NOT NULL,
  "user_id" int NOT NULL
);

CREATE TABLE "course_video" (
  "id" serial PRIMARY KEY,
  "course_id" int NOT NULL,
  "title" varchar(50) NOT NULL,
  "url_video" varchar NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "level" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "user_course" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");
web_courses
ALTER TABLE "user_course" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

-- Inserting roles
INSERT INTO roles (name, description) VALUES ('student', 'Person who studies in the educational center.'), ('teacher', 'a person who teaches, especially in a school.');
INSERT INTO roles (name, description) VALUES ('admin','the administration of a business, organization, etc.');


-- Inserting users
INSERT INTO users (name, email, password, age, role_id) VALUES ('Ada', 'ada@gmail.com', '112233', '47', 1);
INSERT INTO users (name, email, password, age, role_id) VALUES ('Kino', 'kino@gmail.com', '9988776', '13', 1), ('Maya', 'maya@gmail.com', '345789', '58', 2), ('Scratch', 'scratch@gmail.com', '48346854', '35', 3); 
INSERT INTO users (name, email, password, age, role_id) VALUES ('Guillermo', 'gui@gmail.com', '211234433', '32', 2), ('Marta', 'marta@gmail.com', '87430548', '45', 2);

-- Inserting levels
INSERT INTO level (name)  VALUES ('beginners'), ('intermediate'), ('advanced');

-- Inserting categories
INSERT INTO categories (title) VALUES ('technologie'), ('languages'), ('maths'), ('sports'), ('marketing');

--Inserting courses
INSERT INTO courses (title, teacher_id, description, level_id, category_id) VALUES ('mathematics for beginners', 3, 'basic mathematics', 1, 3);
INSERT INTO courses (title, teacher_id, description, level_id, category_id) VALUES ('volleyballs', 5, 'beach volleyball', 2, 4), ('german', 6, 'german c2', 3, 2);

--Inserting course_video
INSERT INTO course_video (course_id, title, url_video) VALUES (1, 'first lesson of fractions', 'https://youtu.be/-shj9cJlXuE'), (3, 'speaking practice', 'https://www.youtube.com/watch?v=6qFTBnkNB6o');

--Inserting user_course
 INSERT INTO user_course (description, course_id, user_id) VALUES ('first time studying', 3, 1), ('second time stuying', 1, 2);

