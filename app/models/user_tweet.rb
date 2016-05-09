class UserTweet < ActiveRecord::Base
  belongs_to :user, counter_cache: :tweets_count
  belongs_to :tweet
  validates_presence_of :user_id
  validates_presence_of :tweet_id


  after_destroy :delete_dependents

  private

  def delete_dependents
    binding.pry
    tweet = self.tweet
    user_ids.each do |u_id|
      Calendar.reset_counters u_id, :users
    end
  end
end