DROP DATABASE IF EXISTS `greenus` ;
CREATE DATABASE IF NOT EXISTS `greenus`;
USE `greenus` ;

CREATE TABLE IF NOT EXISTS user_info(
UID int(10) primary key,
acc varchar(50),
first_name varchar(50),
last_name varchar(50),
email varchar(50)
);

CREATE TABLE IF NOT EXISTS user_plants(
UID int(10) not null,
name varchar(50) primary key,
plant_id int(10)
);

CREATE TABLE IF NOT EXISTS plant_info(
ID int(10) primary key,
common_name varchar(50),
plant_types varchar(50),
difficulty varchar(20),
plant_time text,
symbol text,
image_url tinytext
);

CREATE TABLE IF NOT EXISTS plant_other_names(
plant_id int(10) not null,
other_name varchar(50), 
primary key(plant_id, other_name)
);

CREATE TABLE IF NOT EXISTS plant_instructions(
id int(10) primary key,
planting text,
watering text,
sun_req text,
pruning_training text,
propagating text,
problems text
);

alter table user_plants add constraint userid foreign key (UID) references user_info(UID);
alter table user_plants add constraint plantid foreign key (plant_id) references plant_info(ID);

alter table plant_other_names add constraint otherid foreign key (plant_id) references plant_info(ID);

alter table plant_instructions add constraint ins_id foreign key (id) references plant_info(ID);
