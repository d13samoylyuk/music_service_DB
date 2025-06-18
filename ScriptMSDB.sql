create table if not exists Tracks (
	trackID SERIAL primary key,
	name VARCHAR(255) not null,
	albumID INTEGER not null references Albums(albumID)
);

create table if not exists Authors (
	authorID SERIAL primary key,
	name VARCHAR(255) not null
);

create table if not exists Albums (
	albumID SERIAL primary key,
	name VARCHAR(255) not null
);

create table if not exists Genres (
	genreID SERIAL primary key,
	name VARCHAR(50) not null
);

create table if not exists Collections (
	collectionID SERIAL primary key,
	name VARCHAR(255) not null
);

create table if not exists Albums_authors (
	albumID INTEGER not null references Albums(albumID),
	authorID INTEGER not null references Authors(authorID)
);

create table if not exists GenreAuthor (
	genreID INTEGER not null references Genres(genreID),
	authorID INTEGER not null references Authors(authorID)
);

create table if not exists TrackCollection (
	TrackID INTEGER not null references Tracks(trackID),
	CollectionID INTEGER not null references Collections(collectionID)
);