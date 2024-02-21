class UsersController < ApplicationController
  
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books    
  end
  
  def edit
    @user = User.find(params[:id])
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to books_path
  end
  end
   
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
       params.require(:user).permit(:name, :introduction, :image) 
  end
end