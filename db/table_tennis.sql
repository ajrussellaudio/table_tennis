DROP TABLE games;
DROP TABLE players;

CREATE TABLE players (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE games (
  id SERIAL4 PRIMARY KEY,
  player1_id INT4 REFERENCES players(id) ON DELETE CASCADE,
  player2_id INT4 REFERENCES players(id) ON DELETE CASCADE,
  player1_score INT4,
  player2_score INT4
);