CREATE DATABASE INSTAGRAM_CLONE;
USE INSTAGRAM_CLONE;

-- USERS TABLE: Stores the core profile information for everyone on the platform.
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,     
    username VARCHAR(255) UNIQUE NOT NULL,     
    created_at TIMESTAMP DEFAULT NOW()         
);

-- PHOTOS TABLE: Stores the posts uploaded by users.
CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,     
    image_url VARCHAR(255) NOT NULL,           
    user_id INTEGER NOT NULL,                 
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)  
);

-- COMMENTS TABLE: Stores text replies on photos.
CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,        
    photo_id INTEGER NOT NULL,                 
    user_id INTEGER NOT NULL,                  
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- LIKES TABLE: Tracks which users liked which photos.
CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)             
);

-- FOLLOWS TABLE: Tracks the follower/following network.
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,              
    followee_id INTEGER NOT NULL,              
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)      
);

-- TAGS TABLE: A master list of all unique hashtags used on the platform.
CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,                
  created_at TIMESTAMP DEFAULT NOW()
);

-- PHOTO_TAGS TABLE: A mapping table connecting photos to hashtags.
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)             
);



