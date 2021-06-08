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
	has_many :posts

	has_many :active_relationships, class_name: "Relationship", foreign_key:"follower_id",  dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship", foreign_key:"followed_id", dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

	#follow auser
	def follow(other_user)
		active_relationships.create(followed_id: other_user.id)
	end

	#unfollow user
	def unfollow(other_user)
		active_relationships.find_by(followed_id: other_user.id).destroy
	end

	def following?(other_user)
		Relationship.find_by_followed_id(other_user.id)
	end
	
end
