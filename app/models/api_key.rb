class APIKey
	include Mongoid::Document
	include Mongoid::Timestamps

	field :access_token, type: String
	belongs_to :user
end