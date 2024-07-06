# To deliver this notification:
#
# LikeNotifier.with(record: @post, message: "New post").deliver(User.all)

class LikeNotifier < ApplicationNotifier
  # Add your delivery methods
  deliver_by :database
  #
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_post"
  # end
  #
  param :like, :post, :user
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  notification_methods do

     def message
    user_name = params[:user]&.username 
    if user_name
      " liked your post"
    else
      "{deleted}"
    end
  end

  def username
     user_name = params[:user]&.username 
     user_name
   end

  def user_object
     y = params[:user]
    y
  end

  def thumbnail
    thumb_nail = params[:post].images.first
    thumb_nail
  end
  #
  def url
    x = post_path(params[:post])
    x
  end
end
  # required_param :message
end
