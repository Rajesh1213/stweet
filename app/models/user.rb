class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :tweets, :through => :user_tweets
  has_many :user_tweets
  has_many :notifications, dependent: :destroy

  acts_as_followable
  acts_as_follower

  extend FriendlyId
  friendly_id :name

  def all_tweets
    UserTweet.joins(:user).where("user_tweets.user_id in (?)" , self.all_following << self).order("updated_at desc")
  end

  # Code to access current_user in Model
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def check_message
    notifications = Notification.joins(:user).where("notifiable_id in (?)" , self.id).order("updated_at desc")
    count = 0
    notifications.each do |r|
      unless r.is_read
        count += 1
      end
    end
    return count
  end
end
