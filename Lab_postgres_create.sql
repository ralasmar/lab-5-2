CREATE TABLE User (
	user_id SERIAL NOT NULL,
	username VARCHAR(255) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
);


CREATE TABLE Group_Comment (
	group_comment_id SERIAL NOT NULL,
	group_id INTEGER NOT NULL REFERENCES groups(group_id)
	group_users_id INTEGER NOT NULL REFERENCES group_users(group_users_id),
	body TEXT NOT NULL,
);



CREATE TABLE groups (
	group_id SERIAL NOT NULL,
);



CREATE TABLE follows (
	follow_id SERIAL NOT NULL REFERENCES User(user_id);,
	follower INTEGER NOT NULL,
	following INTEGER NOT NULL,
);



CREATE TABLE Occasions (
	occasion_id SERIAL NOT NULL,
	occasion_name VARCHAR(255) NOT NULL REFERENCES Recipe(recipe_id),
	recipe_id INTEGER NOT NULL,
);



CREATE TABLE Grocery_List (
	grocery_list_id SERIAL NOT NULL,
	ingredient_id INTEGER NOT NULL REFERENCES ingredients(ingredient_id),
	user_id INTEGER NOT NULL REFERENCES User(user_id),
);



CREATE TABLE Recipe (
	recipe_id SERIAL NOT NULL,
	instructions TEXT NOT NULL,
	img_url TEXT NOT NULL,
	user_id INTEGER NOT NULL REFERENCES User(user_id),

);



CREATE TABLE ingredients (
	ingredient_id SERIAL NOT NULL,
	name TEXT NOT NULL,
	img_url TEXT NOT NULL,
	ingredient_price FLOAT NOT NULL,
	recipe_id INTEGER NOT NULL REFERENCES Recipe(recipe_id),

);



CREATE TABLE Comment (
	comment_id SERIAL NOT NULL,
	body TEXT NOT NULL,
	user_id INTEGER NOT NULL REFERENCES User(user_id),
	recipe_id INTEGER NOT NULL REFERENCES Recipe(recipe_id),

);



CREATE TABLE Auth (
	auth_id SERIAL NOT NULL,
	user_id INTEGER NOT NULL REFERENCES User(user_id),
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,

);



CREATE TABLE Group_Recipe (
	group_recipe_id SERIAL NOT NULL,
	group_id INTEGER NOT NULL REFERENCES groups(group_id),
	recipe_poster INTEGER NOT NULL REFERENCES group_users(group_users_id),
	img_url TEXT NOT NULL,
	instructions TEXT NOT NULL,
);



CREATE TABLE group_users (
	group_users_id INTEGER NOT NULL,
	group_id INTEGER NOT NULL REFERENCES groups(group_id),
	user_id INTEGER NOT NULL REFERENCES User(user_id)
);















