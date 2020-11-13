
/* a) How many user in USA used iso to watch videos?
*/
Select count(u.Id)
from User u join
UserVideo uv on uv.UerId = u.Id 
join Video v on v.id = uv.VideoId 
where v.AppName = 'ios'
and u.Country = 'USA'


/* b) Among all the users, who spend the most money?*/
Select Top count(s.Cost)
from User u join 
Subscription s on s.UserEmail = u.Email
group by u.id


/* C) Reurn the user who used the highest rating app platform*/ 
sELECT TOP 
From (Select ap.Rating 
From User u 
Subscription s on s.UserEmail = u.Email
join AppPlatform ap on ap.AppName = a.AppName
order by 1)


/* d) who watched the video that has the most likes?
*/
Select User.FirstName,
User.LastName
from
(Select u.likes, u.id
From User u join
UserVideo uv on uv.UserId = u.id
order by 1) sub
join User on User.id = sub.id
 



/* e) how may shows has more than five seasons?
*/
Select count(s.id)
From Show s join 
Season se on se.ShowId = s.Id
where count(s.id) > 5






