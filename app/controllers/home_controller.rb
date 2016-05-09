class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.user_profile.present?
      @user_profile = current_user.user_profile
      @tweet = Tweet.new
      @tweets = current_user.tweets.order("updated_at desc")
    else
      redirect_to new_user_profile_path
    end
  end
end