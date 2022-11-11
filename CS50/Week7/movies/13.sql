SELECT DISTINCT(p.name)
FROM movies AS m
JOIN stars AS s
ON m.id = s.movie_id
JOIN people AS p
ON p.id = s.person_id
WHERE  m.id IN (SELECT m.id
                FROM movies AS m
                JOIN stars AS s
                ON m.id = s.movie_id
                JOIN people AS p
                ON p.id = s.person_id
                WHERE p.name = 'Kevin Bacon' and p.birth = 1958)
AND p.name != 'Kevin Bacon';
