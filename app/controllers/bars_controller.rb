class BarsController < ApplicationController

	def index
		@bars = Bar.all
			@zip_search = params[:zipcode]
      client = Yelp::Client.new
      if @zip_search != nil
        @all_bars = user_search_fill(@zip_search)
      end

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