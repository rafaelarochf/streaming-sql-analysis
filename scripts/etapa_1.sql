CREATE database streaming; 
use streaming;

CREATE TABLE netflix_titles (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(20),
    title VARCHAR(255),
    director VARCHAR(255),
    cast TEXT,
    country VARCHAR(100),
    date_added DATE,
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(50),
    listed_in VARCHAR(255),
    description TEXT
);

-- Ver as primeiras 10 linhas
SELECT * FROM netflix_titles LIMIT 10;

-- Quantos filmes e séries existem
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

-- Filmes adicionados por ano
SELECT YEAR(date_added) AS ano, COUNT(*) AS total
FROM netflix_titles
GROUP BY ano
ORDER BY ano;

-- Gêneros mais comuns
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;