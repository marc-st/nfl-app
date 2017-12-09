require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { image: @player.image, name: @player.name, nameid: @player.nameid + 1, team: @player.team }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    patch :update, id: @player, player: { image: @player.image, name: @player.name, nameid: @player.nameid, team: @player.team }
    assert_redirected_to player_path(assigns(:player))
  end
end
