# To deliver this notification:
#
# CommentNotifier.with(record: @post, message: "New post").deliver(User.all)

class CommentNotifier < ApplicationNotifier
  # Add your delivery methods
  deliver_by :database

  #
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_post"
  # end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end
   param :comment, :post

  # Add required params
  notification_methods do
 

  def message
    user_name = params[:post]&.user&.username 
    if user_name
    "#{user_name} commented on your post" 
  else 
    "{deleted}"
  end
  end
   def user_object
     y = params[:user]
    y
  end

  def username
     user_name = params[:comment]&.user&.username 
     user_name
   end

  def thumbnail
    thumb_nail = params[:post].images.first
    thumb_nail
  end

  def url
    x = post_path(params[:post])
    x
  end
end
  # required_param :message
end
