require 'song_form'
require 'artist_form'

class MusicForm
	include Virtus.model
	include ActiveModel::Validations

	attribute :album_name, String
	attribute :songs, Array[SongForm]
	attribute :artist_name, Artist

	validates_presence_of :album_name,:song,:artist_name


	def persisted?
		false
	end

	def save
		if valid?
			persist!
		else
			false
		end
	end

	def persist!
		artist = Artist.create!(first_name: artist_name.first_name, last_name: artist_name.last_name)
		album  = Album.create!(name: album_name, artist_id: artist.id)
		song 	 = songs.each { |song| Song.create!(song) }

	end
end