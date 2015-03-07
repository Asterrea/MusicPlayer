class User < ActiveRecord::Base
	has_many :playlist
	has_many :music
end
