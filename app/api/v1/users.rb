module V1
	class Users < Grape::API
		include V1::Defaults

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
				user.password = params[:password]
				user.user_type = params[:type] unless user.user_type == params[:type]
				user.save
				user 
			end
		end
	end
end