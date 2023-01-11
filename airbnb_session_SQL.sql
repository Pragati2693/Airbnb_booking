select replace(ds, '-','/') from session_airbnb2;
update session_airbnb2 set ds = replace(ds,'-','/');
select * from session_airbnb2;
update session_airbnb2 set ds = date_format(str_to_date(ds,'%d/%m/%Y'),'%Y-%m-%d');
select cast(ds as date) from session_airbnb2;
alter table session_airbnb2 modify column ds date ;
desc session_airbnb2;
update session_airbnb2 set ts_min = replace(ts_min,'-','/');
select ts_min from session_airbnb2;
update session_airbnb2 set ts_min = str_to_date(ts_min,'%d/%m/%Y %H:%i') ;
select ts_min from session_airbnb2;
alter table session_airbnb2 modify column ts_min datetime;
update session_airbnb2 set ts_max = str_to_date(ts_max,'%d-%m-%Y %H:%i');
alter table session_airbnb2 modify column ts_max datetime;
alter table session_airbnb2 add column time_spend float after ts_max;
update session_airbnb2 set time_spend = timediff(ts_max,ts_min)/100;
select * from session_airbnb2;
alter table session_airbnb2 rename column ï»¿id_visitor to visitors_id;
-- Total number of the visitors is 630 as per below query
select count(distinct visitors_id) as total_vis from session_airbnb2;
-- "f70f0c27-6af3-4fb5-8bd7-f73240465fd5" id visited
-- second is 431 , third is 412, fourth is 340 and fifth is 276
select visitors_id, count(visitors_id) as total_visit from session_airbnb2 group by visitors_id order by total_visit desc;
-- f70f0c27-6af3-4fb5-8bd7-f73240465fd5 visited for approx 420 hrs in whole journey which is highest 
-- he did search 8 times, sent sms 84 times and booking 0 
-- while second user visited 51 hrs, did search 21 times, sent sms 34 times and booked 6 times
select visitors_id, sum(time_spend)/60 as total_time, sum(did_search),sum(sent_message),sum(sent_booking_request)  
from session_airbnb2 group by visitors_id order by total_time desc;
-- user who did the maximum number of booking is 15 times and second is 14 times while thirsd is 6 times
select visitors_id, sum(sent_booking_request)  as did_booking
from session_airbnb2 group by visitors_id order by did_booking desc;
-- user who did booking max(15) visited 89 times, spent 30 hrs, did 28 searches, sent 28 sms and did 15 booking req
select visitors_id,count(id_session), sum(sent_booking_request)  as did_booking, sum(time_spend)/60 as time_hr,
sum(did_search), sum(sent_message), sum(sent_booking_request)
from session_airbnb2 group by visitors_id order by did_booking desc;
-- conversion rate wrt total sessions is 1.8%
 select sum(sent_booking_request) as total_booking, count(id_session) as total_sessions, sum(sent_booking_request)/count(id_session) as conversion_rate_session from session_airbnb2;
 -- conversion rate for booking wrt sent sms is 11.3% 
 select sum(sent_message) as t_sms_sent, sum(sent_booking_request) as t_booking_sms,
sum(sent_booking_request)/sum(sent_message) as conersion_rate_sms_sent from session_airbnb2;
-- convesrion rate when user did search and sent sms is 28.2%
select count(id_session) as t_search_sms, sum(sent_booking_request) as t_booking,
sum(sent_booking_request)/count(id_session) as conversion_search_sms from session_airbnb2 where did_search = 1 and sent_message =1;
-- conversion_rate for booking wrt search  is 11.7%
select sum(sent_booking_request)/ sum(did_search) as conersion_search from session_airbnb2;
-- average time taken by each users who did booking - highest is 203 and lowest 0
select t.visitors_id, sum(t.time_spend), sum(t.sent_booking_request), sum(t.time_spend)/sum(t.sent_booking_request) as avg_time
from (select * from session_airbnb2 where sent_booking_request = 1) t
 group by t.visitors_id order by avg_time desc;
