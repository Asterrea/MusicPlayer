class User < ActiveRecord::Base
	has_many :playlist
	has_many :music

	#credits to PROFSWD lesson on Authentication
	def self.createUser(username, name, password)
		return false if User.where(username: username).to_a.size > 0

		salt = BCrypt::Engine.generate_salt
		hashed_password = BCrypt::Engine.hash_secret(password, salt)
		new_user = User.create(name: name, username: username, password: hashed_password, salt: salt)
		new_user
	end

	def self.authenticate(username, password)
		user = User.where(username: username).to_a.first
		if user.present? && user.password == BCrypt::Engine.hash_secret(password, user.salt)
			user
		else
			nil
		end
	end

	def self.checkDB(username)
		return false if User.where(username: username).to_a.size > 0
		true
	end
end
