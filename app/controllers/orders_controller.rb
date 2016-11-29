class OrdersController < ApplicationController
	def create
		p product = Product.find(params[:product_id])
		price = product.price
		quantity = params["quantity"].to_i
		subtotal = price * quantity
		tax_rate = 0.1

		order = Order.new({ 
		quantity: params["quantity"],
		user_id: current_user.id,
		product_id: params["product_id"],
		subtotal: price * quantity,
		tax: tax_rate * price * quantity,
		total: (tax_rate * price * quantity) + (price * quantity) 
		})
	 	order.save
		# render 'create.html.erb'
		#add a flash message
		flash[:success] = "Added Product to cart"
		redirect_to "/orders/#{order.id}"
	end
	def show
		@order = Order.find(params[:id])
		@user = @order.user
	end
end

