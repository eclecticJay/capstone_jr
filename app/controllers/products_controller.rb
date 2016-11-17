class ProductsController < ApplicationController
	def index
		@products = Product.all
		render 'index.html.erb'
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
	product = Product.new({ image: params["image"], name: params["name"], price: params["price"], decription: params["description"], stock: params["stock"]})
	 	product.save
		# render 'create.html.erb'
		#add a flash message
		flash[:success] = "New product created"
		redirect_to "/products/#{product.id}"
	end

	def edit 
		@product = Product.find_by(id: params[:id])
		flash[:warning] = "You are editing your item"
		render 'edit.html.erb'
	end

	def update
		product = Product.find_by( id: params["id"])
		product.update(image: params["image"], name: params["name"], price: params["price"], decription: params["description"], stock: params["stock"])
		# render 'update.html.erb'
		flash[:info] = "Item has been updated"
		redirect_to "/products/#{product.id}"
	end

	def destroy
		#grab the right product
		product = Product.find_by( id: params["id"])
		#kill it 
		product.destroy
		# render 'destory.html.erb'
		flash[:danger] = "Item destroyed"
		redirect_to "/products"
	end

end
