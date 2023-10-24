class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    if params[:search].present?
      @books = Book.search(search_arg: params[:search],:page_arg => params[:page], page_count: 4)
    else 
      @books = Book.paginate(:page => params[:page], :per_page => 4)
    end 
   initialize_user_books
    if params[:user_id]
      render 'books/user'
    end 


  end 

  def show 
    @book = Book.find(params[:id])
  end 

  def change_rating
  end 

  def create
    debugger
     @book = Book.new(book_create_params)
     if @book.save
       flash.now[:success] = "Book saved to Database successfully"
       redirect_to user_books_url(current_user)
     end 

  end 

  def destroy
    current_user.connect_books.find_by(book_id: params[:id]).destroy
    @book = Book.find(params[:id])
    initialize_user_books
    respond_to do |format|
      format.html { redirect_to user_books_path(current_user) }
      format.js   {
        render 'books/read'
      }
    end 
  end 

  def read
    current_user.connect_books.get_or_create(id: params[:id]).mark_as_read! 
    initialize_user_books
    @book = Book.find(params[:id])
    flash.now[:success] = "Movie added to read list successfully"
    respond_to do |format|
      format.html { redirect_to user_books_path(current_user) }
      format.js   {
        render 'books/read'
      }
    end 

  end 

  def reading
    current_user.connect_books.get_or_create(id: params[:id]).mark_as_reading!
    initialize_user_books
    @book = Book.find(params[:id])
    flash.now[:success] = "Book added to reading list successfully"
    respond_to do |format|
      format.html { redirect_to user_books_path(current_user) }
      format.js   {
        render 'books/read'
      }
    end 

  end 

  def to_read
    current_user.connect_books.get_or_create(id: params[:id]).mark_as_to_read!
    initialize_user_books
    @book = Book.find(params[:id])
    flash[:success] = "Book added to to_read list successfully"
    respond_to do |format|
      format.html { redirect_to user_movies_path(current_user) }
      format.js   {
        render 'books/read'
      }
    end 

  end 

  def update
    @book = Book.find(book_update_params[:id])
    respond_to do |format|
      format.html {
        current_user.connect_books.find_by(book_id: book_update_params[:id]).update(rating: book_update_params[:rating],review: book_update_params[:review])
        redirect_to book_path(@book, read: true)
      }
      format.js 
    end
  end 

  private 

  def book_create_params
    params.require(:book).permit(:name,:author,:image)
  end 

  def book_update_params
    params.permit(:rating,:review,:id)
  end 

  def initialize_user_books
    @user = current_user
    @read_books = current_user&.connect_books.read_books
    @reading_books = current_user&.connect_books.reading_books
    @to_read_books = current_user&.connect_books.to_read_books
  end 

end
