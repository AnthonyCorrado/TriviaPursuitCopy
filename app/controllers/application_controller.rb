class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

include ApplicationHelper

def authenticate_user
	if !self.current_user
		redirect to new_session_path
	end
end

def auto_fill_index
	client = Yelp::Client.new
	@all_bars = Yelp.client.search(90025, term: "bar trivia").businesses
	@all_bars_location = Yelp.client.search(90025, term: "bar trivia").region.center
	Bar.destroy_all
	@all_bars.each do |b|
		sleep(0.1)
		@bar_data = b.location.display_address
		@addy = @bar_data[2] || @bar_data[1]
		Bar.create([{
			name: b.name,
			full_address: @bar_data[0] + ", " + @addy,
			phone: b.phone,
			day: 'N/A',
			time: 'N/A',
			theme: 'general',
			web: b.url,
			}])
		@bar = Bar
	end		
end

def user_search_fill(address)
	client = Yelp::Client.new
	@all_bars = Yelp.client.search(address, term: "bar trivia").businesses
	@all_bars_location = Yelp.client.search(address, term: "bar trivia").region.center
	Bar.destroy_all
	@all_bars.each do |b|
		sleep(0.1)
		@bar_data = b.location.display_address
		@addy = @bar_data[2] || @bar_data[1]
		Bar.create([{
			name: b.name,
			full_address: @bar_data[0] + ", " + @addy,
			phone: b.phone,
			day: 'N/A',
			time: 'N/A',
			theme: 'general',
			web: b.url,
			}])
		@bar = Bar
	end		
end