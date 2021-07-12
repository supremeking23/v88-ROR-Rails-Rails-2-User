class UsersController < ApplicationController
  def index
  end
  def new
  end

  def create
    @user = User.create(user_params)
   
   # puts @user.errors.full_messages
    if @user.valid?
      redirect_to "/sessions/new"
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to "/users/new"
    end

   
    
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:confirm_password)
    end

end
