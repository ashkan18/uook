module Uook
	class API < Grape::API
		before do
			header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
		end
		
		mount API::V1::Books

		add_swagger_documentation :format => :json,
                            :mount_path => "/api/swagger_doc",
                            :hide_documentation_path => true	
	
	end 
end