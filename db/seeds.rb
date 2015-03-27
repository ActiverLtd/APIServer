# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
activityTypes = ActivityType.create([{name: "Sulkapallo"}, {name: "Tennis"}, {name: "Juoksu"}, {name: "Hiihto"}, {name: "Pingis"}, {name: "Suunnistus"}, {name: "Uinti"}])

roope = User.create({email: "roope.hakulinen@gmail.com", password: "password", authentication_token: "abcdefghijklmopqrstuvwxyz"})
activity1 = Activity.create(organizer: roope, from: Time.now + 1.hour, to: Time.now + 2.hour, activity_type: activityTypes[0])
activity2 = Activity.create(organizer: roope, from: Time.now + 1.day, to: Time.now + 2.day, activity_type: activityTypes[1])
activity3 = Activity.create(organizer: roope, from: Time.now + 1.day, to: Time.now + 2.day, activity_type: activityTypes[2])

user2 = User.create({email: "user2@example.com", password: "password", authentication_token: "abcdefghijklmopqrstuvwxyz2"})
user3 = User.create({email: "user3@example.com", password: "password", authentication_token: "abcdefghijklmopqrstuvwxyz3"})
user4 = User.create({email: "user4@example.com", password: "password", authentication_token: "abcdefghijklmopqrstuvwxyz4"})
user5 = User.create({email: "user5@example.com", password: "password", authentication_token: "abcdefghijklmopqrstuvwxyz5"})
user6 = User.create({email: "user6@example.com", password: "password", authentication_token: "abcdefghijklmopqrstuvwxyz6"})

Suggestion.create(activity: activity1, user: user2, status: :match)
Suggestion.create(activity: activity1, user: user3, status: :match)
Suggestion.create(activity: activity2, user: user2, status: :invited)
Suggestion.create(activity: activity2, user: user3, status: :invited)