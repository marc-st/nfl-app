class Game < ActiveRecord::Base
    validates :home, presence: true
    validates :away, presence: true
end
