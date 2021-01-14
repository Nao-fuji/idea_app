class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(idea_id: params[:idea_id])
    redirect_to root_path
  end
end
