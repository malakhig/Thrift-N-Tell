
class RequestThriftsController < ApplicationController
  def send_request
    form_data = params.permit(:store, :address, :city, :state, :comments)
    Rails.logger.info "Received form data: #{form_data.inspect}"
    RequestThriftMailer.new_request_email(form_data).deliver_now
    redirect_to root_path, notice: 'Request was successfully sent.'
  end
end