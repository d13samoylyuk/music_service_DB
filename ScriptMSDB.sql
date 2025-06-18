create table if not exists albums (
	albumID SERIAL primary key,
	release_date DATE not null,
	name VARCHAR(155) not null,
	check (release_date >= '1800-01-01')
);

create table if not exists tracks (
	trackID SERIAL primary key,
	name VARCHAR(155) not null,
	duration_seconds INTEGER not null,
	release_date DATE not null,
	albumID INTEGER not null references albums(albumID),
	check (duration_seconds between 3 and 3600),
	check (release_date >= '1800-01-01')
);

create table if not exists authors (
	authorID SERIAL primary key,
	name VARCHAR(120) not null,
	unique (name)
);

create table if not exists genres (
	genreID SERIAL primary key,
	name VARCHAR(50) not null,
	unique (name)
);

create table if not exists collections (
	collectionID SERIAL primary key,
	creation_date DATE not null,
	name VARCHAR(155) not null,
	check (creation_date >= '2025-01-01')
);

create table if not exists albums_author (
	albumID INTEGER not null references albums(albumID),
	authorID INTEGER not null references authors(authorID),
	primary key (albumID, authorID)
);

create table if not exists genre_author (
	genreID INTEGER not null references genres(genreID),
	authorID INTEGER not null references authors(authorID),
	primary key (genreID, authorID)
);

create table if not exists track_collection (
	TrackID INTEGER not null references tracks(trackID),
	CollectionID INTEGER not null references collections(collectionID),
	primary key (TrackID, CollectionID)
);