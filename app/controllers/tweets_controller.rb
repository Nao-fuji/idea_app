class TweetsController < ApplicationController
  before_action :set_tweet, only:[:edit, :update, :destroy]

  def new
    @tweet = Tweet.new
    @recruit=Recruit.find(params[:recruit_id])
  end

  def create
    @tweet=Tweet.new(tweet_params)
    if @tweet.save
      redirect_to "/recruits/#{@tweet.recruit.id}"
    else
      render :new
    end
  end

  def edit
    @recruit=Recruit.find(params[:recruit_id])
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to "/recruits/#{@tweet.recruit.id}"
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy if current_user.id == @tweet.user_id
    redirect_to "/recruits/#{@tweet.recruit.id}"
  end 

  private
    def tweet_params
      params.require(:tweet).permit(:idea, :explain, :other, :image).merge(user_id: current_user.id, recruit_id: params[:recruit_id])
    end

    def set_tweet
      @tweet=Tweet.find(params[:id])
    end
  end
