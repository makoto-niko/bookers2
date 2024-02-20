class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  def destoroy 
     @book = Book.find(params[:id])
     @book.destoroy
     redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end