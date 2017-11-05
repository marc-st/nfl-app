require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    
    mail = ContactMailer.contact_email("marc@me.com", "Marc", "12345678", @message = "Hello")
    
    assert_equal ['from@example.com'], mail.to
    assert_equal ['from@example.com'], mail.from
    
  end
end
