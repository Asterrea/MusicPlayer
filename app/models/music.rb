class Music < ActiveRecord::Base
	def self.create_music(name, path, user_id, playlist_id)
		music = Music.create(name: name, path: path, user_id: user_id, playlist_id: playlist_id)
	end

	def self.get_all(user_id, playlist_id)
		music = Music.all.to_a
		music
	end
end
