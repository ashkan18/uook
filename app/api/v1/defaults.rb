module V1
	module Defaults
  	extend ActiveSupport::Concern
	  included do
	    prefix "api"
	    version "v1", using: :header, vendor: 'Ashkan'
	    format :json
	    content_type :json, 'application/json'
	    rescue_from Mongoid::Errors::DocumentNotFound do |e|
        error!(e.message, 404)
      end

		  helpers do
		    def logger
		      Rails.logger
		    end
		  end
		end
  end
end