class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, idea_id: params[:idea_id])
    redirect_to root_path
  end
end
