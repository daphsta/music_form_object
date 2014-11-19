class MusicController < ApplicationController
	def show
		@albums = Album.all
		render 'music/index'
	end
	def new
		@music = MusicForm.new
	end

	def create
		@music = MusicForm.create(params[:music_form])

		if @music.save
			redirect_to root_path
		else
			render :new
		end
	end
end
