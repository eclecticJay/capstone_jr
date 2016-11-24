class User < ApplicationRecord
	has_many :products
	has_secure_password
end
