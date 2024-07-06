# app/mailers/request_thrift_mailer.rb
class RequestThriftMailer < ApplicationMailer
  def new_request_email(form_data)
    @form_data = form_data

    Rails.logger.info "Sending email with form data: #{@form_data.inspect}"

    mail(
      to: "griffin.malakhi@gmail.com",
      subject: "New Thrift Requested",
      from: "no-reply@example.com"  # Replace with a valid from email address
    )
  end
end

