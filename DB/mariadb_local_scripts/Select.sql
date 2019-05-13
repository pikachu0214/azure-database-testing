
select * from event;
select * from category;
select * from event_type;
select * from Registration;
select * from Workshop;
select * from workshop_event;
select * from Country;
select * from Participants;


/*Category and Event*/
select * from event inner join category on category.id = event.categoryId;

/*Workshop, Event, Workshop_Event Join Tables*/
select event.id, workshop.id, workshop.name, event.name as 'Event Name', event.start_date, event.end_date 
from workshop_event join workshop on (workshop.id = workshop_event.workshopId)
									  join event on (event.id = workshop_event.eventId);
									  



