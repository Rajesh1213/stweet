class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.friendly.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    create_notification
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    @notification = Notification.find_by(user_id: current_user.id, notifiable_id: @user.id)
    @notification.delete {|i| i.user_id == current_user.id || i.notifiable_id == @user.id} if @notification.present?
  end

  def create_notification
    @notification = Notification.new(:user_id => current_user.id,:notifiable_id  => @user.id)
    @notification.save
  end

  def following
    @followings = current_user.all_following
  end

  def follower
    @followers = current_user.followers
  end
end
