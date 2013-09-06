class User < ActiveRecord::Base
	has_secure_password
	before_save { email.downcase! } 	# this is a callback, which is a method
										# that gets invoked at a particular point
										# in the lifetime of an ActiveRecord object

	# name is what is being validated, final argument is a hash without brackets
	validates :name, presence: true, length: {maximum: 50}
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 				# Name starts with a capital letter, thus this is a constant and cannot change
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

	validates :password, length: { minimum: 6 }
end
