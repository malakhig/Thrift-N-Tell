require "test_helper"

class RequestThrfitMailerTest < ActionMailer::TestCase
  test "new_request_email" do
    mail = RequestThrfitMailer.new_request_email
    assert_equal "New request email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
