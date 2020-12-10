class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @image= user.image
    @ideas = user.ideas
    @recruits = user.recruits
    @tweets = user.tweets
  end
end
