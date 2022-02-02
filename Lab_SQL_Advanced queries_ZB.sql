-- Lab | SQL Advanced queries
-- Zsanett Borsos

-- 1.  List each pair of actors that have worked together.
SELECT CONCAT(actor1.first_name, ' ', actor1.last_name) AS "Actor 1", CONCAT(actor2.first_name, ' ', actor2.last_name) AS "Actor 2" FROM sakila.film_actor AS table1
JOIN sakila.film_actor AS table2 ON 
table1.film_id = table2.film_id
AND table1.actor_id > table2.actor_id
JOIN sakila.actor AS actor1 ON 
table1.actor_id = actor1.actor_id
JOIN sakila.actor AS actor2 ON 
table2.actor_id = actor2.actor_id
ORDER BY actor1.last_name;

-- 2. For each film, list actor that has acted in more films.
SELECT sakila.film_actor.actor_id, CONCAT(sakila.actor.first_name, ' ', sakila.actor.last_name) AS "Actor", COUNT(sakila.film_actor.film_id) AS "Number of films" FROM sakila.film_actor
JOIN sakila.actor ON
sakila.film_actor.actor_id = sakila.actor.actor_id
GROUP BY sakila.film_actor.actor_id
ORDER BY COUNT(sakila.film_actor.film_id) DESC;

SELECT sakila.film_actor.film_id, sakila.film.title, sakila.film_actor.actor_id, CONCAT(sakila.actor.first_name, ' ', sakila.actor.last_name) AS "Actor" FROM sakila.film_actor
JOIN sakila.film ON
sakila.film_actor.film_id = sakila.film.film_id
JOIN sakila.actor ON
sakila.film_actor.actor_id = sakila.actor.actor_id;