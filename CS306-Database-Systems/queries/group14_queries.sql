SELECT account.mail,account.account_id,ticket.flight_time,buy.purchase_date,DATEDIFF(ticket.flight_time,buy.purchase_date) AS date_difference
FROM account
JOIN buy ON buy.account_id = account.account_id
JOIN ticket ON ticket.ticket_id = buy.ticket_id
WHERE DATEDIFF(ticket.flight_time,buy.purchase_date) < 365;


SELECT buy.account_id,ticket.startpoint,ticket.destination,company.company_name 
FROM ticket 
JOIN buy ON buy.ticket_id = ticket.ticket_id 
JOIN company ON company.company_id = ticket.company_id and (ticket.startpoint = "Istanbul" or ticket.destination = "Istanbul");

SELECT T.flight_id, COUNT(*) AS occupied_seat,T.startpoint,T.destination
FROM ticket T, buy B
WHERE B.ticket_id = T.ticket_id
GROUP BY T.flight_id,T.startpoint,T.destination;

SELECT COUNT( DISTINCT T.flight_id)
FROM ticket T, campaign CA
WHERE T.flight_id = CA.flight_id AND T.ticket_price - (T.ticket_price  * CA.percentage / 100) < 500;

SELECT COUNT(DISTINCT POI.place_to_eat)
FROM company C, ticket T, points_of_interest POI
WHERE C.company_id = T.company_id AND POI.ticket_id = T.ticket_id
AND C.company_name = "Turkish Airlines";

Select ticket.ticket_id,company.company_name,company.company_id,ticket.ticket_price
From ticket INNER JOIN company ON ticket.company_id = company.company_id
Group BY ticket.ticket_id,ticket.ticket_price, ticket.company_id
HAVING ticket.ticket_price > (Select AVG(T.ticket_price)
                              FROM (Select ticket.ticket_price
                                   From ticket INNER JOIN company ON ticket.company_id = company.company_id
                                   GROUP BY ticket.ticket_price) as T);

SELECT 
account.account_id,
    account.mail,
    shopping_history.company_name,
    shopping_history.ticket_from,
    shopping_history.ticket_to,
    ticket.flight_time
FROM 
	account
JOIN shopping_history ON account.account_id = shopping_history.account_id
JOIN ticket ON ticket.ticket_id = shopping_history.ticket_id;

SELECT company.company_name, ticket.startpoint,ticket.destination,ticket.flight_time,ticket.ticket_price - (ticket.ticket_price*campaign.percentage)/100  AS derived_price,campaign.flight_id
FROM campaign,company,ticket
WHERE campaign.flight_id = ticket.flight_id and company.company_id = ticket.company_id
GROUP BY flight_id;

SELECT A.mail FROM account A, ticket T, Buy B 
WHERE A.account_id = B.account_id AND B.ticket_id = T.ticket_id AND flight_id = 11;

Select C.company_id, A.longitude, A.latitude
From account A,ticket T, shopping_history S, company C
WHERE A.account_id = S.account_id AND T.ticket_id = S.ticket_id AND C.company_id = T.company_id AND A.longitude > 32.000 AND A.latitude < 42.000;

Select ticket.flight_time, ticket.company_id, ticket.flight_id
FROM ticket
WHERE ticket.ticket_id NOT IN (Select T.ticket_id
                                   FROM ticket T, shopping_history S, buy B
                                   WHERE T.ticket_id = S.ticket_id AND B.purchase_date = S.purchase_date);

Select T.company_id, COUNT(T.ticket_id) ,T.flight_id, T.flight_time
  FROM (Select  ticket.company_id, ticket.ticket_id , ticket.flight_id, ticket.flight_time
        FROM ticket
        WHERE ticket.ticket_id NOT IN (Select T.ticket_id
                                       FROM ticket T, shopping_history S, buy B
                                       WHERE T.ticket_id = S.ticket_id AND B.purchase_date = S.purchase_date)) as T
  GROUP BY T.company_id, T.flight_time, T.flight_id;

SELECT shopping_history.account_id, SUM(ticket.ticket_price) AS Spent 
FROM shopping_history JOIN ticket ON ticket.ticket_id = shopping_history.ticket_id 
GROUP BY shopping_history.account_id;

SELECT ticket.ticket_id, campaign.campaign_id, company.company_name, ticket.flight_id 
FROM ticket JOIN campaign ON ticket.company_id = campaign.company_id AND ticket.flight_id=campaign.flight_id 
JOIN company ON company.company_id = campaign.company_id;

SELECT ticket.startpoint,company.company_name,points_of_interest.place_to_visit,points_of_interest.place_to_eat,points_of_interest.place_to_stay,points_of_interest.transportation_easiness 
FROM ticket 
JOIN points_of_interest ON points_of_interest.ticket_id = ticket.ticket_id JOIN company ON company.company_id = ticket.company_id and ticket.startpoint = "Istanbul";

SELECT shopping_history.account_id, ticket.startpoint, ticket.destination, ticket.ticket_id, company.company_name
FROM shopping_history JOIN ticket ON shopping_history.ticket_id=ticket.ticket_id JOIN company ON ticket.company_id=company.company_id 
WHERE ticket.startpoint='Izmir' AND ticket.destination='Istanbul' AND company.company_id=8;

SELECT ticket.ticket_id, shopping_history.account_id, ticket.ticket_price , campaign.percentage 
FROM shopping_history 
JOIN ticket ON shopping_history.ticket_id = ticket.ticket_id JOIN campaign ON campaign.company_id = ticket.company_id;

CREATE TRIGGER buy_ise_history
AFTER INSERT ON buy
FOR EACH ROW
	INSERT INTO shopping_history(account_id,ticket_id,purchase_date) VALUES (new.account_id,new.ticket_id,new.purchase_date);





