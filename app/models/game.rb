class Game < ActiveRecord::Base
    # must contain a home and away team
    validates :home, presence: true
    validates :away, presence: true
end
