class TweetsController < ApplicationController
  before_action :authenticate_user!

  def new
     @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    unless @tweet.save
      @errors = @tweet.errors.full_messages
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end