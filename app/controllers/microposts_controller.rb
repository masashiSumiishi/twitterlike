class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Tweet!"
      redirect_to user_url(current_user)
    else
      redirect_to user_url(current_user)
    end
  end

  def destroy
  end

  private

   def micropost_params
     params.require(:micropost).permit(:content)
   end
end
