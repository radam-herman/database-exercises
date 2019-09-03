-- 3.4_select_exercises.sql

-- 2
use albums_db

-- 3
describe albums

id	int(10) unsigned	NO	PRI	NULL	auto_increment
artist	varchar(240)	YES		NULL	
name	varchar(240)	NO		NULL	
release_date	int(11)	YES		NULL	
sales	float	YES		NULL	
genre	varchar(240)	YES		NULL	


-- 4 several queries
    -- The name of all albums by Pink Floyd
select * from albums where artist = 'Pink Floyd'

				-- The Dark Side of the Moon, The Wall
	
	-- The year Sgt. Pepper's Lonely Hearts Club Band was released
select `release_date` from albums where name LIKE 'Sgt.%'

    			-- year = 1967
	
	-- The genre for the album Nevermind
select genre from albums where name like 'Nevermind%'

						-- genre = Grunge, Alternative rock

   -- Which albums were released in the 1990s
select name, release_date from albums where release_date like '199%'
   
   
-- The Bodyguard	1992
-- Jagged Little Pill	1995
-- Come On Over	1997
-- Falling into You	1996
-- Let's Talk About Love	1997
-- Dangerous	1991
-- The Immaculate Collection	1990
-- Titanic: Music from the Motion Picture	1997
-- Metallica	1991
-- Nevermind	1991
-- Supernatural	1999
   
   
   -- Which albums had less than 20 million certified sales
   
 select name, sales from albums where sales < 20 
 
 Grease: The Original Soundtrack from the Motion Picture	14.4
Bad	19.3
Sgt. Pepper's Lonely Hearts Club Band	13.1
Dirty Dancing	17.9
Let's Talk About Love	19.3
Dangerous	16.3
The Immaculate Collection	19.4
Abbey Road	14.4
Born in the U.S.A.	19.6
Brothers in Arms	17.7
Titanic: Music from the Motion Picture	18.1
Nevermind	16.7
The Wall	17.6
 
   
   -- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
	
	select name from albums where genre = 'Rock'
	
	-- this answer would provide the "missing" Rock genres
	
	select name, genre from albums where genre like '%Rock%'
	