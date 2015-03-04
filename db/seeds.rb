# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
activityTypes = ActivityType.create([{name: "Sulkapallo"}, {name: "Tennis"}, {name: "Juoksu"}, {name: "Hiihto"}, {name: "Pingis"}, {name: "Suunnistus"}, {name: "Uinti"}])

user = User.create({email: "roope.hakulinen@gmail.com", password: "password", authentication_token: "abcdefghijklmopqrstuvwxyz"})
Activity.create(organizer: user, from: Time.now+1.hour, to: Time.now+2.hour, activity_type: activityTypes[0])
Activity.create(organizer: user, from: Time.now+1.day, to: Time.now+2.day, activity_type: activityTypes[1])
Activity.create(organizer: user, from: Time.now+1.day, to: Time.now+2.day, activity_type: activityTypes[2])