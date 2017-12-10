class DisallowNullColumns < ActiveRecord::Migration
  def change
    change_column :player_stats, :nameid, :integer, :null => false
    change_column :player_stats, :year, :integer, :null => false
    change_column :player_stats, :week, :integer, :null => false
  end
end
