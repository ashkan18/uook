module V1
	class BookInstances < Grape::API
		include V1::Defaults
		resources :book_instances do
			desc 'Search book instances'
			params do 
				optional :name, type: String
				optional :isbn, type: String
				optional :lat, type: BigDecimal
				optional :lon, type: BigDecimal
				optional :author_name, type: String
				all_or_none_of :lon, :lat
			end
			get '' do
				query = BookInstance.all
				query = query.where("book.isbn" => params[:isbn]) if params.has_key?(:isbn)
				query = query.where("book.name" => params[:name]) if params.has_key?(:name)
				query = query.where("book.author.name" => params[:author_name]) if params.has_key?(:author_name)
				if params.has_key?(:lat) and params.has_key?(:lon)
					center = [params[:lat].to_f, params[:lon].to_f]
					query = query.geo_near(center).max_distance(10)
				end
				present query
			end

			desc 'Create new book instance'
			params do 
				requires :isbn, type: String, documentation: { example: 'ISBN of the book' }
				requires :location, type: Hash, documentation: { example: 'Location object with lat and lon' } do 
					requires :lat, type: BigDecimal, documentation: { example: 'Current Latitude of the book' }
					requires :lon, type: BigDecimal, documentation: { example: 'Current Longitude of the book' }
				end
			end
			post '/' do 
				BookInstance.create(location: [params[:location][:lat].to_f, params[:location][:lon].to_f], 
									book: Book.find_or_create_by(isbn: params[:isbn]),
									user: User.find_or_create_by(uid: 'ashkan'))
			end
		end
	end
end