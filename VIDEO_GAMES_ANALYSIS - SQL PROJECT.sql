create database video_games;
use video_games;
select * from Video_Games;
--- Here we are going to perform some SQL questions on this Video Games table

-- Retrieve the names of all the video games in the table 
select Name from Video_Games;

-- List the unique platforms available in the table
select distinct Platform 
from Video_Games;

-- Find the total number of video games in the table
select count(Name) as Total_Number_of_Video_Games 
from Video_Games;

-- Calculate the average global sales for all the video games
select avg(Global_Sales) as Average_global_sales 
from Video_Games;

-- Show the Top 10 Video Games with highest global sales
select Name,Global_Sales
from Video_Games
order by Global_Sales desc
limit 10;
     
-- Retrieve the names of all the video games released after 2010
select Name,Year_of_Release
from Video_Games
where Year_of_Release>2010;
     
-- Find the total sales for each platform
select Platform,sum(Global_Sales) 
from Video_Games 
group by Platform;

-- Find Top 10 platforms with highest total sales
select Platform,sum(Global_Sales) as Total_Sales 
from Video_Games 
group by Platform 
order by Total_Sales desc 
limit 10;

-- Display the video games with sales less than 5 million copies
select Name,Global_Sales 
from Video_Games 
where Global_Sales<5 
order by Global_Sales;

-- List the publishers with the most video game titles 
select Publisher,count(Name) as Video_Game_Titles 
from Video_Games 
group by Publisher 
order by Video_Game_Titles desc;

-- Find the average user_score for video games published by Nintendo
select avg(User_Score) 
from Video_Games 
where Publisher='Nintendo';

-- Count the number of Video games in each genre
select Genre,count(Name) as Number_of_Video_Games 
from Video_Games 
group by Genre;

-- Show the Top 5 genres with the most video games
select Genre,count(Name) as Number_of_video_games 
from Video_Games 
group by Genre 
order by Number_of_video_games desc 
limit 5;

-- Display the video games released in the year 2015 & published by Electronic arts
select Name,Year_of_Release,Publisher 
from Video_Games 
where Year_of_Release=2015 and Publisher='Electronic Arts';

-- Find the video game with the highest global sales
select Name,Global_Sales 
from Video_Games 
order by Global_Sales desc 
limit 1;

-- Retreive the names of video games with 'Mario' in their title
select * 
from Video_Games 
where name like '%Mario%';

-- Calculate the total sales for each platform in North America
select Platform,sum(NA_Sales) as North_America_Total_Sales 
from Video_Games 
group by Platform 
order by North_America_Total_Sales desc;

-- Display the names of video games that sold more copies in North America than in Europe
select Name,NA_Sales,EU_Sales 
from Video_Games 
where NA_Sales>EU_Sales;       

--- Here we are going to perform 20 SQL Subquery questions on this Video Games table :-
-- Find the names of all video games that have a higher user score than the average user score of all games
select Name,User_Score from Video_Games 
where User_Score>(select avg(User_Score) from Video_Games)
order by User_Score desc;

-- Retrieve the names of video games released on the platform with the most global sales
select Name,Platform 
     from Video_Games 
     where Platform=(select Platform from Video_Games group by Platform order by sum(Global_Sales) desc limit 1);
     
-- List the publishers who have published the games for platforms with fewer than 10 games in the table
 select Publisher,Platform from Video_Games 
 where Platform in(select Platform from Video_Games group by Platform having count(Name)<10);
 
-- Find the video game with the highest global sales in the 'Action' genre
 select Name,Global_Sales,Genre from Video_Games where Global_Sales=(select max(Global_Sales) from Video_Games where Genre='Action');

-- Calculate the average user score for video games released by the publisher with the most titles       
 select avg(User_Score) from Video_Games 
 where Publisher=(select Publisher from Video_Games group by Publisher order by count(Name) desc limit 1);

-- List the platforms that have atleast one game with a 'Teen' rating
 select distinct Platform from Video_Games 
 where Name in (select Name from Video_Games where Rating='T');

-- Find the total global sales for video games released in the same year as "God of War III"
 select Name,Global_Sales,Year_of_Release from Video_Games 
 where Year_of_Release=(select Year_of_Release from Video_Games where Name='God of War III');

-- Retrieve the names of publishers who have published games in the same genre as 'Grand Theft Auto V'
 select distinct Publisher,Genre from Video_Games 
 where Genre in (select Genre from Video_Games where Name='Grand Theft Auto V');

-- List the genres that have at least one game with a global sale of over 10 million copies 
 select distinct Genre from Video_Games 
 where Name in (select Name from Video_Games where Global_Sales>10);

-- Calculate the total global sales for all games released on platforms with fewer than 5 games
 select Name,Platform,Global_Sales from Video_Games 
 where Platform in (select Platform from Video_Games group by Platform having count(Name)<5);

-- Retrieve the names of video games released in the same year as the game with most critic_count
 select Name,Year_of_Release from Video_Games 
 where Year_of_Release=(select Year_of_Release from Video_Games order by Critic_Count desc limit 1);

-- List the publishers who have published games in all available genres
 select Publisher from Video_Games 
 where Genre in(select distinct genre from Video_Games);

-- Find the names of video games with a user rating higher than any game published by 'Electronic Arts'
 select Name,User_Score from Video_Games 
 where User_Score>(select max(User_Score) from Video_Games where Publisher='Electronic Arts');

-- Find the names of all video games that have global sales greater than the average global sales of games released in the same year
 select Name,Global_Sales from Video_Games 
 where Global_Sales>(select avg(Global_Sales) from Video_Games where Year_of_Release=2015);

-- Retrieve the names of publishers who have published games for platforms with an average user score greater than 5
 select distinct Publisher,Platform from Video_Games 
 where Platform in(select Platform from Video_Games group by Platform having avg(User_Score)>5);
  
-- Calculate the average user score for video games released by publishers that have an avearge critic score higher than 75
 select avg(User_Score) from Video_Games 
 where Publisher in(select Publisher from Video_Games group by Publisher having avg(Critic_Score)>75);

-- List the platforms that have at least one game with a 'Mature' rating & an average user rating higher than 7
select distinct Platform from Video_Games 
where Rating='M' and Platform in (select Platform from Video_Games group by Platform having avg(User_Score)>7);

-- Retrieve the names of publishers who have published games in the same genre as 'Wii Sports Resort' but with a higher average user score
select Publisher,avg(User_Score) from Video_Games 
where Genre=(select Genre from Video_Games where Name='Wii Sports Resort') 
group by Publisher having avg(User_Score)>(select avg(User_Score) from Video_Games 
where Name='Wii Sports Resort');

-- List the genres that have at least one game with a global sale between 1 million and 5 million copies
select distinct Genre from Video_Games 
where Name in(select Name from Video_Games where Global_Sales between 1 and 5);

-- Display the names of video games that have a higher user rating than any game published by 'Ubisoft' but with a 'Mature' rating 
select Name,Rating,User_Score from Video_Games 
where Rating='M' and User_Score>(select max(User_Score) from Video_Games where Publisher='Ubisoft');

-- Calculate the total global sales for all games released on platforms where the average critic score greater than average user score
select Platform,Global_Sales from Video_Games 
where Platform in (select Platform from Video_Games group by Platform having avg(Critic_Score)>avg(User_Score));


Ans- select Publisher,avg(User_Score) from Video_Games 
where Genre=(select Genre from Video_Games where Name='Wii Sports Resort') 
group by Publisher having avg(User_Score)>(select avg(User_Score) from Video_Games 
where Name='Wii Sports Resort'); 

-- Calculate the average user rating for games on platforms with an average global sales higher than 5
select avg(User_Score) from Video_Games 
where Platform in (select Platform from Video_Games group by Platform having avg(Global_Sales)>5);

-- Display the names of publishers who have published games in both 'Action' & 'Adventure' genres with an average critic score higher than 85
select Publisher,avg(Critic_Score) 
from Video_Games 
where Genre in('Action','Adventure') 
group by Publisher having avg(Critic_Score)>85;