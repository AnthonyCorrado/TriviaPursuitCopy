class BarsController < ApplicationController

	def index
		@bars = Bar.all
		client = Yelp::Client.new
		@all_bars = Yelp.client.search(55122, term: "bar trivia").businesses
		@all_bars_location = Yelp.client.search(90025, term: "bar trivia").region.center
		Bar.destroy_all
		@all_bars.each do |b|
			Bar.create([{
				name: b.name,
				street: b.location.display_address[0],
				city_state_zip: 	
					if b.location.display_address[2]
						b.location.display_address[2]
					else
						b.location.display_address[1]
					end,
				phone: b.phone,
				day: 'tuesday',
				time: '7:00pm',
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
		Bar.create(params.require(:bar).permit(:biz_id, :name, :street, :city_state_zip, :day, :time, :theme, :web, :lat, :lon)) if params[:status]
		redirect_to bars_path(@bar)
	end

	def edit
		@bar = Bar.find(params[:id])
	end

	def update
		@bar = Bar.find(params[:id])
		if @bar.update(params.require(:bar).permit(:biz_id, :name, :street, :city_state_zip, :day, :time, :theme, :web, :lat, :lon))
			redirect_to bars_path
		else
			render 'edit'
		end
	end

# 	def update  
#   @product = Product.find_by_id(params[:id])
#   @product.update_attributes(params[:product])
#   flash[:success] = "Product donated!"
# end

	def destroy
		Bar.find(params[:id]).destroy
		redirect_to bars_path
	end

	# def search
 #    	parameters = { term: params[:term], limit: 16 }
 #    	render json: Yelp.client.search('San Francisco', parameters)
 #  	end
	# def storeCallback
	# 	Bar.destroy_all
	# 		bars = Bar.create([{
	# 			biz_id: y,
	# 			name: Yelp.client.search('Santa Monica', {term:'bar trivia'}).businesses[y].name,
	# 			street: Yelp.client.search('Santa Monica', {term:'bar trivia'}).businesses[y].location.display_address[0],
	# 			city_state_zip: Yelp.client.search('Santa Monica', {term:'bar trivia'}).businesses[y].location.display_address[2],
	# 			day: 'tuesday',
	# 			time: '8:00pm',
	# 			theme: 'general',
	# 			web: Yelp.client.search('Santa Monica', {term:'bar trivia'}).businesses[y].url,
	# 			lat: Yelp.client.search('Santa Monica', {term:'bar trivia',limit: 1, offset:y}).region.center.latitude,
	# 			lon: Yelp.client.search('Santa Monica', {term:'bar trivia',limit: 1, offset:y}).region.center.longitude}
	# 			])
	# 		y += 1
	# 	end
	# end

end 
