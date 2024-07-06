class NotificationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @notifications = current_user.notifications.reverse
    respond_to do |format|
      format.html
      format.js { current_user.notifications.mark_as_read }
    end
  end

end
