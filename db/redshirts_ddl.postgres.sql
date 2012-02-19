create table users (
  id serial primary key,
  role varchar(255),
  email_address varchar(255),
  password varchar(255),
  last_name varchar(255),
  first_name varchar(255)
);

create table internships (
  id serial primary key,
  student_user_id integer,
  status varchar(255),
  university_student_number varchar(255),
  number_of_credits integer,
  quarter varchar(255),
  year integer,
  sponsor_company varchar(255),
  sponsor_address varchar(255),
  project_title varchar(255),
  project_description text,
  sponsor_requested_on timestamp,
  advisor_requested_on timestamp,
  sponsor_assigned_on timestamp,
  advisor_assigned_on timestamp,
  admin_approved_on timestamp,
  employment_begin_on timestamp,
  colloquium_presentation_on timestamp,
  completed_on timestamp,
  cancelled_on timestamp
);

create table participants (
  id serial primary key,
  internship_id integer,
  user_id integer
);

create table activities (
  id serial primary key,
  internship_id integer,
  description varchar(255),
  scheduled_on timestamp, 
  completed_on timestamp
);

create table activity_comments (
  id serial primary key,
  activity_id integer,
  user_id integer,
  comment text,
  edited_on timestamp 
);

alter table internships add constraint internships_student_user_id_fk foreign key (student_user_id) references users (id);

alter table participants add constraint participant_internship_id_fk foreign key (internship_id) references internships (id);
alter table participants add constraint participant_user_id_fk foreign key (user_id) references users (id);

alter table activities add constraint activities_internship_id_fk foreign key (internship_id) references internships (id);

alter table activity_comments add constraint activity_comments_activity_fk foreign key (activity_id) references activities (id);

