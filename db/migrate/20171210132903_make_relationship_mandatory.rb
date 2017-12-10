class MakeRelationshipMandatory < ActiveRecord::Migration
  def change
    change_column :player_stats, :player_id, :integer, :null => false
  end
end
