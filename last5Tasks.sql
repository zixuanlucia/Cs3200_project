/* who has the longest list?*/
Select *
from(
Select count(sub.Id) as length,
sub.FirstName,
sub.LastName
FROM(
select * 
from User u
join MyList ml on ml.UserId = u.Id) sub
group by sub.Id
order by length DESC)
limit 1

/* How many users subscribed to the app with the highest rating and
is avaibale for mobile phones?*/
Select count(Id) as num 
From(
select u.FirstName,
u.LastName,
u.Id  
from(
Select AppId
From Platform pt
join AppPlatform apt on apt.PlatformId = pt.Id
where Mobile = 1
order by Rating DESC
limit 1)s
join App a on a.Id =s.AppId
join Subscription sub on sub.AppId = a.Id
join User u on u.Id = sub.UserId)s1

/* List the people watched the video with the most number of tags,
order by UserId then by FristName */

select s2.FirstName,
s2.LastName,
s2.UserId
from(
Select *
from 
(Select count(Tag) as num,
VideoId
From Tags t 
join Video v on v.Id = t.VideoId
group by VideoId 
order by num DESC
limit 1 ) s1 
join UserVideo uv on uv.VideoId = s1.VideoId
join User u on u.Id = uv.UserId ) s2
Order by UserId, FirstName


/* among all users from USA, list all the apps 
they used to watch videos on mobile phones?
order by name, version then Rating */

Select a.Name,
Version,
Rating
From(
select id
From User u
join UserVideo uv on uv.UserId = u.Id
where Country = 'USA'
group by id) s1
join App a on a.Id = s1.Id
join AppPlatform ap on ap.AppId = a.Id
join Platform p on p.Id = ap.PlatformId
where Mobile = 1 and s1.Id = a.ID
Order by a.Name,Version,Rating


/* show which video is popular (recerives the more than 3 likes) in each country and 
from which platform they are watching the video from
order by Country then number of likes */
Select v.Title,
s1.Country,
s1.likes,
a.Name
From (
Select VideoId,
Country,
count(likes) as likes 
From User u 
join UserVideo uv on uv.UserId = u.Id 
where uv.Likes = 1 
group by u.Country) s1
join Video v on v.Id = s1.VideoId
join App a on a.Id = v.AppId
where likes > 3
order by Country, likes















