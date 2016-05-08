class Tweet < ActiveRecord::Base
  belongs_to :user_tweet
  validates_length_of :body, :in => 5..50, :allow_blank => false
  after_save :populate_user_tweet

  private

  def populate_user_tweet
    user_tweet = UserTweet.new(:user_id => User.current.id, :tweet_id => self.id)
    user_tweet.save
  end
end