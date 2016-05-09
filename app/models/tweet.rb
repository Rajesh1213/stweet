class Tweet < ActiveRecord::Base
  belongs_to :user_tweet
  validates_length_of :body, :in => 5..50, :allow_blank => false
  after_save :populate_user_tweet
  before_destroy :destroy_parent

  private

  def populate_user_tweet
    user_tweet = UserTweet.new(:user_id => User.current.id, :tweet_id => self.id)
    user_tweet.save
  end

  def destroy_parent
    User.current.user_tweets.where(:tweet_id => self.id).destroy_all
  end
end