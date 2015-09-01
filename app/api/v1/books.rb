module V1
	class Books < Grape::API
		include V1::Defaults
		
		before do
			authenticate!
		end
		resources :books do
			desc 'Search Books'
			params do
				optional :isbn, type: String
				optional :name, type: String
			end
			get '' do
				query = Book.all
				return query.find_by(isbn: params[:isbn]) if params.has_key?(:isbn)
				query = query.where(isbn: params[:name]) if params.has_key?(:name)
				present query
			end

			desc 'Get Specific book'
			get ':id' do
				Book.find_by(uid: params[:id])
			end

			desc 'Create a new Book'
			params do
				requires :isbn, type: String
				requires :name, type: String
			end
			post '' do
				Book.find_or_create_by(isbn: params[:isbn], name: params[:name])
			end
		end
	end
end
