module Uook
	class API < Grape::API
		mount API::V1::BookApi
	end 
end