class User < ApplicationRecord
	attr_accessor :remember_token

	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50 } # rails validates the presence of an attribute using the blank? method
	# equivalent to
	# validates(:name, presence: true)
	# or
	# validates(:name, { presence: true })
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false }
										# ActiveRecord uniqueness validation does not guarantee uniqueness at the database level
										# in the case of a new user submitting their user info twice at the same time accidentally
										# you have to create a database index on the email column
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
	# uses a state-of-the-art hash function called bcrypt to create the password digest
	# adds virtual attributes password and password_confirmation to verify passwords 

	# Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# Returns a random tokem
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end
end
