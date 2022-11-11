SELECT m.title, r.rating
FROM movies AS m
JOIN ratings as r
ON r.movie_id = m.id
WHERE m.year = 2010
ORDER BY r.rating DESC, title;
