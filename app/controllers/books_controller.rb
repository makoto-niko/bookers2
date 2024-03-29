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
    @user = current_user
    @books = Book.all
      if @book.save
        flash[:notice] = "You have created book successfully,"
        redirect_to book_path(@book)
      else
        render :index
      end
  end
  
  def edit
    @book = Book.find(params[:id])
    book = Book.find(params[:id])
    unless current_user.id == @book.user.id
      redirect_to books_path
    end
 end
 
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id) 
       flash[:notice] = "You have updated book successfully."
    else
       render :edit
    end
  end
  
  def destroy 
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end