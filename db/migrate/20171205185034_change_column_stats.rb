class ChangeColumnStats < ActiveRecord::Migration
  def change
    rename_column :player_stats, :rush, :rating
    change_column :player_stats, :rating, :float
  end
end
