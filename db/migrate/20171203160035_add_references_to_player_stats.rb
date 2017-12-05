class AddReferencesToPlayerStats < ActiveRecord::Migration
  def change
    add_reference :player_stats, :player, index: true, foreign_key: true
  end
end
