class SecretsController < ApplicationController
  def index
    @secrets = Secret.all
  end

  def create
    @user = User.find(params[:user_id])
    @secret = Secret.create(content: params[:content], user: @user)
    
    
    if @secret.valid?
      flash[:notice] = "My new secret"
      redirect_to "/users/#{@user.id}"
    else
      puts @secret.errors.full_messages
    end
  end

  def destroy 
    Secret.destroy_all

    @user = User.find(params[:user_id])
    redirect_to "/users/#{@user.id}"
  end


  private
    def secret_params
      params.require(:secret).permit(:content,:user)
    end
end
