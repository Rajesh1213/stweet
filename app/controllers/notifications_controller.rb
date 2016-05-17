class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = Notification.joins(:user).where("notifiable_id in (?)" , current_user.id).order("updated_at desc")
    @notifications.each do |notification|
      notification.update_attribute(:is_read, true)
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    if @notification.destroy
      @success = true
    end
  end
end

