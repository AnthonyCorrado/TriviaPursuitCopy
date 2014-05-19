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
end



