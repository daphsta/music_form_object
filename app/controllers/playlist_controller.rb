class PlaylistController < ApplicationController
	def show
		@albums = Album.all || []
	end
	def new
	end

	def create
    @playlist = PlaylistForm.new(params[:playlist_form])

      if @playlist.save
        redirect_to root_path
      else
        render :new
      end

	end
end
