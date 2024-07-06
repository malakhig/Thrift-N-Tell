# Preview all emails at http://localhost:3000/rails/mailers/request_thrfit_mailer
class RequestThrfitMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_thrfit_mailer/new_request_email
  def new_request_email
    RequestThrfitMailer.new_request_email
  end

end
