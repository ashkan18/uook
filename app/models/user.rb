
class User
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :uid, type: String
	field :name, type: String
	field :user_type, type: Integer

	has_many :books

end