require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get contact" do
    get :contact
    assert_response :success
    
    assert_template layout: 'application'
    
    assert_select 'title','NFL Web App'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to get in touch with us.'
    
  end
  test "should get home" do
    get :home
    assert_response :success
    
    assert_template layout: 'application'
    
    assert_select 'title', 'NFL Web App'
    assert_select 'h1', 'Home Page'
    assert_select 'p', 'Welcome to the homepage of the NFL Web App'
    
  end
  
  test "should post request contact but no email" do
    post :request_contact
    
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
    
  end
  
  test "should post request contact" do
    post :request_contact, name: "Marc", 
    email: "me@email.com", telephone: "1234567",
    message: "Hello"
    
    assert_response :redirect
    assert_not_empty flash[:notice]
    assert_nil flash[:alert]
    
  end  

end
