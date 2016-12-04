class Order < ApplicationRecord
	belongs_to :user
	has_many :carted_products
	has_many :products, through: :carted_products 
	

	def calculated_subtotal
		subtotal = 0
		carted_products.each do |carted_product|
			subtotal += carted_product.quantity * carted_product.product.price
		end
		 subtotal
	end

	def calculated_tax
	calculated_subtotal * 0.09
	end

	def calculated_total
		 calculated_subtotal + calculated_tax
	end

	def save_all_totals
		update(subtotal: calculated_subtotal, total: calculated_total, tax: calculated_tax)
	end

end
