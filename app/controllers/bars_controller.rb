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
		Bar.create(params.require(:bar).permit(:name, :street, :city, :zip, :day, :time, :theme))
		redirect_to bars_path
	end

	def edit
		@bar = Bar.find(params[:id])
	end

	def update
		@bar = Bar.find(params[:id])
		if
			Bar.create(params.require(:bar).permit(:name, :street, :city, :zip, :day, :time, :theme))
			redirect_to bars_path
		else
			render 'edit'
		end
	end

	def destroy
	end

end
