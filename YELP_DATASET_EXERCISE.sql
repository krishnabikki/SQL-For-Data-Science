Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just 
like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well 
as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting 
and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular 
research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the 
first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate 
and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, 
and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your 
peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) 
to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers 
and code are lined appropriately.In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

select count(*) from table /*** INPLACE OF TABLE REPLACE WITH ACTUAL TABLE NAME TO GET TOTAL COUNTS FOR EACH TABLE IN THE ER DIAGRAM*******/
	
i. Attribute table = 10,000
ii. Business table = 10,000
iii. Category table = 10,000
iv. Checkin table = 10,000
v. elite_years table = 10,000
vi. friend table = 10,000
vii. hours table = 10,000
viii. photo table = 10,000
ix. review table = 10,000
x. tip table = 10,000
xi. user table = 10,000
	


2. Find the total distinct records by either the foreign key or primary key for each table. 
   If two foreign keys are listed in the table, please specify which foreign key.

i. Business = ID(PRIMARY KEY) -> 10,000
ii. Hours = BUSINESS ID(FOREIGN KEY) -> 1562
iii. Category = BUSINESS ID(FOREIGN KEY) -> 2643
iv. Attribute = BUSINESS ID(FOREIGN KEY) -> 1115
v. Review =  ID (PRIMARY KEY) -> 10,000
             BUSINESS ID(FOREIGN KEY) -> 8090
             USER_ID(FOREIGN KEY) -> 9581
vi. Checkin = BUSINESS ID(FOREIGN KEY) -> 493
vii. Photo = ID(PRIMARY KEY) -> 10,000
             USINESS ID(FOREIGN KEY) -> 6493
viii. Tip = USER_ID(FOREIGN KEY) -> 537
            BUSINESS ID(FOREIGN KEY) -> 3979
ix. User = ID(PRIMARY KEY) -> 10,000
x. Friend = USER_ID(FOREIGN KEY) -> 11
xi. Elite_years = USER_ID(FOREIGN KEY) -> 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: 0 RECORDS
	
	
	SQL code used to arrive at answer:

	SELECT COUNT(*) FROM user
	WHERE id IS NULL OR 
		  name IS NULL OR 
		  review_count IS NULL OR 
		  yelping_since IS NULL OR
		  useful IS NULL OR 
		  funny IS NULL OR 
		  cool IS NULL OR 
		  fans IS NULL OR 
		  average_stars IS NULL OR 
		  compliment_hot IS NULL OR 
		  compliment_more IS NULL OR 
		  compliment_profile IS NULL OR 
		  compliment_cute IS NULL OR 
		  compliment_list IS NULL OR 
		  compliment_note IS NULL OR 
		  compliment_plain IS NULL OR 
		  compliment_cool IS NULL OR 
		  compliment_funny IS NULL OR 
		  compliment_writer IS NULL OR 
		  compliment_photos IS NULL 
	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars

	SELECT MIN(STARS),MAX(STARS),AVG(STARS) FROM REVIEW
		
+------------+------------+------------+
| MIN(STARS) | MAX(STARS) | AVG(STARS) |
+------------+------------+------------+
|          1 |          5 |     3.7082 |
+------------+------------+------------+
	
	ii. Table: Business, Column: Stars

	SELECT MIN(STARS),MAX(STARS),AVG(STARS) FROM BUSINESS
	
+------------+------------+------------+
| MIN(STARS) | MAX(STARS) | AVG(STARS) |
+------------+------------+------------+
|        1.0 |        5.0 |     3.6549 |
+------------+------------+------------+
		
	
	iii. Table: Tip, Column: Likes

	SELECT MIN(LIKES),MAX(LIKES),AVG(LIKES) FROM TIP
	
+------------+------------+------------+
| MIN(LIKES) | MAX(LIKES) | AVG(LIKES) |
+------------+------------+------------+
|          0 |          2 |     0.0144 |
+------------+------------+------------+
		
	
	iv. Table: Checkin, Column: Count

	SELECT MIN(COUNT),MAX(COUNT),AVG(COUNT) FROM CHECKIN
	
+------------+------------+------------+
| MIN(COUNT) | MAX(COUNT) | AVG(COUNT) |
+------------+------------+------------+
|          1 |         53 |     1.9414 |
+------------+------------+------------+
		
	
	v. Table: User, Column: Review_count

	SELECT MIN(REVIEW_COUNT),MAX(REVIEW_COUNT),AVG(REVIEW_COUNT) FROM USER
	
+-------------------+-------------------+-------------------+
| MIN(REVIEW_COUNT) | MAX(REVIEW_COUNT) | AVG(REVIEW_COUNT) |
+-------------------+-------------------+-------------------+
|                 0 |              2000 |           24.2995 |
+-------------------+-------------------+-------------------+
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
	SELECT CITY,SUM(REVIEW_COUNT) AS REVIEWS
      FROM BUSINESS
     GROUP BY 1 ORDER BY 2 DESC  
	
	Copy and Paste the Result Below:
	
+-----------------+---------+
| city            | REVIEWS |
+-----------------+---------+
| Las Vegas       |   82854 |
| Phoenix         |   34503 |
| Toronto         |   24113 |
| Scottsdale      |   20614 |
| Charlotte       |   12523 |
| Henderson       |   10871 |
| Tempe           |   10504 |
| Pittsburgh      |    9798 |
| Montréal        |    9448 |
| Chandler        |    8112 |
| Mesa            |    6875 |
| Gilbert         |    6380 |
| Cleveland       |    5593 |
| Madison         |    5265 |
| Glendale        |    4406 |
| Mississauga     |    3814 |
| Edinburgh       |    2792 |
| Peoria          |    2624 |
| North Las Vegas |    2438 |
| Markham         |    2352 |
| Champaign       |    2029 |
| Stuttgart       |    1849 |
| Surprise        |    1520 |
| Lakewood        |    1465 |
| Goodyear        |    1155 |
+-----------------+---------+
(Output limit exceeded, 25 of 362 total rows shown)

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT STARS,SUM(REVIEW_COUNT) AS COUNT
       FROM BUSINESS 
    WHERE CITY = 'Avon' 
    GROUP BY 1 


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

+-------+-------+
| stars | COUNT |
+-------+-------+
|   1.5 |    10 |
|   2.5 |     6 |
|   3.5 |    88 |
|   4.0 |    21 |
|   4.5 |    31 |
|   5.0 |     3 |
+-------+-------+

ii. Beachwood

SQL code used to arrive at answer:

SELECT STARS,SUM(REVIEW_COUNT) AS COUNT
       FROM BUSINESS 
    WHERE CITY = 'Beachwood' 
    GROUP BY 1  


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
	
+-------+-------+
| stars | COUNT |
+-------+-------+
|   2.0 |     8 |
|   2.5 |     3 |
|   3.0 |    11 |
|   3.5 |     6 |
|   4.0 |    69 |
|   4.5 |    17 |
|   5.0 |    23 |
+-------+-------+	


7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	
	SELECT NAME,REVIEW_COUNT
       FROM USER
       ORDER BY 2 DESC
    LIMIT 3

	Copy and Paste the Result Below:
+--------+--------------+
| name   | review_count |
+--------+--------------+
| Gerald |         2000 |
| Sara   |         1629 |
| Yuri   |         1339 |
+--------+--------------+


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	NO, POSING MORE REVIEWS NOT GIVE YOU MORE FANS. WHEN WE OBSERVE BELOW RESULTS SOME CUSTOMERS WHO HAVE MORE REVIEWS HAVE VERY LESS USERS EVEN THOUGH THEY
	YELPING SINCE VERY LONG 

	
	SELECT NAME,REVIEW_COUNT,FANS,YELPING_SINCE
      FROM USER
      ORDER BY FANS DESC

      +-----------+--------------+------+---------------------+
| name      | review_count | fans | yelping_since       |
+-----------+--------------+------+---------------------+
| Amy       |          609 |  503 | 2007-07-19 00:00:00 |
| Mimi      |          968 |  497 | 2011-03-30 00:00:00 |
| Harald    |         1153 |  311 | 2012-11-27 00:00:00 |
| Gerald    |         2000 |  253 | 2012-12-16 00:00:00 |
| Christine |          930 |  173 | 2009-07-08 00:00:00 |
| Lisa      |          813 |  159 | 2009-10-05 00:00:00 |
| Cat       |          377 |  133 | 2009-02-05 00:00:00 |
| William   |         1215 |  126 | 2015-02-19 00:00:00 |
| Fran      |          862 |  124 | 2012-04-05 00:00:00 |
| Lissa     |          834 |  120 | 2007-08-14 00:00:00 |
| Mark      |          861 |  115 | 2009-05-31 00:00:00 |
| Tiffany   |          408 |  111 | 2008-10-28 00:00:00 |
| bernice   |          255 |  105 | 2007-08-29 00:00:00 |
| Roanna    |         1039 |  104 | 2006-03-28 00:00:00 |
| Angela    |          694 |  101 | 2010-10-01 00:00:00 |
| .Hon      |         1246 |  101 | 2006-07-19 00:00:00 |
| Ben       |          307 |   96 | 2007-03-10 00:00:00 |
| Linda     |          584 |   89 | 2005-08-07 00:00:00 |
| Christina |          842 |   85 | 2012-10-08 00:00:00 |
| Jessica   |          220 |   84 | 2009-01-12 00:00:00 |
| Greg      |          408 |   81 | 2008-02-16 00:00:00 |
| Nieves    |          178 |   80 | 2013-07-08 00:00:00 |
| Sui       |          754 |   78 | 2009-09-07 00:00:00 |
| Yuri      |         1339 |   76 | 2008-01-03 00:00:00 |
| Nicole    |          161 |   73 | 2009-04-30 00:00:00 |
+-----------+--------------+------+---------------------+
(Output limit exceeded, 25 of 10000 total rows shown)
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer:
+----------+                    +----------+
| COUNT(*) |                    | COUNT(*) |
+----------+  -->%HATE%			    +----------+    --> %LOVE%
|      232 |                    |     1780 |
+----------+                    +----------+


	
	SQL code used to arrive at answer:
SELECT COUNT(*)                                SELECT COUNT(*) 
       FROM REVIEW 										FROM REVIEW 
    WHERE TEXT LIKE '%LOVE%'                   WHERE TEXT LIKE '%HATE%'  
	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	SELECT ID,NAME,FANS
       FROM USER
      ORDER BY FANS DESC
      LIMIT 10 
	
	Copy and Paste the Result Below:
+------------------------+-----------+------+
| id                     | name      | fans |
+------------------------+-----------+------+
| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
+------------------------+-----------+------+
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. 
CSCompare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
YES TWO GROUPS HAVE DIFFERENT DISTRIBUTION OF HOURS

ii. Do the two groups you chose to analyze have a different number of reviews?
YES TWO GROUPS HAVE DIFFERENT NUMBER OF REVIEWS      
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
BOTH ARE IN DIFFRENT ZIPCODES. BUT BASED ON MY CODE I ONLY GOT 2 RECORDS WHEN I DID GROUPBY. 

PLEASE SUGGEST THE CODE WHICH MAY GIVE THE BETTER RESULTS

SQL code used for analysis:

/*****BELOW 3 LINES OF CODE USED TO PREP MY DATA*******/
SELECT CITY,COUNT(*) FROM BUSINESS GROUP BY 1 ORDER BY COUNT(*) DESC
SELECT CATEGORY,COUNT(*) FROM CATEGORY GROUP BY 1 ORDER BY COUNT(*) DESC
SELECT * FROM HOURS 

SELECT B.CITY,B.NAME,B.STARS,B.REVIEW_COUNT,
       B.POSTAL_CODE,
       H.HOURS,
	   C.CATEGORY
FROM BUSINESS B INNER JOIN HOURS H
     ON B.ID = H.BUSINESS_ID
INNER JOIN CATEGORY C
     ON H.BUSINESS_ID = C.BUSINESS_ID
WHERE (B.CITY = 'Las Vegas' AND C.CATEGORY = 'Restaurants')	 
GROUP BY B.STARS	
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between 
the ones that are still open and 
the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
         OBSERVED WHICH ARE OPEN HAVE MORE REVIEWS,MORE STAR RATING AND ID COUNT THAN THE CLOSED
         
+---------------------+-------------------+-------------------+---------------+---------+---------------+
| COUNT(DISTINCT(id)) | AVG(review_count) | SUM(review_count) |    AVG(stars) | is_open | neighborhood  |
+---------------------+-------------------+-------------------+---------------+---------+---------------+
|                1520 |     23.1980263158 |             35261 | 3.52039473684 |       0 | Downtown Core |
|                8480 |     31.7570754717 |            269300 | 3.67900943396 |       1 |               |
+---------------------+-------------------+-------------------+---------------+---------+---------------+
ii. Difference 2:
         FROM ABOVE OUTPUT WE CAN SAY ALL OF THEM WHICH ARE CLOSED LOCATED AT DOWNTOWN CORE NEIGHBORHOOD
         
         
SQL code used for analysis:
SELECT COUNT(DISTINCT(id)),
	   AVG(review_count),
	   SUM(review_count),
	   AVG(stars),
	   is_open,
	   neighborhood
FROM business
GROUP BY is_open

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, 
predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel 
free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
        
        predicting How many checkins happend for the Restaurants which are having the rating more than 4 in specific city on weekends 
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
        
        I USED 3 data sources BUSINESS, CATEGORY, CHECKIN AND MERGED ALL 3 TABLES ON ID AND BUSINESS_ID. I mainly focused on the 
        name, city, category, stars, date and checkin count to see how many people trying to checkin at particular time on weekends.
        This data mainly will help Restaurants to better understand at what time the more number of people coming to Restaurant so that 
        they will better prepare to acomodate the customers with out delay.
                  
iii. Output of your finished dataset:
+--------------+-----------+-------------+-------+-------------+----------------+-------+---------+
| name         | city      | postal_code | stars | category    | date           | count | WEEKEND |
+--------------+-----------+-------------+-------+-------------+----------------+-------+---------+
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-10:00 |    36 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-10:00 |    36 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Sunday-10:00   |    33 |       2 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Sunday-10:00   |    33 |       2 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Sunday-9:00    |    29 |       2 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Sunday-9:00    |    29 |       2 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-9:00  |    27 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-9:00  |    27 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-23:00 |    25 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-23:00 |    25 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-14:00 |    23 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-14:00 |    23 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-13:00 |    21 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-13:00 |    21 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-0:00  |    20 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-0:00  |    20 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-0:00  |    19 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-0:00  |    19 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-11:00 |    18 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-11:00 |    18 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Saturday-23:00 |    17 |       1 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Saturday-23:00 |    17 |       1 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Sunday-11:00   |    16 |       2 |
| Hibachi-San  | Las Vegas | 89169       |   4.5 | Restaurants | Sunday-11:00   |    16 |       2 |
| Jacques Cafe | Las Vegas | 89134       |   4.0 | Restaurants | Sunday-17:00   |    15 |       2 |
+--------------+-----------+-------------+-------+-------------+----------------+-------+---------+
         
iv. Provide the SQL code you used to create your final dataset:

select B.NAME,B.CITY,B.POSTAL_CODE,B.STARS,
       C.CATEGORY,
	   CH.DATE,CH.COUNT,
	   CASE 
	       WHEN CH.DATE LIKE "%SATURDAY%" THEN 1
		   WHEN CH.DATE LIKE "%SUNDAY%" THEN 2
		END AS WEEKEND   
	FROM BUSINESS B INNER JOIN CATEGORY C
	     ON B.ID = C.BUSINESS_ID
	INNER JOIN CHECKIN CH
	     ON B.ID = C.BUSINESS_ID
WHERE (B.CITY = 'Las Vegas' and B.STARS >=4 AND C.CATEGORY = 'Restaurants')	
AND WEEKEND IN (1,2)
GROUP BY STARS,COUNT
ORDER BY COUNT DESC