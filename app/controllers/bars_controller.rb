class BarsController < ApplicationController
	
	def index
		@bars = Bar.all
	end

	def show
		@bar = Bar.find(params[:id])
	end

	def new
		@bar = Bar.new
	end

	def create
		Bar.create(params.require(:bar).permit(:name, :street, :city, :zip, :day, :time, :theme, :web, :lat, :lon))
		redirect_to bars_path
	end

	def edit
		@bar = Bar.find(params[:id])
	end

	def update
		@bar = Bar.find(params[:id])
		if
			Bar.create(params.require(:bar).permit(:name, :street, :city, :zip, :day, :time, :theme, :web, :lat, :lon))
			redirect_to bars_path
		else
			render 'edit'
		end
	end

	def destroy
		@bar = Bar.find(params[:id])
		@bar.destroy
		redirect_to bars_path
	end
end



