class PlayerStat < ActiveRecord::Base
    # on the Many side of the 1:m relationship between Player:PlayerStat
    belongs_to :player
    # must have these columns
    validates_presence_of :nameid, :year, :week, :player_id
end
