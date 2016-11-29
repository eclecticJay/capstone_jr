class Product < ApplicationRecord
	belongs_to :user
	belongs_to :supplier
	has_many :order
	has_many :categorized_products
	has_many :categories, through: :categorized_products
	def friendly
		created_at.strftime("%b %d, %Y")
	end
	
	def sale_message
		if price < 2
			 "Discount Item"
		elsif price > 2
			 "On Sale!"	
		end	
	end
	
	def tax
		price * 0.09
	end
	def total 
		tax + price
	end

	#this method would return the supplier this product
	# def supplier
	# 	Supplier.find_by(id: supplier_id)
	# end
end

