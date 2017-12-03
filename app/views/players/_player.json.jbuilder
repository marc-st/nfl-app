json.extract! player, :id, :name, :nameid, :team, :image, :created_at, :updated_at
json.url player_url(player, format: :json)
