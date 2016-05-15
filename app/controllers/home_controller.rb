class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
      @tweet = Tweet.new
     # @tweets = current_user.tweets.order("updated_at desc")
      @tweets = current_user.all_tweets
  end

  def search
    q = params[:q]
    @q = User.search(name_or_email_cont: q)
    @users= @q.result(:distinct => true)
  end
end