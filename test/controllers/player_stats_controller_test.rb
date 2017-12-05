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

  test "should create player_stat" do
    assert_difference('PlayerStat.count') do
      post :create, player_stat: { nameid: @player_stat.nameid + 1, pass: @player_stat.pass, rating: @player_stat.rating, week: @player_stat.week, year: @player_stat.year }
    end

    assert_redirected_to player_stat_path(assigns(:player_stat))
  end

  test "should show player_stat" do
    get :show, id: @player_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_stat
    assert_response :success
  end

  test "should update player_stat" do
    patch :update, id: @player_stat, player_stat: { nameid: @player_stat.nameid, pass: @player_stat.pass, rush: @player_stat.rush, week: @player_stat.week, year: @player_stat.year }
    assert_redirected_to player_stat_path(assigns(:player_stat))
  end

  test "should destroy player_stat" do
    assert_difference('PlayerStat.count', -1) do
      delete :destroy, id: @player_stat
    end

    assert_redirected_to player_stats_path
  end
end
