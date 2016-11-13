class ProductsController < ApplicationController
	def index
		@products = Product.all
		render 'product.html.erb'
	end
	
	def show
		# p params
		@product = Product.find_by(id: params[:id] )
		render 'show.html.erb'
	end

	def new
		render 'new.html.erb'
	end

	def create
	#make a new recipe from the params
	@product = Product.new({name: params["name"], price: params["price"]})
	 @product.save
		render 'create.html.erb'
	end

	def edit 
		@product = Product.find_by(id: params[:id])
		render 'edit.html.erb'
		@product.update
	end

	def update
		@product = Product.find_by( id: params["id"])
		@product.update(name: params["name"], price: params["price"])
		render 'update.html.erb'
	end

	def destroy
		#grab the right product
		@product = Product.find_by( id: params["id"])
		#kill it 
		@product.destroy
		render 'destory.html.erb'
	end

end
