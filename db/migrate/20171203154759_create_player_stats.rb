class CreatePlayerStats < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|
      t.integer :nameid
      t.integer :year
      t.integer :week
      t.float   :rating
      t.integer :pass

      t.timestamps null: false
    end
  end
end
