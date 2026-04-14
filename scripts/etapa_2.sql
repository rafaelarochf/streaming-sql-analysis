use streaming; 

-- Top diretores com mais títulos
SELECT director, COUNT(*) AS total_titulos
FROM netflix_titles
WHERE director IS NOT NULL AND director != ''
GROUP BY director
ORDER BY total_titulos DESC
LIMIT 10;

-- Filmes por país
SELECT country, COUNT(*) AS total_titulos
FROM netflix_titles
WHERE country IS NOT NULL AND country != ''
GROUP BY country
ORDER BY total_titulos DESC
LIMIT 10;

-- Quantidade de títulos por classificação (rating)
SELECT rating, COUNT(*) AS total_titulos
FROM netflix_titles
GROUP BY rating
ORDER BY total_titulos DESC;

-- Filmes por gênero/lista (listed_in)
SELECT listed_in, COUNT(*) AS total_titulos
FROM netflix_titles
GROUP BY listed_in
ORDER BY total_titulos DESC
LIMIT 10;

-- Séries vs Filmes por ano de lançamento
SELECT release_year, type, COUNT(*) AS total_titulos
FROM netflix_titles
GROUP BY release_year, type
ORDER BY release_year;