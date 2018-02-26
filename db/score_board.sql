DROP TABLE matches;
DROP TABLE competitions;
DROP TABLE teams;
DROP TABLE venues;


CREATE TABLE venues(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255),
  country VARCHAR(255)
);

CREATE TABLE teams(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE competitions(
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE matches(
  id SERIAL4 PRIMARY KEY,
  venue_id INT2 REFERENCES venues(id),
  home_team_id INT2 REFERENCES teams(id),
  away_team_id INT2 REFERENCES teams(id),
  competition_id INT2 REFERENCES competitions(id),
  home_team_score INT2,
  away_team_score INT2,
  date DATE,
  comments TEXT
);
