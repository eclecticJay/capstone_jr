class Product < ApplicationRecord
	has_many :carted_products
	has_many :orders, through: :carted_products
	validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 5000 } 

	belongs_to :supplier, optional: true  
	belongs_to :user, optional: true 
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

