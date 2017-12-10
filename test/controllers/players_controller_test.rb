require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  setup do
    @player = players(:two)
  end

  # success of /players route 
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  # success of players/id/edit route
  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end
  
  # success of players/id route
  test "should get show" do
    get :show, id: @player
    assert_response :success
  end
  
end
