# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
PhoneNumber.find_or_create_by(pattern: '.*', order: 999, status: :mobile)
PhoneNumber.find_or_create_by(pattern: '.*9$', order: 1, status: :bad_number)
PhoneNumber.find_or_create_by(pattern: '.*8$', order: 2, status: :landline)