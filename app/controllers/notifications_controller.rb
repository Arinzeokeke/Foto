class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def link_through
	@notification = Notification.find(params[:id])
	@notification.update read: true
	redirect_to post_path @notification.post
  end

  def index
  	@notifications = current_user.notifications.order('created_at DESC')
  end
end
