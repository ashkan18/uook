module V1
	class Books < Grape::API
		include V1::Defaults
		resources :books do
			desc 'Search Books'
			params do
				optional :isbn, type: String
				optional :name, type: String
			end
			get '' do
				query = Book.all
				query = query.where(isbn: params[:isbn]) if params.has_key?(:isbn)
				query = query.where(isbn: params[:name]) if params.has_key?(:name)
				present query
			end

			desc 'Get Specific book'
			get ':id' do
				Book.find_by(uid: params[:id])
			end
		end
	end
end
