class Music < ActiveRecord::Base

	def self.create_music(name, path, user_id, playlist_id)
		music = Music.create(name: name, path: path, user_id: user_id, playlist_id: playlist_id)
	end

	def self.get_all(user_id, playlist_id)
		music = Music.where(user_id: user_id, playlist_id: playlist_id).to_a
	end
	def self.get_path(user_id, playlist_id, index)
		temp = index
		music = Music.where(user_id: user_id, playlist_id: playlist_id).to_a
		if(index > music.size || index < music.size)
			temp = index % music.size
		end
		music[temp].path	
	end
end
