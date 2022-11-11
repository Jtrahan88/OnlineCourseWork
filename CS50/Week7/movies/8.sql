SELECT p.name
FROM people as p
JOIN stars as s
ON s.person_id = p.id
JOIN movies AS m
ON m.id = s.movie_id
WHERE title LIKE 'Toy Story%';
