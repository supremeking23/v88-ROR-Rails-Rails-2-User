class LikesController < ApplicationController
  def create
    @like = Like.create(secret: Secret.find(params[:secret_id]), user: current_user)
   puts "sdsds"
    # user_id = params[:user_id]
    # puts user_id
    #redirect_to "/users/#{params[:user_id]}"
    redirect_to "/secrets"
  end

  def update 
    like = Like.find_by(secret: Secret.find(params[:secret_id]))
    like.destroy
    redirect_to "/secrets"
  end

  def destroy
  end
end
