class AddColumnsToGames < ActiveRecord::Migration
  def change
    add_column :games, :year, :integer
    add_column :games, :week, :integer
  end
end
