class User < ApplicationRecord
	has_secure_password
	has_many :orders
	has_many :carted_products
	validates :email, uniqueness: true
	validates :email, confirmation: true
	validates :name, :email, presence: true
end
