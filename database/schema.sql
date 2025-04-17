/*for testing purposes this DB has already been created in Postgres */
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Episodes;
DROP TABLE IF EXISTS Shows;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users ( -- Users Table
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    email VARCHAR(100) UNIQUE NOT NULL,
    username VARCHAR(15) UNIQUE NOT NULL,
    password CHAR(60) NOT NULL -- 60 char should accomodate Bcrypt
);

CREATE TABLE Shows ( -- Overall show Table
    show_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    season INT NOT NULL,
    cover_url TEXT,
    about TEXT,
    staff TEXT
);

CREATE TABLE Episodes ( -- Specific Episodes
    episode_id SERIAL PRIMARY KEY,
    show_id INT REFERENCES Shows(show_id) ON DELETE CASCADE,
    season INT NOT NULL,
    episode_number INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    air_date DATE,
    UNIQUE (show_id, season, episode_number) -- Prevents duplicate episodes
);

CREATE TABLE Ratings (
    rating_id SERIAL PRIMARY KEY, 
    user_id INT REFERENCES Users(user_id) ON DELETE SET NULL, -- if User deleted, Rating still stands. 
    episode_id INT REFERENCES Episodes(episode_id) ON DELETE CASCADE, 
    rating DECIMAL(3,2) CHECK (rating BETWEEN 0 AND 5) NOT NULL,
    UNIQUE (user_id, episode_id) -- ONLY 1 RATING PER ACCOUNT
);

CREATE TABLE Reviews ( -- Reviews per episode
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id) ON DELETE CASCADE, -- Reviews deleted if user deletes 
    episode_id INT REFERENCES Episodes(episode_id) ON DELETE CASCADE,
    review_text TEXT, -- Optional review
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, episode_id) -- ONLY 1 RATING PER ACCOUNT
);

CREATE VIEW ShowRatings AS SELECT
e.show_id,
ROUND(AVG(r.rating), 2) AS average_rating
FROM Ratings r
JOIN Episodes e ON r.episode_id = e.episode_id
GROUP BY e.show_id; 