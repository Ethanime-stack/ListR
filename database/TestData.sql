/* Test data to test in postgres */ 

INSERT INTO Users (first_name, last_name, email, username, password)
VALUES
('Ethan', 'Dubuc', 'dubu0033@algonquinlive.com', 'EthanDubuc', 'password123'); 

INSERT INTO Shows (title, season, cover_url, about, staff)
VALUES
('Stranger Things', 1, 'https://i.postimg.cc/8CzWD0ts/11d17b1731cdeafedc2c027d882b4c13.jpg', 'Strange things are afoot in Hawkins, Indiana, where a young boys sudden disappearance unearths a young girl with otherworldly powers.', 
'Staff: Staff' ), 
('Succession', 1, 'https://i.postimg.cc/ryZqYYtQ/succession-season-one.jpg', 
'The series centers on the Roy family, the owners of global media and entertainment conglomerate Waystar RoyCo, and their fight for control of the company amidst uncertainty about the health of the familys patriarch.', 
'Staff: Staff'); 

INSERT INTO Episodes (show_id, season, episode_number, title, air_date)
VALUES 
(1, 1, 1, 'Chapter One: The Vanishing of Will Byers', '2016-07-15' ), 
(2, 1, 1, 'Celebration', '2018-06-03'),
(1, 1, 2, 'Chapter Two: The Weirdo on Maple Street', '2016-07-15');

INSERT INTO Ratings (user_id, episode_id, rating)
VALUES
(1, 1, 4),
(1, 2, 5), 
(1, 3, 2); 

INSERT INTO Reviews (user_id, episode_id, review_text) 
VALUES
(1, 1, 'Great start to the series! Excited for next episode.'), 
(1, 2, 'Wow, Succession is gonna be great! '), 
(1, 3, 'This episode sucked! '); 

