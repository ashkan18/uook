class Author
	include Mongoid::Document
	include Mongoid::Timestamps

	field :uid, type: String
	field :name, type: String
	
	has_and_belongs_to_many :books
end