module V1
	class Book < Grape::API
		include V1::Defaults
		resources :books do
			desc 'Get all books'
			get '' do
				Book.all
			end

			desc 'Get Specific book'
			get ':id' do
				Book.find_by(uid: params[:id])
			end

		end
	end
end
