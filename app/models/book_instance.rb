class BookInstance
	include Mongoid::Document

	field :uid, type: String
	field :location, type:Array  # [lat,lng]
  embeds_one :book
  embeds_one :user

  index( { location: "2dsphere" }, { min: -180, max: 180 })
end