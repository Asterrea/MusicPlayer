class Playlist < ActiveRecord::Base
	belongs_to :user, foreign_key: "user_id"
	has_many :music
end
