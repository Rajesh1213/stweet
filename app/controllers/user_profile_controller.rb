class UserProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :populate_user_profile, :only => [:create,:update,:edit]

  def index
  end

  def new
    @user_profile =  UserProfile.new
  end

  def create
    if @user_profile
      @user_profile.update_attributes(user_profile_params)
      redirect_to root_path
    else
      @user_profile = UserProfile.new(user_profile_params)
      @user_profile.save
      redirect_to root_path
    end
    @user_profile = UserProfile.where(:user_id => user_profile_params[:user_id]).order("created_at DESC")
  end

  def edit
  end

  def update
    @user_profile.update_attributes(user_profile_params)
    redirect_to root_path
  end


  private

  def user_profile_params
    params.require(:user_profile).permit(:user_id,:age,:sex,:secondary_email,:secondary_phone_number,:attachment)
  end

  def populate_user_profile
    @user_profile = current_user.user_profile
  end

end
