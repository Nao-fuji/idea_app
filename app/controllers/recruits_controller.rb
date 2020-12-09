class RecruitsController < ApplicationController
  def index
    @recruits=Recruit.order('created_at DESC')
  end

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
    @recruit=Recruit.find(params[:id])
  end

  private
  def recruit_params
    params.require(:recruit).permit(:theme, :price, :category_id, :other).merge(user_id: current_user.id)
  end
end
