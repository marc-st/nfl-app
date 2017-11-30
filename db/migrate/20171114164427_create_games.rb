class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :home
      t.integer :homescore
      t.string :away
      t.integer :awayscore
      t.string :date
      t.string :league
      t.integer :year
      t.integer :week

      t.timestamps null: false
    end
  end
end
