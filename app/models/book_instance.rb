class BookInstance
	include Mongoid::Document
	include Mongoid::Timestamps

	field :uid, type: String
	field :location, type:Array  # [lat,lng]
  embeds_one :book
  embeds_one :user

  index( { location: "2d" }, { min: -180, max: 180 })
end