select * from duration
select * from loc
select * from payment
select * from trips
select * from trips_details1
select * from trips_details2
select * from trips_details3
select * from trips_details4
select count(tripid)from trips
select count(distinct(driverid)) from trips
with cte as(
select row_number() over (partition by tripid) as rn from trips_details1
)
select * from cte
where rn >1
select sum(fare) from trips
select sum(end_ride) from trips_details1
select a.method  from payment a inner join
(select faremethod,count(distinct tripid) from trips
group by faremethod
order by count(distinct tripid)desc
limit 1)b
on a.id=b.faremethod

select * from trips
select loc_from,loc_to,count(distinct tripid ) from trips 
group by loc_from,loc_to
order by count(loc_to) desc
select * from trips

select *,dense_rank()over(order by fare desc)rnk from
(select driverid,sum(fare) fare from trips 
group by driverid)b

select * from (
select *,rank()over(order by cnt desc ) rnk from (
select duration,count(distinct tripid)cnt from trips
group by duration)b)c 
where rnk = 1
select * from (
select * , rank() over(order by cnt desc) rnk from (select driverid,custid,count(distinct tripid) cnt from trips 
group by driverid,custid)b)c
where rnk =1 
select * from(
select * ,rank()over(order by cnt desc)rnk from(
select loc_from,sum(fare) cnt from trips
group by loc_from)b)c 
where rnk =1 

select * , dense_rank()over(order by can desc) rnk from(select loc_from , count(*)- sum(driver_not_cancelled) can from trips_details1
group by loc_from)b









