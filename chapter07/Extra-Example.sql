--Question 1
CREATE TABLE albums (
album_id bigserial,
album_catalog_code varchar(100),
album_title text,
album_artist text,
album_release_date date,
album_genre varchar(40),
album_description text,
CONSTRAINT album_key PRIMARY KEY (album_id)
);

CREATE TABLE songs (
song_id bigserial,
song_title text,
song_artist text,
album_id bigint REFERENCES albums (album_id),
CONSTRAINT song_key PRIMARY KEY (album_id, song_id)
);

'
I chose a foreign key because the albums id in the albums table
is referenced in the songs table as well so it is best to link 
both tables by id (as each song and album has a unique id)
'

--Question 2
'
Another column in the albums table that can be unique is the album_catalog_code column as
every album has its own unique code.
So by using the album_id and album_catalog_code columns, one can create a natural key. 

Another column in the songs table that can be unique is the song_artist column as no two artists
have the same name (it\'s common practice to seek out a unique name).
So by using the song_id and song_artist columns, one can create a natural key. 
'

--Question 3
'
In the albums table the best  column to allocate an index
to is the album_genre column.

In the songs table the best  column to allocate an index
to is the song_title or song_artist columns.
'