# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(username: 'Ping', password: 'pingping', password_confirmation: 'pingping')
brand = Brand.create(username: 'Testing', password: 'testtest', password_confirmation: 'testtest')

brand.jobs.create(title: 'Testing Job')
user.proposals.create(title: 'Testing Proposal', job_id: 1)