class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id: false do |t|
      t.string :name
      t.primary_key :nameid
      t.string :team
      t.string :image

      t.timestamps null: false
    end
  end
end
