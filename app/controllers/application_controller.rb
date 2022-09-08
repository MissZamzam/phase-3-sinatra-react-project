class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/reviews' do
    book = Book.all
      book.to_json(include: {reviews: {only: [:body], include: {user: {only: [:name]}}}})
    end

    post '/reviews' do
      review = Review.create(
        body: params[:body],
        book_id: params[:book_id],
        user_id: params[:user_id]
      )
      review.to_json
    end

    get '/reviews' do
      reviewss = Review.all
      reviewss.to_json

    end

    get '/users' do
      users = User.all
      users.to_json
    end

    # resutrants routes

    get '/books' do 
      book = Book.all
      book.to_json
    end

    post '/books' do
      book = Book.create(
        name: params[:name],
        location: params[:location]
      )
      book.to_json
  end
  
  delete '/books/:id' do 
    book = Book.find(params[:id])
    book.destroy
    book.to_json
  end

  patch '/books/:id' do 
    book = Book.find(params[:id])
     book.update(
      name: params[:name],
      location: params[:location]
    )
    book.to_json
  end




    
end