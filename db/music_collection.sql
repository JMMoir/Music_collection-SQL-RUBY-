DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  artist_name VARCHAR
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  album_name VARCHAR,
  Genre VARCHAR,
  artist_id INT REFERENCES artists(id)
);
