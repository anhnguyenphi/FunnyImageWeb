class User < ActiveRecord::Base
	has_many :topics

	before_save {self.email = email.downcase}
	validates :name, presence: true, length: {minimum: 3,maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
			  format: {with: VALID_EMAIL_REGEX},
			  uniqueness: true
	has_secure_password
	validates :password, presence: true, length: {minimum: 8}, allow_nil: true
	attr_accessor :remember_token
	# avatar
	has_attached_file :avatar, styles: {
							    thumb: '64x64',
							   	full: '200x200'
							  	},
							  	default_url: '/images/:attachment/default_:style.png'
	validates_attachment :avatar,
						  content_type: { content_type: ["image/jpeg", "image/png"] },
						  size: { in: 0..2.megabytes }
	# Return a hash digest of the given string
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST 
													: BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
	# Return a random token
	def User.new_token
	 	SecureRandom.urlsafe_base64
	end
	# remember sign in method
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end
	# Return true if the given token matches the digest
	def authenticated? (remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end
	# forget remember
	def forget
		update_attribute(:remember_digest, nil)
	end
end
