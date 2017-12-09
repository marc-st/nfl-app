require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  
  setup do
    @game = games(:one)
  end
  
  # /games with no params
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end
  
  # /games with year and week params
  test "give params to index" do
    get :index, :year => 2001, :week => 1
    assert_not_nil assigns(:games)
  end
  
  # assert post method update_games works succesfully
  test "should update games" do
    post :update_games, :year => 2001, :week => 1
    assert_redirected_to "/games?week=1&year=2001"
  end
end
