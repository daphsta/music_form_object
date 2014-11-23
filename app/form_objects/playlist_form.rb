require 'song_form'
require 'artist_form'

class PlaylistForm
	include Virtus.model
	include ActiveModel::Validations

	attribute :album_name, String
	attribute :songs, Array[SongForm]
	attribute :artist_name, ArtistForm

	validates_presence_of :album_name,:songs,:artist_name


  def persisted?
		false
	end

	def save
		if valid?
			persist!
			true
		else
			false
		end
	end

	def persist!
		artist = Artist.create!(first_name: artist_name.first_name, last_name: artist_name.last_name)
		album  = Album.create!(name: album_name, artist_id: artist.id)
		song 	 = songs.each { |song| Song.create!(title: song.title, album_id: album.id) }
	end
end