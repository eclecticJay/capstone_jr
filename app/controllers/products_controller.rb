class ProductsController < ApplicationController
	def info
		@products = Product.all
		render 'product.html.erb'
	end
end
