select event.name, registration.attending_status, registration.employment_status, participants.firstName, 
participants.lastName, participants.age,
participants.gender, participants.email from registration 
join participants on (participants.id = registration.participantId) 
join event on (event.id = registration.eventId);