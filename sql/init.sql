CREATE TABLE public.users
(
    user_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(64) NOT NULL,
    birth_date DATE
);

INSERT INTO public.users(name, birth_date)
VALUES
    ('John Doe', '1980-01-01'),
    ('Ahmad Soo-Jin', '1996-07-24'),
    ('Augusto Cristiana', '1930-03-21'),
    ('Jock Rajmund', '1958-03-29'),
    ('Ōkuninushi Opeyemi', '1963-04-20'),
    ('Shemu''el Ólöf', '1954-02-01'),
    ('América Nicostrato', NULL),
    ('Fabia Dzhamal', '1980-02-17'),
    ('Sharif Luned', '1969-02-14'),
    ('Mani Judith', '1939-03-09'),
    ('Lugos Maraĵa', '1977-09-25'),
    ('Iapheth Daividh', NULL),
    ('Arax Marko', '1966-07-10'),
    ('Constans Kaipo', '1954-03-04'),
    ('Jorrit Chesed', '1988-03-03'),
    ('Nilesh Sudhir', '1944-10-31'),
    ('Gerhard Gilgamesh', '1953-10-23'),
    ('Tormod Marina', '1986-04-28'),
    ('Māris Rok', '1998-02-01'),
    ('Ralph Sanjaya', '1970-06-30'),
    ('Shir Ashurbanipal', NULL);