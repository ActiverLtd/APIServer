activityTypes = ActivityType.create(
		[
				{name: 'Sulkapallo', style: 'background-color: gray;'},
				{name: 'Tennis', style: 'background-color: blue;'},
				{name: 'Juoksu', style: 'background-color: orange;'},
				{name: 'Hiihto', style: 'background-color: yellow;'},
				{name: 'Pingis', style: 'background-color: black;'},
				{name: 'Suunnistus', style: 'background-color: green;'},
				{name: 'Uinti', style: 'background-color: red;'}
		]
)

roope = User.create({email: 'roope.hakulinen@gmail.com', password: 'password', authentication_token: 'abcdefghijklmopqrstuvwxyz'})
activity1 = Activity.create(organizer: roope, from: Time.now + 1.hour, to: Time.now + 2.hour, activity_type: activityTypes[0], location_name: 'Keskustori', lat: 61.498172, lng: 23.761092, participant_count: 4, required_level: 3.0)
activity2 = Activity.create(organizer: roope, from: Time.now + 1.day, to: Time.now + 2.day, activity_type: activityTypes[1], location_name: 'Pispalan portaat', lat: 62.498172, lng: 22.761092, participant_count: 2)
activity3 = Activity.create(organizer: roope, from: Time.now + 1.day, to: Time.now + 2.day, activity_type: activityTypes[2], location_name: 'Koiviston koulu', lat: 60.498172, lng: 25.761092, participant_count: 6, required_level: 3.0)

user2 = User.create({email: 'user2@example.com', password: 'password', authentication_token: 'abcdefghijklmopqrstuvwxyz2'})
user3 = User.create({email: 'user3@example.com', password: 'password', authentication_token: 'abcdefghijklmopqrstuvwxyz3'})
user4 = User.create({email: 'user4@example.com', password: 'password', authentication_token: 'abcdefghijklmopqrstuvwxyz4'})
user5 = User.create({email: 'user5@example.com', password: 'password', authentication_token: 'abcdefghijklmopqrstuvwxyz5'})
user6 = User.create({email: 'user6@example.com', password: 'password', authentication_token: 'abcdefghijklmopqrstuvwxyz6'})

Suggestion.create(activity: activity1, user: user2, status: :match)
Suggestion.create(activity: activity1, user: user3, status: :match)
Suggestion.create(activity: activity2, user: user2, status: :invited)
Suggestion.create(activity: activity2, user: user3, status: :invited)