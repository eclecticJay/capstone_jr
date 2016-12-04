class Supplier < ApplicationRecord
	has_many :products
	validates :name, presence: true
	validates :email, presence: true
	validates :phone, presence: true
	validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "dont forget your dashes" }

end
