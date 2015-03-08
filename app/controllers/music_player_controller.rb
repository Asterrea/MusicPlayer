class MusicPlayerController < ApplicationController
	before_action :require_login
	def index
		@name = session[:name]
		@playlists = Playlist.get_all(session[:user_id])
		@pSize = @playlists.size

	end

	def test
		
	end

	def require_login
    	redirect_to root_path if session[:user_id].nil?
    end

    def create_playlist
    	Playlist.create_playlist(params[:name], session[:user_id])
    	redirect_to '/index'
    end

    def play
   		@name = session[:name]
    	if !Playlist.inPlaylist(params[:playlist_name], session[:user_id])
    		redirect_to '/index'
    	end
    	p = Playlist.getPlaylist(params[:playlist_name], session[:user_id])
   		session[:playlist_id] = p.id;
   		session[:playlist_name] = p.name;
   		@playlist_name = p.name
   		@songs = Music.get_all(session[:user_id], session[:playlist_id])
   		@mSize = @songs.size
   		if @mSize > 0
	   		@path = Music.get_path(session[:user_id], session[:playlist_id], session[:song])
	   	end
    end

    def updated_play
    	@name = session[:name]
    	@playlist_name = session[:playlist_name]
    	@songs = Music.get_all(session[:user_id], session[:playlist_id], session[:song])
   		@mSize = @songs.size
    end

# Partial code of upload was taken from http://stackoverflow.com/questions/11342338/how-to-upload-a-file-in-ruby-on-rails
    def upload_music
    	music_name = params[:name]
    	name = params[:upload]
    	fname = name.original_filename
    	dir = 'public/uploads'
    	path = File.join(dir, fname)
    	File.open(path, "wb") do |f| f.write(name.read)
    	end
    	Music.create_music(music_name, path, session[:user_id], session[:playlist_id])
    	redirect_to 'upload_music'
    end
end