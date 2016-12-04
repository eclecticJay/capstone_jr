class OrdersController < ApplicationController
	before_action :authenticate_admin! 
	def create
		carted_products = current_user.carted_products.where(status:"carted")
			order1 = Order.new(
			user_id: current_user.id,
			)
		order1.save

		carted_products.each do |carted_products|
		carted_products.update(status: "purchased")
		carted_products.update(order_id: order1.id)
	end
	order1.save_all_totals
		redirect_to"/orders/#{order1.id}"
	end
	def show
		#unless you made this order go away 
		#compare the user_id from the order to the current usere id 
		@order = Order.find(params[:id])
		unless current_user.id == @order.user_id || current_user.admin
			redirect_to '/products'
		end
	end
end

