class Music < ActiveRecord::Base
	belongs_to :playlist, foreign_key: "playlist_id"
	belongs_to :user, foreign_key: "user_id"
end
