# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bar.destroy_all
y = 0
while y < 15 do
	bars = Bar.create([{
		biz_id: y,
		name: Yelp.client.search('Santa Monica', {term:'bar trivia'}).businesses[y].name,
		street: Yelp.client.search('Santa Monica', {term:'bar trivia'}).businesses[y].location.display_address[0],
		city_state_zip: Yelp.client.search('Santa Monica', {term:'bar trivia'}).businesses[y].location.display_address[2],
		day: 'tuesday',
		time: '8:00pm',
		theme: 'general',
		web: Yelp.client.search('Santa Monica', {term:'bar trivia'}).businesses[y].url,
		lat: Yelp.client.search('Santa Monica', {term:'bar trivia',limit: 1, offset:y}).region.center.latitude,
		lon: Yelp.client.search('Santa Monica', {term:'bar trivia',limit: 1, offset:y}).region.center.longitude}
		])
	y += 1
end
		