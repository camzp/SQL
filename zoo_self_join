/* FROM https://sqlzoo.net/wiki/Self_join */
---
(1) How many stops are in the database.
---

SELECT COUNT (name)  AS Total
FROM stops;

---
(2) Find the id value for the stop 'Craiglockhart'
---

SELECT id
FROM stops AS s
	WHERE s.name = 'Craiglockhart';

---
(3) Give the id and the name for the stops on the '4' 'LRT' service.
---

SELECT id, name
FROM stops AS s
	JOIN route AS r 
	ON s.id = r.stop
	WHERE r.num = 4 AND r.company = 'LRT';

---
    The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
(4) Run the query and notice the two services that link these stops have a count of 2. 
    Add a HAVING clause to restrict the output to these two routes.
---

SELECT company, num, COUNT(*)
FROM route 
	WHERE stop=149 OR stop=53
	GROUP BY company, num
	HAVING COUNT (stop) = 2;

---
    Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart,  
(5) without changing routes. 
    Change the query so that it shows the services from Craiglockhart to London Road.
---

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149  /* adicionado somente o ultimo AND para resolução da questão. */

---
     The query shown is similar to the previous one, however by joining two copies of the stops
(6)  table we can refer to stops by name rather than by number. Change the query so that the 
     services between 'Craiglockhart' and 'London Road' are shown.
     If you are tired of these places try 'Fairmilehead' against 'Tollcross'
---

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name= 'London Road';  /* adicionado somente o ultimo AND para resolução da questão. */

---

(7) Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')

---

SELECT DISTINCT a.company, a.num
FROM route AS a
JOIN route AS b ON (a.num = b.num)
WHERE a.stop = 115 AND b.stop = 137;


---

(8) Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

---

SELECT routea.company, routea.num
FROM route AS routea
JOIN route AS routeb  ON (routea.num = routeb.num)
JOIN stops AS stopa   ON (routea.stop = stopa.id)
JOIN stops AS stopb   ON (routeb.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';
