class ArtistForm
	include Virtus.model

	attribute :first_name, String
	attribute :last_name, String

	def full_name
		first_name + last_name
	end
end
