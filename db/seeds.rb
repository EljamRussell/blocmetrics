require 'faker'

10.times do
	RegisteredApplication.create!(
		name: Faker::Lorem.word,
		url: Faker::Internet.url,
		user: User.first
		)
end

registered_applications = RegisteredApplication.all

20.times do
	Event.create!(
		name: Faker::Lorem.sentence,
		registered_application: registered_applications.sample
		)
end

puts "Seed finished"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
