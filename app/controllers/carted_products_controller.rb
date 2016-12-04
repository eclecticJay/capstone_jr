class CartedProductsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@carted_products = current_user.carted_products.where(status:"carted")
		if @carted_products.count < 1
			redirect_to "/products"
			flash[:warning] = "you have nothing there silly one"
		else
			render 'index.html.erb'
		end
	end

	def create
		carted_products = CartedProduct.new({ 
		quantity: params["quantity"],
		user_id: current_user.id,
		product_id: params["product_id"],
		status: "carted"})
	 	carted_products.save
		# render 'create.html.erb'
		#add a flash message
		flash[:success] = "Added Product to cart"
		redirect_to "/carted_products"
	end

	def show
		@carted_products = CartedProduct.find(params[:id])
	end

	def destroy
		carted_product = CartedProduct.find(params[:id])
		carted_product.status = "removed"
		carted_product.save
		redirect_to "/carted_products"
	end

end