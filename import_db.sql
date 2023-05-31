CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);
CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    author_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    -- PRIMARY KEY(author_id,question_id)
);
CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    parent_id INTEGER,
    user_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES question_follows(author_id)
    FOREIGN KEY (question_id) REFERENCES questions(id),
);
CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    -- PRIMARY KEY(user_id,question_id)
);











