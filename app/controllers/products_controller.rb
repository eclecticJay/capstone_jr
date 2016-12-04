class ProductsController < ApplicationController
	before_action :authenticate_admin!, only: [:create, :update, :destroy, :new, :edit]
	def index
		# if session[:user_id]
		# 	@user = User.find(session[:user_id])
		# end
		# if params["sort_attribute"] == 'price'
		# 	@products = Product.order(price: :desc)
		# elsif params["lowest_attribute"] == 'low'
		# 	@products = Product.order(:price)
		# elsif params["discount_item"] == 'for_the_low'
		# 	@products = Product.where("price < ?", 2 )
		# elsif params["name_title"] == 'order'
		# 	@products = Product.order(:name)
		# elsif 
		# 	@products = Product.where("name LIKE ?","%#{params['search']}%")
		if params[:category]
			category_name = params[:category]
			category = Category.find_by(name: category_name)
			@products = category.products
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
		@product = Product.new
	end

	def create
	#make a new recipe from the params
	
	@product = Product.new({ name: params["name"], 
		price: params["price"], 
		description: params["description"], 
		supplier_id: params["supplier_id"], 
		user_id: current_user.id})
	 	if @product.save #happy path
		# render 'create.html.erb'
		#add a flash message
		flash[:success] = "New product created"
		redirect_to "/products/#{product.id}"
		else
		render "new.html.erb"
		end
	end

	def edit 
		@product = Product.find_by(id: params[:id])
	end

	def update
		@product = Product.find_by( id: params["id"])
		if @product.update(name: params["name"], price: params["price"], description: params["description"], supplier_id: params["supplier_id"],)
			# render 'update.html.erb'
			flash[:info] = "Item has been updated"
			redirect_to "/products/#{product.id}"
		else
			render "edit.html.erb"
		end
	end

	def destroy
		redirect_to "/products"
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
