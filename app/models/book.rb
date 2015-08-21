class Book
	include Mongoid::Document
	include Mongoid::Timestamps

	field :uid, type: String
	field :name, type: String
	field :isbn, type: String

	has_and_belongs_to_many :authors

	def to_s
		"#@name - #@isbn"
	end 
end