-- EXC N2
-- 1. longest song
select name, duration_seconds
  from tracks
 order by duration_seconds desc
 limit 1;

-- 2. songs longer than 3,5 min (210 sec)
select name, duration_seconds
  from tracks
 where duration_seconds >= 210
 order by duration_seconds desc;

-- 3. collections from 2018-2020
select name
  from collections
 where creation_date between '2018-01-01' and '2021-01-01'
 order by creation_date asc;

-- 4. short names
select name
  from authors
 where array_length(string_to_array(trim(name), ' '), 1) = 1;

-- 5. my in it
select name
  from tracks
 where string_to_array(lower(name), ' ')
       && array['my', 'мое', 'моя', 'мой', 'мои'];


-- EXC N3
-- 1. amnt of artists per genre
select name, count(name)
  from genres g
       join genre_author as ga 
       on ga.genreid = g.genreid
 group by g.name
 
-- 2. tracks in 2019-2020's albums 
 select count(t.name) as track_name
   from tracks as t
        join albums as a
        on a.albumid = t.albumid
  where a.release_date between '2019-01-01' and '2021-01-01';

-- 3. avarage songs' duration per album
select a.name, avg(duration_seconds) as ds
  from tracks
       left join albums as a
       on a.albumid = tracks.albumid
 group by a.name
 order by ds desc

-- 4. artists with off-2020 albums
select name
  from authors
 where name not in (
	   select authors.name as author_name
	     from authors
	          join albums_author as aa
	          on aa.authorid = authors.authorid
	          join albums as al
	          on al.albumid = aa.albumid
		where al.release_date between '2020-01-01' and '2021-01-01'
	 );

-- 5. Slayyyter in collections
select c.name
  from collections as c
       join track_collection as tc
       on tc.collectionid = c.collectionid
  	   join tracks as t
  	   on t.trackid = tc.trackid
  	   join albums as a 
  	   on a.albumid = t.albumid
  	   join albums_author as aa 
  	   on aa.albumid = a.albumid
  	   join authors as a2
  	   on a2.authorid = aa.authorid
 where a2.name = 'Slayyyter';