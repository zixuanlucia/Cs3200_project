

create table [User] 
(
  [Id] integer,
  [Email] nvarchar,
  [First] nvarchar,
  [Last] nvarchar,
  [Country] nvarchar,
  [Password] nvarchar,
  primary key ([Id], [Email])
);

create table App
(
  Name nvarchar primary key,
  Description nvarchar
);

create table Video
(
  Id integer,
  AppName nvarchar,
  Title nvarchar,
  Description nvarchar,
  ReleaseDate datetime,
  DurationI time,
  ShowId integer,
  Subscribe boolean,
  primary key (Id, AppName),
  constraint AppName_fk, foreign key (AppName) references App(Name),
  constraint ShowId_fk foreign key (ShowId) references Show(Id)
);

create table Show
(
  Id integer primary key,
  Title nvarchar,
  Description nvarchar
);

create table Sbuscription
(
  UserId integer,
  AppName nvarchar,
  Cost numeric,
  Expiration datetime,
  primary key (UserId, AppName),
  constraint UserId_fk, foreign key (UserId) references User(Id),
  constraint AppName_fk, foreign key (AppName) references App(Name)
);

create table Platform
(
  Name nvarchar primary key,
  Mobile boolean
);

create table AppPlatform
(
  AppName nvarchar,
  Platform nvarchar,
  Version nvarchar,
  Rating numeric,
  primary key (AppName, Platform),
  constraint AppName_fk, foreign key (AppName) references App(Name),
  constraint Platform_fk, foreign key (Platform) references Platform(Name)
);

create table UserVideo
(
  UserId integer,
  VideoId integer,
  Likes integer,
  primary key (UserId, VideoId),
  constraint UserId_fk, foreign key (UserId) references User(Id),
  constraint VideoId_fk, foreign key (VideoId) references Video(Id)
);

create table Season
(
  Num integer,
  ShowId integer,
  primary key (Num, ShowId),
  constraint ShowId_fk, foreign key (ShowId) references Show(Id)
);

create table VideoTags
(
  VideoId integer,
  VideoApp nvarchar,
  Tag nvarchar,
  primary key (VideoId, VideoApp, Tag),
  constraint VideoId_fk, foreign key (VideoId) references Video(Id),
  constraint VideoApp_fk, foreign key (VideoApp) references Video(AppName)
);


/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO [User] ([id],[Email],[FirstName],[LastName], [Country],[Password]) VALUES (1,'Rock','Jack','USA','19970504');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (2,'Yulu','Sun','USA','19970213jjk');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (3,'Lucy','Smith','USA','20202020');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (4,'Emma','Young','USA','abcdefg');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (5,'Alice','Brown','UK','ccddfhen');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (6,'Suzy','Zhu','CHINA','ccddddfge');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (7,'Amy','Taylor','UK','ccdhhseir');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (8,'Kevin','Ross','USA','cc88890W2');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (9,'Matt','Scott','USA','ccd990djfb');
INSERT INTO [User] ([id],[FirstName],[LastName], [Country],[Password]) VALUES (10,'Tommy','Wilson','USA','cseaasdffe');

INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'1962-02-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2020-02-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2021-02-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2022-02-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2025-02-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2027-02-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2022-04-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2022-09-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2022-08-18 00:00:00');
INSERT INTO [Subscription] ([Cost],[Expiration]) VALUES (4,'2022-02-30 00:00:00');


INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('Android',2,5);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('Android',2.8,7);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('Android',2.9,9);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('Android',3.2,8);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('Android',3.3,9);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('Roku',2.7,5);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('Roku',2.9,5);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('Roku',3.9,9);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('ios',10.6,9);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('ios',10.7,10);
INSERT INTO [AppPlatform] ([Platform],[Version],[Rating]) VALUES ('ios',12.7,10);


INSERT INTO [Platform] ([Mobile]) VALUES (true);
INSERT INTO [Platform] ([Mobile]) VALUES (false);
INSERT INTO [Platform] ([Mobile]) VALUES (true);
INSERT INTO [Platform] ([Mobile]) VALUES (false);
INSERT INTO [Platform] ([Mobile]) VALUES (true);
INSERT INTO [Platform] ([Mobile]) VALUES (false);
INSERT INTO [Platform] ([Mobile]) VALUES (true);
INSERT INTO [Platform] ([Mobile]) VALUES (false);
INSERT INTO [Platform] ([Mobile]) VALUES (true);
INSERT INTO [Platform] ([Mobile]) VALUES (false);

INSERT INTO [App] ([Name],[Description]) VALUES ('','');
INSERT INTO [App] ([Name],[Description]) VALUES ('','');

INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (01, 'Friends','Comdedy');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (02, 'Big Bang','Comdedy');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (03, 'Alone','drama');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (04, 'Oak Island','Reality');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (05, 'Civil War','History');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (06, 'The Wire','Crime');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (07, 'This is US','Comdedy');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (08, 'How I meet your mom','comedy');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (09, 'Modern Family','comedy');
INSERT INTO [Show] ([id], [Title] ,[Description]) VALUES (10, 'hahahahahaha','comedy');

INSERT INTO [Season] ([Num]) VALUES (1);
INSERT INTO [Season] ([Num]) VALUES (2);
INSERT INTO [Season] ([Num]) VALUES (3);
INSERT INTO [Season] ([Num]) VALUES (4);
INSERT INTO [Season] ([Num]) VALUES (5);
INSERT INTO [Season] ([Num]) VALUES (6);
INSERT INTO [Season] ([Num]) VALUES (7);
INSERT INTO [Season] ([Num]) VALUES (8);
INSERT INTO [Season] ([Num]) VALUES (9);
INSERT INTO [Season] ([Num]) VALUES (10);

INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (1,'sql learing','learn sql in two hours', '2045-02-18 00:00:00',160, false);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (2,'sql learing','learn sql in two hours', '2024-02-18 00:00:00',160, false);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (3,'sql learing','learn sql in two hours', '2023-02-18 00:00:00',160, true);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (4,'sql learing','learn sql in two hours', '2020-02-18 00:00:00',160, false);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (5,'sql learing','learn sql in two hours', '2021-02-18 00:00:00',160, true);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (6,'sql learing','learn sql in two hours', '2020-02-18 00:00:00',160, false);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (7,'sql learing','learn sql in two hours', '2020-02-18 00:00:00',160, true);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (8,'sql learing','learn sql in two hours', '2020-02-18 00:00:00',160, false);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (9,'sql learing','learn sql in two hours', '2021-02-18 00:00:00',160, true);
INSERT INTO [Video] ([id], [Title], [Desciption],[ReleaseDate],[Duration],[subscribe?]) Values (10,'sql learing','learn sql in two hours', '2020-02-18 00:00:00',160, false);

INSERT INTO [UserVideo] ([Likes]) VALUES (366);
INSERT INTO [UserVideo] ([Likes]) VALUES (300);
INSERT INTO [UserVideo] ([Likes]) VALUES (366);
INSERT INTO [UserVideo] ([Likes]) VALUES (366);
INSERT INTO [UserVideo] ([Likes]) VALUES (366);
INSERT INTO [UserVideo] ([Likes]) VALUES (366);
INSERT INTO [UserVideo] ([Likes]) VALUES (366);
INSERT INTO [UserVideo] ([Likes]) VALUES (366);
INSERT INTO [UserVideo] ([Likes]) VALUES (366);
INSERT INTO [UserVideo] ([Likes]) VALUES (366);


INSERT INTO [VideoTags] ([tag]) VALUES ('#food');
INSERT INTO [VideoTags] ([tag]) VALUES ('#study');
INSERT INTO [VideoTags] ([tag]) VALUES ('#learning');
INSERT INTO [VideoTags] ([tag]) VALUES ('#vlog');
INSERT INTO [VideoTags] ([tag]) VALUES ('#lifestyle');
INSERT INTO [VideoTags] ([tag]) VALUES ('#muji');
INSERT INTO [VideoTags] ([tag]) VALUES ('#apple');
INSERT INTO [VideoTags] ([tag]) VALUES ('#sql');
INSERT INTO [VideoTags] ([tag]) VALUES ('#data');
INSERT INTO [VideoTags] ([tag]) VALUES ('#database');
INSERT INTO [VideoTags] ([tag]) VALUES ('#fun');




                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              