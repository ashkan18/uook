
class User
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :uid, type: String
	field :name, type: String
	field :user_type, type: Integer
	field :user_name, type: String
	field :password, type: String

	has_many :books

	index({user_name:1})

end