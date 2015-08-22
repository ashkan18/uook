module V1
	class Books < Grape::API
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

			desc 'Create new book instance'
			params do 
				requires :isbn, type: String
				requires :location, type: Hash do 
					requires :lat, type: BigDecimal
					requires :lon, type: BigDecimal
				end
			end
			post '/' do 
				
				book = Book.find_or_create_by(isbn: params[:isbn])
				user = User.find_or_create_by(uid: 'ashkan')
				locatino_arr = [params[:location][:lat].to_f, params[:location][:lon].to_f]
				
				BookInstance.create(location: locatino_arr, 
									book: book,
									user: user)
			end
		end
	end
end
