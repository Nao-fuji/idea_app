class DislikesController < ApplicationController
  def create
    @dislike = current_user.dislikes.create(idea_id: params[:idea_id])
    redirect_to root_path
  end
end
