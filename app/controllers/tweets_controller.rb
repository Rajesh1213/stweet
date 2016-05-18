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

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    if current_user.user_tweets.where(:tweet_id => params[:id]).destroy_all
      @success = true
    end
  end

  def retweet
    @user_tweet = current_user.user_tweets.find_or_initialize_by(:tweet_id => params[:id])
    if @user_tweet.persisted?
      @user_tweet.touch(:updated_at)
    else
      @user_tweet.save
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end