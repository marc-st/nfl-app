require 'test_helper'

class GameTest < ActiveSupport::TestCase

  test "save a game" do
    @game = games(:one)
    @game.save
    assert @game.valid?
  end
  
end
