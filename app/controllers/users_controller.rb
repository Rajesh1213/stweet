class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.friendly.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
  end
end
