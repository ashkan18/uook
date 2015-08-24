module V1
	class Users < Grape::API
		resources :users do
			desc 'Add a new user'
			params do
				requires :name, type: String
				requires :type, type: Integer
			end
			post '' do
				user = User.find_or_create_by(name: params[:name])
				user.type = params[:type] unless user.type == params[:type]
				presents user 
			end
		end
	end
end