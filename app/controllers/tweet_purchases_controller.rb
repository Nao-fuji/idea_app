class TweetPurchasesController < ApplicationController
  before_action :set_recruit, only: [:index, :create]
  before_action :set_tweet, only: [:index, :create]

  def index
    @tweet_purchase = TweetPurchase.new
  end

  def create
    @tweet_purchase = TweetPurchase.new(tweet_purchase_params)
    if @tweet_purchase.valid?
      pay_tweet
      @tweet_purchase.save
      redirect_to recruit_path(@recruit.id)
    else
      render :index
    end
  end

  private

  def tweet_purchase_params
    params.require(:tweet_purchase).permit(:price).merge(user_id: current_user.id, tweet_id: params[:tweet_id], token: params[:token])
  end

  def set_recruit
    @recruit = Recruit.find(params[:recruit_id])
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def pay_tweet
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: tweet_purchase_params[:price],
      card: tweet_purchase_params[:token],
      currency: 'jpy'
    )
  end
end
