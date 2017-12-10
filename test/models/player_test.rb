require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  setup do
    @stat = player_stats(:one)
    @player = players(:one)
  end
  
  # assert save a Player
  test "should save valid Player" do
    assert @player.save
  end

end
