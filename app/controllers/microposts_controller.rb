class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

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
    @micropost.destroy
    flash[:success] = "Tweetを削除しました"
    redirect_to @micropost.user
  end

  private

   def micropost_params
     params.require(:micropost).permit(:content, :picture)
   end

   def correct_user
     @micropost = current_user.microposts.find_by(id: params[:id])
     redirect_to user_url(current_user) if @micropost.nil?
   end
end
