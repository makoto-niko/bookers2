class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images    
  end
  
  def edit
    @user = User.find(params[:id])
  end
   
   private
      def user_params
       params.require(:user).permit(:name, :introduction, :image) 
      end
end