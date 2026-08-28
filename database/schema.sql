
----------- USER TABLE ------------

CREATE TABLE User(
user_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(200) NOT NULL,
email VARCHAR(200) NOT NULL,
password VARCHAR(200) NOT NULL,
created_at  DATETIME DEFAULT CURRENT_TIMESTAMP
);

----------- ALBUM TABLE ------------

CREATE TABLE Album 
(
album_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
album_name VARCHAR(300) NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY(user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

------------ MEDIA TABLE ------------  

CREATE TABLE Media
(
media_id INT PRIMARY KEY,
user_id INT NOT NULL,
album_id INT,
media_name VARCHAR(200) NOT NULL,
media_type ENUM('Image','Video') NOT NULL,
file_path VARCHAR(500) NOT NULL,
file_size BIGINT,
created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
FOREIGN KEY(album_id) REFERENCES Album(album_id) ON DELETE CASCADE
);
