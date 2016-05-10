class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
      @tweet = Tweet.new
      @tweets = current_user.tweets.order("updated_at desc")
  end
end