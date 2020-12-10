class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas=Idea.order('created_at DESC')
    @recruits=Recruit.order('created_at DESC')
  end

  def new
    @idea=Idea.new
  end
  
  def create
    @idea=Idea.new(idea_params)
    if @idea.save
      redirect_to root_path
    else
      render :new  
    end
  end

  def show
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to root_path
    else
      render :edit 
    end
  end

  def destroy
    @idea.destroy if current_user.id == @idea.user_id 
    redirect_to root_path
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :idea, :price, :category_id, :other, :image).merge(user_id: current_user.id)
  end

  def set_idea
    @idea=Idea.find(params[:id])
  end

end