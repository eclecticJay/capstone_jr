class Product < ApplicationRecord
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

end

