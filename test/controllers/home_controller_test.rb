require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  # /home route success and test home view
  test "should get home" do
    get :home
    assert_response :success
    
    assert_template layout: 'application'
    
    assert_select 'title', 'NFL Web App'
    assert_select 'h1', 'NFL Home Page'
    assert_select 'p', 'Author Marc Stevens'
  end
  
  # /contact route success and test contact view
  test "should get contact" do
    get :contact
    assert_response :success
    
    assert_template layout: 'application'
    
    assert_select 'title','NFL Web App'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to get in touch with us.'
  end
  
  # /request_contact post success with flash notice (no parameters)
  test "should post request contact but no email" do
    post :request_contact
    
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end
  
  # /request_contact post success with flash notice (with parameters)
  test "should post request contact" do
    post :request_contact, name: "Marc", 
    email: "me@email.com", telephone: "1234567",
    message: "Hello"
    
    assert_response :redirect
    assert_not_empty flash[:notice]
    assert_nil flash[:alert]
  end  

end
