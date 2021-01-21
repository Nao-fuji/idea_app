class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @image = @user.image
    @ideas = @user.ideas.order('created_at DESC')
    @recruits = @user.recruits.order('created_at DESC')
    @tweets = @user.tweets.order('created_at DESC')
    @idea_purchases = @user.idea_purchases.order('created_at DESC')
    @user_ideas = @user.ideas

    @likes_count = 0
    @user_ideas.each do |idea|
      @likes_count += idea.likes.count
    end
    @dislikes_count = 0
    @user_ideas.each do |idea|
      @dislikes_count += idea.dislikes.count
    end
  end
end
