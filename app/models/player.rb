class Player < ActiveRecord::Base
    # on the 1 side of the 1:m relationship between Player:PlayerStat
    has_many :player_stats
end
