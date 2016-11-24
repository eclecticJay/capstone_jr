class ProductsController < ApplicationController
	def index
		if session[:user_id]
			@user = User.find(session[:user_id])
		end
		if params["sort_attribute"] == 'price'
			@products = Product.order(price: :desc)
		elsif params["lowest_attribute"] == 'low'
			@products = Product.order(:price)
		elsif params["discount_item"] == 'for_the_low'
			@products = Product.where("price < ?", 2 )
		elsif params["name_title"] == 'order'
			@products = Product.order(:name)
		elsif 
			@products = Product.where("name LIKE ?","%#{params['search']}%")
		else
			@products = Product.all
			render 'index.html.erb'
		end
	end

	def show
		if params["id"] == 'random'
			@product = Product.all.sample
		elsif # p params
			@product = Product.find_by(id: params[:id] )
		end
		render 'show.html.erb'
	end

	def new
		render 'new.html.erb'
	end

	def create
	#make a new recipe from the params
	
	product = Product.new({ name: params["name"], 
		price: params["price"], 
		description: params["description"], 
		supplier_id: params["supplier_id"], 
		user_id: current_user.id})
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
		product.update(name: params["name"], price: params["price"], description: params["description"], supplier_id: params["supplier_id"],)
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

	def search 
		#grab all the items in the db that have my search tearm in them
		content = params["search_content"] 
		@products = Product.where("name LIKE ?","%#{content}%")
		p @products
		render 'index.html.erb'
	end
end
