class BarsController < ApplicationController

	def index
		@bars = Bar.all
		client = Yelp::Client.new
		@all_bars = Yelp.client.search(90025, term: "bar trivia").businesses
		@all_bars_location = Yelp.client.search(90025, term: "bar trivia").region.center
		Bar.destroy_all
		@all_bars.each do |b|
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
			# @all_bars_location.each do |l|
			# 	Bar.create([{
			# 	lat: l.latitude,
			# 	lon: l.longitude
			# 	}])
			# end


	end

	def show
		@bar = Bar.find(params[:id])
	end

	def new
		@bar = Bar.new
	end

	def create
		Bar.create(params.require(:bar).permit(:name, :full_address, :phone, :day, :time, :theme, :web, :latitude, :longitude, :coordinates)) if params[:status]
		redirect_to bars_path(@bar)
	end

	def edit
		@bar = Bar.find(params[:id])
	end

	def update
		@bar = Bar.find(params[:id])
		if @bar.update(params.require(:bar).permit(:name, :full_address, :phone, :day, :time, :theme, :web, :latitude, :longitude, :coordinates))
			redirect_to bars_path
		else
			render 'edit'
		end
	end

	def destroy
		Bar.find(params[:id]).destroy
		redirect_to bars_path
	end

end 
