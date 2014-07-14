# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
client = Yelp::Client.new
	@all_bars = Yelp.client.search(90025, term: "bar trivia").businesses
	@all_bars_location = Yelp.client.search(90025, term: "bar trivia").region.center
	Bar.destroy_all
	@all_bars.each do |b|
		sleep(0.1)
		@bar_data = b.location.display_address
		@addy = @bar_data[2] || @bar_data[1]
		@bars = Bar.create([{
			name: b.name,
			full_address: @bar_data[0] + ", " + @addy,
			phone: b.phone,
			day: 'N/A',
			time: 'N/A',
			theme: 'general',
			web: b.url,
			}])
	end