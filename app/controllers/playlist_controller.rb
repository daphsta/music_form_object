class PlaylistController < ApplicationController

	def index
		@albums = Album.all
		@artists = Artist.all
		@playlist = @albums.merge(@artists)
		ap @playlist
	end
	
	def create
		playlist = params[:playlistform]

    playlistform = PlaylistForm.new(playlist)
      if playlistform.save
        redirect_to root_path
      else
        render :new
      end

	end
end
