DROP TABLE if exists [User];
DROP TABLE if exists [Video];
DROP TABLE if exists [MyList];
DROP TABLE if exists [App];
DROP TABLE if exists [AppPlatform];
DROP TABLE if exists [Platform];
DROP TABLE if exists [MyVideo];
DROP TABLE if exists [Show];
DROP TABLE if exists [Season];
DROP TABLE if exists [Subscription];
DROP TABLE if exists [Tags];
DROP TABLE if exists [UserVideo];

/*******************************************************************************
   Create Tables
********************************************************************************/
create table User
(
  'Id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'Email' NVARCHAR NOT NULL,
  'FirstName' NVARCHAR NOT NULL,
  'LastName' NVARCHAR NOT NULL,
  'Country' NVARCHAR NOT NULL,
  'Password' NVARCHAR NOT NULL
);

create table App
(
  'Id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'Name' NVARCHAR NOT NULL,
  'Description' NVARCHAR(300)
);

create table Video
(
  'Id' INTEGER PRIMARY KEY AUTOINCREMENT,
  'AppId' INTEGER NOT NULL,
  'Title' NVARCHAR NOT NULL,
  'Description' NVARCHAR(200),
  'ReleaseDate' DATETIME NOT NULL,
  'Duration' INT NOT NULL, /* in seconds */
  'Free' BOOLEAN NOT NULL,
  'Count' INT NOT NULL,
  'ShowId' INT,
  'Season Number' INT,  
  'Episode' INT,

  
  
  CONSTRAINT 'FK_VideoOnApp', 
  foreign key ('AppId') references 'App'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT 'FK_VideosShow',
  foreign key ('ShowId') references 'Show'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT 'FK_VideosSeasonNum',
  foreign key ('Season Number') references 'season'('Number') ON DELETE NO ACTION ON UPDATE NO ACTION
);

create table Show
(
  'Id' integer PRIMARY KEY AUTOINCREMENT,
  'Title' nvarchar NOT NULL,
  'Description' nvarchar(300)
);

create table Season
(
  'ShowId' integer NOT NULL,
  'Number' integer  NOT NULL,
  
  CONSTRAINT 'PK_Season' PRIMARY KEY  ('ShowId', 'Number'),
  
  CONSTRAINT 'FK_ShowOfSeason', 
  foreign key ('ShowId') references 'Show'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION
);

create table Subscription
(
  'UserId' Integer NOT NULL,
  'AppId' integer NOT NULL,
  'Cost' NUMERIC (10,2) NOT NULL,
  'Expiration' datetime,
  
  CONSTRAINT 'PK_SHOW' PRIMARY KEY  ('UserId', 'AppId'),
  
  CONSTRAINT 'FK_UserSubscriptionId', 
  foreign key ('UserId') references 'User'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT 'FK_SubscriptionAppName', 
  foreign key ('AppId') references 'App'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION
);


create table Platform
(
  'Id' integer PRIMARY KEY AUTOINCREMENT,
  'Name' nvarchar NOT NULL,
  'Mobile' boolean NOT NULL
);

create table AppPlatform
(
  'AppId' integer NOT NULL,
  'PlatformId' integer NOT NULL,
  'Version' numeric NOT NULL,
  'Rating' numeric,
  /* the same version of the same app for the same platform cannot have 2 ratings*/
  CONSTRAINT 'PK_AppPlatform' PRIMARY KEY  ('AppId', 'Version', 'PlatformId'),
  
  CONSTRAINT 'FK_AppUsed',
  foreign key ('AppId') references 'App'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT 'FK_PlatformUsed', 
  foreign key ('PlatformId') references 'Platform'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION
);

create table UserVideo
(
  'UserId' integer NOT NULL,
  'VideoId' integer NOT NULL,
  'Likes' boolean, /* if it's null it means that the user does not have an opinion */
  
  CONSTRAINT 'PK_UserVideo' PRIMARY KEY  ('UserId', 'VideoId'),
  
  CONSTRAINT 'FK_UserIdUserVideo', 
  foreign key ('UserId') references 'User'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT 'FK_VideoIDUserVideo', 
  foreign key ('VideoId') references 'Video'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION
);

create table Tags
(
  'VideoId' integer NOT NULL,
  'Tag' nvarchar(20) NOT NULL,
  
  CONSTRAINT 'PK_Tags' PRIMARY KEY  ('VideoId', 'Tag'),
  
  CONSTRAINT 'FK_TagsForVideos', 
  foreign key ('VideoId') references 'Video'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION
);

create table MyList
(
  'UserId' INT NOT NULL,
  'VideoId' INT NOT NULL,
  'InShow?' BOOLEAN NOT NULL,
  
  CONSTRAINT 'FK_ListOwner', 
  foreign key ('UserId') references 'User'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION,
  
  CONSTRAINT 'FK_VideosInList', 
  foreign key ('VideoId') references 'Video'('Id') ON DELETE NO ACTION ON UPDATE NO ACTION
);
/*******************************************************************************
   Indexs
********************************************************************************/
CREATE INDEX [Video_ShowId] ON [Video] ([Title]);
CREATE INDEX [Show_Title] ON [Show] ([Title]);
CREATE INDEX [User_Email] ON [User] ([Email]);
CREATE INDEX [App_Name] ON [App] ([Name]);
CREATE INDEX [Platform_Name] ON [Platform] ([Name]);


/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (1, 'hard');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (1, 'interesting');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (1, 'challenging');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (2, 'hard');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (2, 'interesting');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (2, 'challenging');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (3, 'hard');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (3, 'interesting');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (3, 'challenging');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (4, 'hard');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (4, 'interesting');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (4, 'challenging');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (5, 'hard');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (5, 'interesting');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (5, 'challenging');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (6, 'hard');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (6, 'interesting');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (6, 'challenging');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (15, 'comical');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (14, 'thriller');
INSERT INTO [Tags]([VideoId], [Tag]) VALUES (13, 'interesting');

INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('r.j@gmail.com','Rock','Jack','USA','19970504');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('y.s@gmail.com','Yulu','Sun','USA','19970213jjk');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('l.s@gmail.com','Lucy','Smith','USA','20202020');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('e.y@gmail.com','Emma','Young','USA','abcdefg');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('a.b@gmail.com','Alice','Brown','UK','ccddfhen');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('s.z@gmail.com','Suzy','Zhu','CHINA','ccddddfge');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('a.t@gmail.com','Amy','Taylor','UK','ccdhhseir');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('k.r@gmail.com','Kevin','Ross','USA','cc88890W2');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('m.s@gmail.com','Matt','Scott','USA','ccd990djfb');
INSERT INTO [User] ([Email],[FirstName],[LastName], [Country],[Password]) VALUES ('t.w@gmail.com','Tommy','Wilson','USA','cseaasdffe');



INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (1,1,4.99,'1962-02-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (7,1,4.99,'2020-02-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (10,2,9.99,'2021-02-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (9,2,8.99,'2022-02-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (7,2,4.99,'2025-02-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (6,11,8.88,'2027-02-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (4,9,4.88,'2022-04-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (8,2,4.66,'2022-09-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (8,1,3.88,'2022-08-18 00:00:00');
INSERT INTO [Subscription] ([UserId],[AppId],[Cost],[Expiration]) VALUES (2,2,5.99,'2022-02-30 00:00:00');


INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (1,1,2,5.0);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (1,1,2.8,7.8);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (1,4,8.0, 8.4);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (9,1,2.9,9.2);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (11,1,3.2,8.3);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (11,1,3.3,9.4);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (1,2,2.7,5.7);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (9,2,2.9,5.5);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (11,2,3.9,9.1);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (1,3,10.6,9.2);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (2,3,10.7,10.0);
INSERT INTO [AppPlatform] ([AppId],[PlatformId],[Version],[Rating]) VALUES (9,3,12.7,10.0);


INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('Android',true);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('Roku',true);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('ios',true);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('PS4',false);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('Windows',true);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('Google',true);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('BlackBerry',true);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('Firefox OS',true);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('Linux',false);
INSERT INTO [Platform] ([Name],[Mobile]) VALUES ('Solaris',false);


INSERT INTO [App] ([Name],[Description]) VALUES ('Netflix','Stream all shows from all the countries we colonized using our economic powers muahahahaha');
INSERT INTO [App] ([Name],[Description]) VALUES ('Youtube','Stream mostly free videos from all over the world except for china because they blocked us');
INSERT INTO [App] ([Name],[Description]) VALUES ('Bilibili','Stream anime, chinese shows, basically chinese youtube');
INSERT INTO [App] ([Name],[Description]) VALUES ('Dilidili','we aim to be bilibili one day');
INSERT INTO [App] ([Name],[Description]) VALUES ('Youku','All of your mom and grandma`s favorites in one thing');
INSERT INTO [App] ([Name],[Description]) VALUES ('Iqiyi','movies, like youku because monopoly is bad for the economy');
INSERT INTO [App] ([Name],[Description]) VALUES ('Instagram','super short videos meant to entertain people for an hour or so');
INSERT INTO [App] ([Name],[Description]) VALUES ('TikToc','short videos used by the chinese government which aim to take information from the american public');
INSERT INTO [App] ([Name],[Description]) VALUES ('MangoTV','good TV, does not taste like mango though');
INSERT INTO [App] ([Name],[Description]) VALUES ('SpainChannel 3','las mejores series de tu vida');
INSERT INTO [App] ([Name],[Description]) VALUES ('Hulu','includes brainless shows like the bachelorette and 90 day fiancee');


INSERT INTO [Show] ([Title] ,[Description]) VALUES ('Friends','story about some friends');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('Big Bang','was the world created by the big bang?');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('Alone','idk anything about this show, is it drama?');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('Oak Island','reality TV that gets you addicted to the stupidity of other people');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('Civil War','bad american history made to glorify america');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('The Wire','made to make you scared about the wire');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('sql','if you wanted to learn sql, watch it and it will traumatize you so you stop wanting to learn sql');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('How I meet your mom','the story of how someone met someone else, fun stuff');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('Modern Family','a super modern family');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('hahahahaha','a chinese reality show');
INSERT INTO [Show] ([Title] ,[Description]) VALUES ('Running Man','a korean reality show');



INSERT INTO [Season] ([ShowId],[Number]) VALUES (1,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (1,2);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (2,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (3,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (4,2);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (5,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (6,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (7,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (7,2);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (7,3);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (7,4);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (7,5);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (8,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (8,2);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (8,5);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (9,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (10,3);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (11,1);
INSERT INTO [Season] ([ShowId],[Number]) VALUES (11,2);



INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2045-02-18 00:00:00',160, true, 520,7, 1, 1);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2024-02-18 00:00:00',160, true, 350,7, 1, 2);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2023-02-18 00:00:00',160, true, 13855, 7, 2, 3);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2020-02-18 00:00:00',160, true, 12464, 7, 2, 4);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2021-02-18 00:00:00',160, true, 1246577, 7, 3, 5);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2020-02-18 00:00:00',160, false, 40369245,7 , 3, 6);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (1,'friends 1','having some friends', '2020-02-18 00:00:00',1200, true, 34, 1, 1, 1);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (1,'friends 2','having some friends', '2020-02-18 00:00:00',1320, true, 1, 1, 1, 2);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (1,'friends 3','having some friends', '2021-02-18 00:00:00',1483, true, 354365,1, 1, 3);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (1,'friends 4','having some friends', '2020-02-18 00:00:00',1365, false, 32, 1, 1, 4);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count]) Values (3,'gaoxiaoshipin','funny', '2020-02-18 00:00:00',3683, true, 42564);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count]) Values (3,'wanyouxishipin','fun', '2020-02-18 00:00:00',160, true, 45124);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count]) Values (5,'happy camp','meet the stars', '2020-02-18 00:00:00',7229, false, 49103493);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count]) Values (5,'movie1','just a movie', '2020-02-18 00:00:00',8124, true, 348);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 49, 11, 1, 1);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 48, 11, 1, 2);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 43, 11, 1, 3);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 42, 11, 1, 4);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 40, 11, 1, 5);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 47, 11, 1, 6);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 43, 11, 1, 7);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 42, 11, 1, 8);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 4, 11, 2, 1);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 9, 11, 2, 2);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 8, 11, 2, 3);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 21, 11, 2, 4);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (6,'RunningMan','not so serious', '2020-02-18 00:00:00',3205, true, 2, 11, 2, 5);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2019-02-18 00:00:00',160, false, 52, 7, 4, 6);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2019-02-18 00:00:00',160, false, 51, 7, 4, 7);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2019-02-18 00:00:00',160, false, 59, 7, 4, 10);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2019-02-18 00:00:00',160, false, 50, 7, 5, 3);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2019-02-18 00:00:00',160, false, 20, 7, 5, 4);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2019-02-18 00:00:00',160, false, 5, 7, 5, 5);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (2,'sql learing','learn sql in two hours', '2019-02-18 00:00:00',160, false, 2, 7, 5, 14);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (4,'big bang','boom', '2019-06-18 00:00:00',1300, false, 500, 2, 1, 15);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (4,'alone','so lonely these days', '2013-06-18 00:23:00',3502, true, 3450, 3, 1, 2);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (9,'OakIsland','reality tv of your favorite people', '2013-06-18 00:23:00', 3602, true, 12059, 4, 2, 4);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (9,'Civil war','just south carolina being south carolina', '2013-06-18 00:23:00', 7834, true, 2, 5, 1, 5);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (10,'The Wire','scary scary', '2013-06-18 00:23:00', 6350, false, 10, 6, 1, 3);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (9,'OakIsland','reality tv of your favorite people', '2013-06-18 00:23:00', 3602, true, 12059, 4, 2, 6);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (11,'monther meet','some funfun', '2013-06-18 00:23:00', 1302, true, 12059, 8, 1, 3);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (11,'meet jack','meeting jack', '2013-06-18 00:23:00', 1109, false, 12059, 8, 2, 5);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (11,'have u met ted','greatest pickup lines', '2013-06-18 00:23:00', 1278, true, 12059, 8, 5, 20);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (9,'Modern day','family is overated', '2013-06-18 00:23:00', 1321, true, 485, 9, 1, 2);
INSERT INTO [Video] ([AppId], [Title], [Description], [ReleaseDate], [Duration], [Free], [Count],[ShowId], [Season Number], [Episode]) Values (9,'jajajajajajja','jajajajajajajajajajajajaja', '2013-06-18 00:23:00', 6043, true, 0, 10, 3, 5);



INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (1, 2, true);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (1, 3, true);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (1, 4, false);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (4, 5, true);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (4, 2, true);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (4, 3, false);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (6, 2, true);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (6, 8, true);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (6, 9, true);
INSERT INTO [UserVideo] ([UserId],[VideoId],[Likes]) VALUES (6, 1, true);


INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (1,11, false); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (2,7, true); /* adding friends to person 2's list*/
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (2,8,true); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (2,9,true); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (2,10,true); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (2,11,false); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (4,13,false); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (5,12,false); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (6,14,false); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (7,13,false); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (8,11,false); 
INSERT INTO [MyList] ([UserId],[VideoId],[InShow?]) VALUES (9,11,false); 
