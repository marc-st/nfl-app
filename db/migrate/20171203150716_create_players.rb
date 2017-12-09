class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id: false do |t|
      t.string :name, null: true
      t.primary_key :nameid
      t.string :team, null: true
      t.string :image

      t.timestamps null: false
    end
  end
end
