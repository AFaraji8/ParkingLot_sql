SELECT *
FROM Parking_guard  
INNER JOIN Parking on Parking_guard.parking_name=Parking.PName;



SELECT a.PName,a.dateC,sum(c.Amount)
FROM Parking_receipt as a INNER JOIN Cost as c
on a.Parking_duration=c.Park_duration AND a.PName=c.Pname
GROUP BY  a.PName,a.dateC;



SELECT PName,park_number,COUNT(CName) as popularity
from Parking_receipt
GROUP by PName,park_number
ORDER BY popularity desc;

SELECT COUNT(id_receipt) as number_of_customers ,Parking.area_number FROM Parking_receipt
INNER JOIN Parking on Parking.PName=Parking_receipt.PName
GROUP by Parking.area_number
ORDER BY number_of_customers;

SELECT Parking_receipt.PName, COUNT(Parking_receipt.id_receipt) as number_of_customers  FROM Parking_receipt
GROUP by Parking_receipt.PName
ORDER BY number_of_customers;



SELECT C.License_Plate ,C.arrival_time,C.departure_time,q.parking_name,q.full_name,q.dateC
FROM Customer AS C INNER JOIN 

(select A.parking_name,A.first_name+' '+A.last_name as full_name ,r.CName,A.start_time,A.finishing_time,r.dateC
from Parking_receipt as r  INNER JOIN Parking_guard as A on  r.PName=A.parking_name) as q
on  C.license_plate=q.CName
where C.departure_time>=q.start_time and C.departure_time<=q.finishing_time;