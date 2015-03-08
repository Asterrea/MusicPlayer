class Playlist < ActiveRecord::Base
	belongs_to :user, foreign_key: "user_id"
	has_many :music

	def self.get_all(user_id)
		playlist = Playlist.where(user_id: user_id).to_a
	end

	def self.create_playlist(name, user_id)
		if Playlist.where(name: name, user_id: user_id).to_a.size < 1
			playlist = Playlist.create(name: name, user_id: user_id)
		end
	end

	def self.getPlaylist(name, user_id)
		playlist = Playlist.where(name: name, user_id: user_id).to_a.first
		playlist
	end

	def self.inPlaylist(name, user_id)
		return true if Playlist.where(name: name, user_id: user_id).to_a.size > 0
		false
	end
end
