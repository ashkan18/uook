class User
	include Mongoid::Document
	include Mongoid::Timestamps

	field: uid, type:String
	field: name, type:String

	has_many: :books, inverse