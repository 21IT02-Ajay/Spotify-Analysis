CREATE DATABASE IF NOT EXISTS spotify_db;
USE spotify_db;

CREATE TABLE spotify (
    artist VARCHAR(255),
    song VARCHAR(255),
    duration_ms INT,
    explicit BOOLEAN,
    year INT,
    popularity INT,
    danceability FLOAT,
    energy FLOAT,
    `key` INT,
    loudness FLOAT,
    mode INT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    genre VARCHAR(100)
);


select * from spotify;

-- 1.Top 10 Most Popular Songs.
select song,popularity as top_pop
from spotify
order by top_pop desc
limit 10;

-- 2.Top 5 Instrumental Songs.
select song,instrumentalness
from spotify
order by instrumentalness desc
limit 5;

-- 3.the top 5 longest songs in duration.
select song,duration_ms
from spotify
order by duration_ms desc
limit 5;

-- 4.Genre with Highest Average Popularity.
select genre,avg(popularity) as avg_pop
from spotify
group by genre
order by avg_pop desc;

-- 5.Top one Artist by Energy.
select artist,energy
from spotify
order by energy desc
limit 1;

-- 6.Number of Songs Released per Year.
select year,count(song) as no_of_song
from spotify
group by year
order by no_of_song desc;

-- 7.Most Popular Year Overall.
select year,sum(popularity) as total_pop
from spotify
group by year
order by total_pop desc
limit 1;

-- 8.Songs That Are Both Danceable & Energetic.
select song, danceability, energy
from spotify
where danceability > 0.8 AND energy > 0.8
order by danceability desc,energy desc;

-- 9.Genre with Widest Tempo Range.
select genre,max(tempo)-min(tempo) as tempo_range
from spotify
group by genre
order by tempo_range desc
limit 1;

-- 10.Year with Most Explicit Songs.
select year,count(*) as exp
from spotify
where explicit=True
group by year
order by exp desc
limit 1;

-- 11.Top Artist by Avg Popularity in 2020.
select artist,avg(popularity) as avg_popularity
from spotify
where year=2020
group by artist
order by avg_popularity desc
limit 1;

-- 12.Top 5 Danceable Songs in a Specific Genre (e.g., 'pop').
select danceability,song
from spotify
where genre='pop'
order by danceability desc
limit 5;

-- 13.Most Popular Artists (Top 10 by Average Popularity).
select artist,avg(popularity) as top_pop
from spotify
group by artist
order by top_pop desc
limit 10; 

-- 14.Songs with Highest Danceability.
select song,danceability as high_dance
from spotify
order by high_dance desc
limit 1;

-- 15.Average Tempo by Genre.
select genre,avg(tempo) as avg_tempo
from spotify
group by genre
order by avg_tempo desc;

-- 16.Find the top 3 genres with the highest average energy.
select genre,round(avg(energy),3) as Avg_energy
from spotify
group by genre
order by Avg_energy desc
limit 3;

-- 17.Artist with Highest Average Danceability.
select artist,round(avg(danceability),3) as "Highest Average Danceability"
from spotify
group by artist
limit 1;

-- 18.Top 5 Instrumental Songs by Genre.
select song,instrumentalness,genre
from spotify
order by instrumentalness desc
limit 5;

-- 19.Most Frequently Occurring Artist.
select artist,count(*) as song_count
from spotify
group by artist
order by song_count desc
limit 3;

-- 20.Songs Above Genre-Average Popularity.
select s.song,s.genre, s.popularity
from spotify s
join (
    select genre, avg(popularity) as avg_pop
    from spotify
    group by genre
) g on s.genre = g.genre
where s.popularity > g.avg_pop;

-- 21.Compare Songs by the Same Artist.
select s1.song as song1,s2.song as song2,s1.artist
from spotify s1 join spotify s2
on s1.artist=s2.artist and s1.song<s2.song;

-- 22.Find Songs with Same Popularity.
select s1.song as song1,s2.song as song2,s1.popularity
from spotify s1 join spotify s2
on s1.popularity=s2.popularity and s1.song<s2.song;






