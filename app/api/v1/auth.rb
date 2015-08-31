require 'securerandom'

module V1
	class Auth < Grape::API
		include V1::Defaults
		resources :auth do
			desc 'Login'
			params do
				requires :user_name, type: String
				requires :password, type: String
			end
			post '' do
				user = User.find_by(user_name: params[:user_name], password: params[:password])
				if user
					APIKey.create(access_token:SecureRandom.hex, user: user)	
				end
			end
		end
	end
end