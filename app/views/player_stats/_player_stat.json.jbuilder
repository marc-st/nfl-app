json.extract! player_stat, :id, :nameid, :year, :week, :rush, :pass, :created_at, :updated_at
json.url player_stat_url(player_stat, format: :json)
