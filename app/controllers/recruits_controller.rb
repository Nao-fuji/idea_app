class RecruitsController < ApplicationController
  before_action :set_recruit, only:[:show, :edit, :update, :destroy]

  def new
    @recruit=Recruit.new
  end
  
  def create
    @recruit=Recruit.new(recruit_params)
    if @recruit.save
      redirect_to root_path
    else
      render :new  
    end
  end

  def show
    @tweet = Tweet.new
    @tweets = @recruit.tweets.includes(:user)
  end

  def edit
  end
  
  def update
    if @recruit.update(recruit_params)
      redirect_to root_path
    else
      render :edit
    end
  end
    
  def destroy
    @recruit.destroy if current_user.id == @recruit.user_id
    redirect_to root_path
  end 


  private
  def recruit_params
    params.require(:recruit).permit(:theme, :price, :category_id, :other).merge(user_id: current_user.id)
  end

  def set_recruit
    @recruit=Recruit.find(params[:id])
  end

end
