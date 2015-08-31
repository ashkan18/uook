module V1
	class Users < Grape::API
		resources :users do
			desc 'Add a new user'
			params do
				requires :name, type: String
				requires :type, type: Integer
				requires :password, type: String
				requires :user_name, type: String
			end
			post '' do
				user = User.find_or_create_by(user_name: params[:user_name])
				user.type = params[:type] unless user.type == params[:type]
				presents user 
			end
		end
	end
end