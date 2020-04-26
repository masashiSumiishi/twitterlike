class LikesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.like(current_user)
    redirect_to @micropost.user
  end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    @micropost.unlike(current_user)
    redirect_to @micropost.user
  end
end
