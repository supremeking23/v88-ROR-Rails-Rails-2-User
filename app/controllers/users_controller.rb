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

  def destroy
    reset_session
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/users/new"
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    @user.update(name: params[:name], email: params[:email])
    if @user.valid?
      flash[:notice] = @user.name
      # redirect_to "/users/#{@user.id}/edit"
      redirect_to "/users/#{@user.id}"
    else
      flash[:alert] = @user.errors.full_messages
      # redirect_to "/users/index"
      
      redirect_to "/users/#{@user.id}/edit"
    end
  end



  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:confirm_password)
    end

end
