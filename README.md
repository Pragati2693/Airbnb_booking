# Airbnb_booking
The dataset "Airbnb' is taken from http://insideairbnb.com/get-the-data/ . This dataset contains information abiut the users visited airbnb site in year 2104-2015 in UK.
It has user id, session id, device used, minum and maximun time the session was active, did_search, user sent sms, did booking.
### The dataset answers below question in the MySQL code:
Q1 - Total number of the unique users.<br/>
A1 - 630.

Q2 - Maximum of the total time spent by user combining all his session.<br/>
A2 - 420 hrs, this user search site 8 time, sent sms 84 times and did 0 booking.

Q3 - Total time spend by each users in all sessions.<br/>
A3 - New column added as "Time_Spent"

Q4 - Conversion rate: <br/>Total booking with respect to count of session id is: 1.8% <br/>
                      Conversion rate(did booking) with respect to SMS sent: 11.3%   <br/>
                      Conversion rate(did booking) with respect to did_search: 11.7% <br/>
		      Conversion rate(did booking) with respect to user whi did search and sent SMS: 28.2%
									
Q5- Information of the user who did maximum booking <br/>
A5 - Maximum number of booking by a user is 15, visited the site 89 times, spent a total of 30 hrs in 1 year, did 28 searches, sent 28 sms

Q6 - Average time spent by users who did booking <br/>
A6 - 203 mins or  3.38 hrs

Insights from BpowerBI report:
1. Among the top 10 user who visited the sites maximum number of times, the top user visited the site 702 times <br/>
2. Maximum number of booking is done in December which is 22 bookings.<br/>
3. total number of visites on site is 7756, total number of searches are 1236, total sms sent is 1279, total number of booking is 145
4. i-phone is used by the users maximum number of times and sms sent is done mostly via i-phone but searching and booking is done with Desktop maximum number of times.<br/>
5. Infirmation of top 12 bookings: Top 12 booking ranges from 15 to 4, time spent per booking for these 12 bookings ranges from 2 hrs to 7hrs.<br/>
