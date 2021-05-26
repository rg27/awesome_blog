class User < ApplicationRecord
	#This is basic validation
	validates :name, presence: true, length: { maximum:50 }
	#To validate correct email structure
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum:50 },
																		format: { with: EMAIL_REGEX },
																		uniqueness: { case_sensitive: false}
	has_secure_password #Equivalent of password and password confirmation
	validates :password, presence: true, length: { minimum: 6 }, allow_nil:true #It shoud be place after "has_secured_password since it is depending on Bcrypt"
end
