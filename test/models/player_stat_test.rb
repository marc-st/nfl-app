require 'test_helper'

class PlayerStatTest < ActiveSupport::TestCase
  
  setup do
    @stat = player_stats(:one)
    @player = players(:one)
  end

  # allow PlayerStat with associated player_id
  test "should save valid PlayerStat" do
    assert @stat.save
  end
  
  # refute PlayerStat that doesn't have an associated player_id
  test "should not allow invalid PlayerStat" do
    @stat = PlayerStat.create(nameid: 3, year: 2001, week: 4, rating: 1)
    refute @stat.valid?
  end
  
end
