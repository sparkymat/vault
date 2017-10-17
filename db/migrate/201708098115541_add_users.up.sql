-- Migration goes here.
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL CHECK (name <> ''),
  email TEXT NOT NULL CHECK (email <> ''),
  encrypted_password TEXT NOT NULL CHECK (encrypted_password <> ''),
  CONSTRAINT email_uniq UNIQUE(email)
);
