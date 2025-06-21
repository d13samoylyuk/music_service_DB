-- EXC N1
-- ALBUMS
insert into albums(release_date, name)
values ('2023-09-22', 'STARFUCKER (Deluxe)'),
       ('2021-11-12', 'Red (Taylor''s Version)'),
       ('2020-03-27', 'Future Nostalgia'),
       ('2019-04-07', 'Fluids'),
       ('2015-09-18', 'Honeymoon');

-- TRACKS
insert into tracks(name, duration_seconds, release_date, albumid)
values ('I Love Hollywood!', 184, '2023-09-22', 1),
       ('All Too Well', 613, '2021-11-11', 2),
       ('Levitating', 203, '2020-03-27', 3),
       ('Physical', 193, '2020-01-31', 3), -- 4
       ('Fluids', 152, '2019-04-07', 4),
       ('Art Deco', 295, '2015-09-18', 5),
       ('My Body', 221, '2023-09-22', 1); -- 7

-- COLLECTIONS
insert into collections(creation_date, name)
values ('2018-11-15', 'Light Rush'),
       ('2019-11-14', 'Pop''s Rocking'),
       ('2020-11-15', 'Decade Thru'),
       ('2024-11-16', 'Alter New');

-- TRACK_COLLECTION
insert into track_collection(trackid, collectionid)
values (6, 1),
       (4, 2), (5, 2),
       (6, 3), (5, 3), (4, 3), (3, 3),
       (1, 4), (5, 4);

-- ARTISTS ("Authors"..)
insert into authors(name)
values ('Slayyyter'), ('Taylor Swift'), ('Dua Lipa'),
       ('Michael Medrano'), ('Lana Del Ray');

-- GENRES
insert into genres("name")
values ('hyperpop'),
       ('pop'),
       ('country'),
       ('electropop'), -- 4
       ('rock'),
       ('disco'),
       ('dance'),      -- 7
       ('indie pop'),
       ('alternative pop');
       

-- GENGRE_AUTHOR
insert into genre_author(genreid, authorid)
values (1, 1), (2, 1),
       (2, 2), (3, 2), (4, 2), (5, 2),
       (2, 3), (6, 3),
       (1, 4), (2, 4), (7, 4),
       (5, 5), (8, 5), (9, 5);

-- ALBUM_AUTHOR
insert into albums_author(albumid, authorid)
values (1, 1), (2, 2), (3, 3), (4, 4), (5, 5)
       
       