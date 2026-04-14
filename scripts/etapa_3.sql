use streaming;

-- Top diretores por gênero (ranked)
SELECT 
    CONCAT('"', listed_in, '"') AS genero,  -- garante que o gênero inteiro com vírgula fique em um único campo
    director,
    COUNT(*) AS total_titulos,
    RANK() OVER (PARTITION BY listed_in ORDER BY COUNT(*) DESC) AS rank_genero
FROM netflix_titles
WHERE director IS NOT NULL AND director != ''
GROUP BY listed_in, director
ORDER BY genero, rank_genero
LIMIT 20;

-- Distribuição de filmes e séries por país e classificação
SELECT 
    country,
    rating,
    COUNT(*) AS total_titulos
FROM netflix_titles
WHERE country IS NOT NULL AND country != ''
GROUP BY country, rating
ORDER BY total_titulos DESC
LIMIT 30;


-- Títulos adicionados por mês (para ver sazonalidade)
SELECT 
    YEAR(date_added) AS ano,
    MONTH(date_added) AS mes,
    COUNT(*) AS total_titulos
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY ano, mes
ORDER BY ano, mes;

-- Média de duração de filmes por classificação
SELECT 
    rating,
    AVG(CAST(SUBSTRING_INDEX(duration,' ',1) AS UNSIGNED)) AS duracao_media_min
FROM netflix_titles
WHERE duration LIKE '%min%'
GROUP BY rating
ORDER BY duracao_media_min DESC;