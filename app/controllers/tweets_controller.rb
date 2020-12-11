class TweetsController < ApplicationController

  def create
    @tweet=Tweet.new(tweet_params)
    @tweet.save
    redirect_to "/recruits/#{@tweet.recruit.id}"
  end

  def destroy
    @tweet=Tweet.find(params[:id])
    @tweet.destroy if current_user.id == @tweet.user_id
    redirect_to "/recruits/#{@tweet.recruit.id}"
  end 

  private
    def tweet_params
      params.require(:tweet).permit(:idea, :explain, :other, :image).merge(user_id: current_user.id, recruit_id: params[:recruit_id])
    end
  end
