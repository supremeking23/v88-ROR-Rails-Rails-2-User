class SessionsController < ApplicationController
  def new
  end

  def create
    
    # redirect_to sessions_path
    @user = User.find_by(email: params[:email])
    if @user != nil
      # redirect_to "/users/#{@user.id}"

      if @user.try(:authenticate,params[:password]) != false
        redirect_to "/users/#{@user.id}"
      else
        flash[:error] = ["Invalid Combination"]
        redirect_to "/sessions/new"
      end
      # if @user.password_digest == params[:password]
      #   redirect_to "/users/#{@user.id}"
      # else
      #   flash[:error] = ["Invalid Combination"]
      #   redirect_to "/sessions/new"
      # end
    else
      flash[:error] = ["Invalid Combination"]
      redirect_to "/sessions/new"
    end

  end

  def show
  end

  def logout 
    reset_session
    redirect_to "/sessions/new"
  end
end