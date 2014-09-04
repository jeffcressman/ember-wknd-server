# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
speaker = Speaker.create(name: 'Mac', email: 'mac@somewhere.com', password: 'password', bio: 'A tall guy')
w1 = Workshop.create(name: 'Getting Started with Ember', speaker: speaker)
w2 = Workshop.create(name: 'Ember-rails', speaker: speaker)

speaker = Speaker.create(name: 'Devito', email: 'devito@somewhere.com', password: 'password', bio: 'A stout guy')
w3 = Workshop.create(name: 'Ember-cli', speaker: speaker)
w4 = Workshop.create(name: 'Ember Views', speaker: speaker)
w5 = Workshop.create(name: 'Ember Routes', speaker: speaker)

speaker = Speaker.create(name: 'Sally', email: 'sally@somewhere.com', password: 'password', bio: 'A smart cookie')
w6 = Workshop.create(name: 'Ember Components', speaker: speaker)
w7 = Workshop.create(name: 'Ember Templates', speaker: speaker)

speaker = Speaker.create(name: 'Gwen', email: 'gwen@somewhere.com', password: 'password', bio: 'Kinder than usual')
w8 = Workshop.create(name: 'Deploying your application', speaker: speaker)
w9 = Workshop.create(name: 'Monitoring your application', speaker: speaker)
w10 = Workshop.create(name: 'Testing your application', speaker: speaker)

guest = Guest.create(name: 'Danny', email: 'danny@somewhere.com', password: 'password')
Registration.create(name: 'Reg for Danny and w1', guest: guest, workshop: w1)
Registration.create(guest: guest, workshop: w4)
Registration.create(guest: guest, workshop: w9)

guest = Guest.create(name: 'Austin', email: 'austin@somewhere.com', password: 'password')
Registration.create(guest: guest, workshop: w1)
Registration.create(guest: guest, workshop: w2)
Registration.create(guest: guest, workshop: w7)
Registration.create(guest: guest, workshop: w10)

guest = Guest.create(name: 'Fay', email: 'fay@somewhere.com', password: 'password')
Registration.create(guest: guest, workshop: w1)
Registration.create(guest: guest, workshop: w3)
Registration.create(guest: guest, workshop: w4)
Registration.create(guest: guest, workshop: w8)
Registration.create(guest: guest, workshop: w9)
Registration.create(guest: guest, workshop: w10)




