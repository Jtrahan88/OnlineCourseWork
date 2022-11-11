SELECT title
FROM movies AS m
JOIN stars AS s
ON m.id = s.movie_id
JOIN people AS p
ON s.person_id = p.id
WHERE p.name = 'Johnny Depp'
AND title IN (SELECT title
                FROM movies AS m
                JOIN stars AS s
                ON m.id = s.movie_id
                JOIN people as p
                ON p.id = s.person_id
                WHERE p.name = 'Helena Bonham Carter');