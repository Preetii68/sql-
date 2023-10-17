CREATE TABLE NEWS_articles (
    article_id INT PRIMARY KEY,
    article_title TEXT,
    article_content TEXT,
    publication_date date,
    source TEXT
);

insert into news_article (article_id,article_title,article_content,publication_date,source)
values(25,'IIFL Securities gains after huge block deal','For the June quarter, the company reported a 71.3 YoY percent increase in net profit at Rs 74.7 crore.','2021-07-07','news paper'),
(27,'Vodafone sinks as Q1 net loss widens to Rs 7,840 crore','The cash-strapped company said that it had received communication from a promoter group entity promising financial support of up to Rs 2,000 crore if required to meet payment obligations.','2020-04-07','social media'),
(39,'IndiGo shares fly down 4.5% after Rs 4,837-cr share sale likely by Gangwal family','The Gangwal Family s ongoing stake negative exercise began in September last year after Rakesh Gangwal stepped down from the board of Interglobe Aviation in February 2022','2020-04-29','news paper'),
(34,'Tejas Networks shares up 6% on purchase order of Rs 7,492 crore from TCS','Tejas Networks shares were up 6 percent in early trade after the company executed the master contract with Tata Consultancy Services (TCS) towards supply, support, and annual maintenance services of Radio Access Network equipment for BSNL’s Pan-India 4G/5G network for approximately 100,000 sites.','2020-07-13','Television news'),
(42,'ITC shares gain on positive net profit numbers, valuations keep brokerages bullish on the stock','ITC shares were up 1.37 percent at Rs 455.35 after the FMCG conglomerate ITC reported a 17 percent increase in net profit for the June quarter over the last year at Rs 4,902.74 crore.','2022-11-26','social media'),
(35,'Adani stocks decline, group market cap falls by Rs 25,000 crore','Shares of Adani Enterprises, the group flagship company, fell as much as 5.4% in early trades Monday before closing 3.3% lower at ₹2,456. Adani Ports & SEZ shares banned almost 2% to close at ₹787.','2022-08-07','google source'),
(47,'Subhash Chandra, Punit Goenka cannot hold director position in group cos: Sebi','The Zee stock has climbed more than 13% in the past five trading sessions after the NCLT approved its merger with Sony. The bulk of the recent gains at Zee, which has a market capitalization in excess of ₹26,000 crore, is attributed to investor optimism that regulators would approve the merger.','2021-05-27','google source'),
(37,'Popular cough syrups banned shelves after India bans 14 fixed dose drug combinations','In a move which was in the making for the past few months, the government citing lack of therapeutic rationale banned several medicines used to treat coughs, colds and respiratory infections. It clamped down mainly on cough syrups, banning at least 10 combinations available in the market including all those that contain codeine, an opioid pain reliever.','2021-05-11','news paper'),
(41,'Double-digit growth could become difficult this year, see momentum once uncertainty ends: TCS CEO Krithivasan','The TCS CEO expects growth momentum to return once uncertainty ends in major markets such as the US and added that they will have better visibility in the second half of the year in a quarter or two.','2022-12-13','news paper'),
(45, 'New Research Findings on Climate Change', 'A team of scientists has published a groundbreaking study on the effects of climate change...','2023-04-25','magazine'),
(29, 'Local Artists Exhibition Opens at Art Gallery', 'The works of the renowned local artist John Smith are now on display at the city art gallery...','2023-02-17','newspaper'),
(33,'Bharat Biotech recalls batch of its rabies vaccine due to theft of several vials','Bharat Biotech stressed that this voluntary action is being taken in accordance with the principle of abundant precaution, keeping patient safety and the public interest in mind.','2020-06-09','Television');

CREATE TABLE SocialMediaPosts (
    postid INT PRIMARY KEY,
    userid INT,
    postcontent TEXT,
    postdate DATE,
    post TEXT
);

insert into sm_post(post_id,user_id,post_containt,post_date,platform)
values(551,'25AMZ44721','IIFL Securities gains after huge block deal','2023-05-13','facebook'),
(624,'29AMZ98745','Vodafone sinks as Q1 net loss widens to Rs 7,840 crore','2022-11-04','tweeter'),
(678,'27AMZ45874','IndiGo shares fly down 4.5% after Rs 4,837-cr share sale likely by Gangwal family','2022-10-13','instagram'),
(657,'26AMZ75486','Tejas Networks shares up 6% on purchase order of Rs 7,492 crore from TCS','2023-01-24','facebook'),
(758,'28AMZ14754','ITC shares gain on positive net profit numbers, valuations keep brokerages bullish on the stock','2023-05-09','tweeter'),
(553,'25AMZ44721','Adani stocks decline, group market cap falls by Rs 25,000 crore','2023-05-13','facebook'),
(428,'25AMZ97581','Subhash Chandra, Punit Goenka cannot hold director position in group cos: Sebi','2023-05-14','instagram'),
(963,'24AMZ24785','Popular cough syrups banned shelves after India bans 14 fixed dose drug combinations','2023-01-23','facebook'),
(414,'27AMZ45874','Double-digit growth could become difficult this year, see momentum once uncertainty ends: TCS CEO Krithivasan','2022-12-28','tweeter'),
(458,'26AMZ75486','Bharat Biotech recalls batch of its rabies vaccine due to theft of several vials','2020-06-09','instagram'),
(559,'25AMZ44721','Networks shares up 6% on purchase recalls batch of its rabies share sale likely by Gangwal family','2022-12-26','tweeter'),
(754,'26AMZ47896','Annual Fashion Show Highlights Local Designer Creations','2023-02-17','tweeter'),
(799,'27AMZ54781','Best-Selling Author Releases New Fantasy Novel','2023-01-24','facebook');

create table sentiment_score
(
stock_id int,
article_id int,
post_id int,
sm_score decimal(6,4),
foreign key (article_id) REFERENCES news_article(article_id),
foreign key (post_id) REFERENCES sm_post(post_id),
foreign key (stock_id) REFERENCES companies(score_id)
);

insert into sentiment_score(stock_id,article_id,post_id,sm_score)
values(112,25,null,-1.71),(126,null,559,3.27),
(119,34,null,0.571),(134,35,null,2.797),(128,37,null,-5.547),
(131,47,null,-3.24),(111,42,null,-3.429),(123,null,551,7.57),
(111,null,428,-10.114),(126,41,null,12.75),(128,null,624,-7.27),
(112,null,553,8.675),(119,null,458,3.245),(114,null,657,9.671),
(117,39,null,-1.776),(123,27,null,1.7571),(114,33,null,-6.71),
(117,null,963,-9.1785),(131,null,414,4.996),(134,null,678,-1.7227),
(139,45,null,2.75),(137,null,799,2.991),(120,29,null,4.141),(127,null,754,5.145);

CREATE TABLE Companies (
    companyId INT PRIMARY KEY,
    company_name VARCHAR(255),
    stock_Id INT
);

insert into companies(company_id,cmp_name,score_id)
values(57984,'IIFL',114),(59741,'VODAFONE',126),
(64785,'INDIGO',119),(54789,'TEJAS NETWORK',112),(56745,'ITC',117),
(58421,'ADANI GROUP',131),(56421,'ZEE COMPANY',134),(53247,'NACTO PHARMA',128),
(59647,'TCS',137),(64723,'BHARAT BIOTECH',123),
(67845,'Construction Enterprises',127),(79415, 'Financial Services Ltd.', 111),
(53810, 'Fashion Forward Brands', 120),(61441, 'Logistics Solutions Inc.', 139);	

#1- retrive all article and crossponding sentiments score
SELECT
    na.article_id, na.article_title, na.article_content, ss.sentimentScore FROM NEWS_articles AS na
JOIN SentimentScores AS ss ON na.article_id = ss.articleId;

#2-lists all social media post and there associated sentiment score
SELECT
    smp.postid, smp.userid, smp.postcontent, smp.postdate, smp.post, ss.sentimentScore
FROM
    SocialMediaPosts AS smp
JOIN
    SentimentScores AS ss ON smp.postid = ss.postId;

#3-how many postive sentiment article are there each company

#4-find the aveg sentiment scr for each company artcle, post

#5-which co has the sentiment scr in there article

#6- identify the top 5 article with the most postive sentiment

