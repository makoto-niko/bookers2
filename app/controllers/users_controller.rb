class UsersController < ApplicationController
  def show
  end
  
  def edit
    @user = User.find(params[:id])
  end
   
   private
    def user_params
      params.require(:user).permit(:name, :introduction, :image) 
      end
end