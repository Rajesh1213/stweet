class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    current_user
    @user_profile = UserProfile.first
  end
end
