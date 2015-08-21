
class User
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :uid, type:String
	field :name, type:String

	field :location, type:Array  # [lat,lng]
  	has_many :books

  	index( { location: "2d" }, { min: -180, max: 180 })
	
end