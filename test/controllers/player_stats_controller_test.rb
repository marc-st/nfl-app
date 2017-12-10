require 'test_helper'

class PlayerStatsControllerTest < ActionController::TestCase
  setup do
    @player_stat = player_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should update stats" do
    post :update_stats, :year => 2001, :week => 1
    assert_redirected_to "/player_stats?week=1&year=2001"
  end
end
