json.extract! game, :id, :home, :homescore, :away, :awayscore, :date, :league, :created_at, :updated_at
json.url game_url(game, format: :json)
