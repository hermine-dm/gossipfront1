# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = 'fr'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

puts "tout est détruit"

10.times do 
	City.create!(name: Faker::Address.city, zip_code: "#{rand(10..95)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}")
end
puts "creation des villes"
10.times do 
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars(number: 60), email: Faker::Internet.email, age: rand(15..105), city_id: City.all.sample.id)
end
puts "creation des users"

20.times do 
	Gossip.create!(title: Faker::Lorem.characters(number: 10),content:Faker::Lorem.paragraph_by_chars(number: 60), user_id: User.all.sample.id)
end
puts "creation des gossips"

10.times do 
	Tag.create!(title: Faker::Cosmere.shard)
end
puts "creation des tags"

Gossip.all.each{|gsp| JoinTagGossip.create!(gossip_id: gsp.id, tag_id: Tag.all.sample.id)}

10.times do  
	PrivateMessage.create!(content: Faker::Lorem.paragraph, user_id: User.all.sample.id)
end
puts "creation des private message"

20.times do 
	JoinPm.create!(user_id: User.all.sample.id, private_message_id: PrivateMessage.all.sample.id)
end
puts "creation des joins"

Gossip.all.each{|gsp| Comment.create!(content: Faker::GreekPhilosophers.quote, gossip_id: gsp.id, user_id: User.all.sample.id)}
10.times do  
	Comment.create!(content: Faker::GreekPhilosophers.quote, gossip_id: Gossip.all.sample.id, user_id: User.all.sample.id)
end
puts "creation de comments"