CREATE DATABASE catalog_of_my_things;

CREATE TABLE Book(
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(50),
  cover_state VARCHAR(50),
  PRIMARY KEY(id)
  FOREIGN KEY (genre_id) REFERENCES genre(id)
  FOREIGN KEY (author_id) REFERENCES author(id)
  FOREIGN KEY (label_id) REFERENCES label(id)
)

CREATE TABLE Label(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(50),
  PRIMARY KEY(id)
)

CREATE TABLE author(
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    PRIMARY KEY(id)
);


CREATE TABLE game(
    id INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(genre_id) REFERENCES genre(id)
    FOREIGN KEY(author_id) REFERENCES author(id)
    FOREIGN KEY(label_id) REFERENCES label(id)
);

CREATE TABLE Genre(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  PRIMARY KEY(id)
);

CREATE TABLE music_album(
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  genre_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY(genre_id) REFERENCES genre(id);
);