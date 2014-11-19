class SongForm
	include Virtus.model
	include ActiveModel::Validations

	attribute :title, String
	
end

