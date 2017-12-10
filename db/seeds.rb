# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'json'

first = Game.where(home: 'Home Team').first
first.delete if first
games = Game.create([home: 'Home Team', homescore: 0, away: 'Away Team', awayscore: 0, date: "00-00-0000", league: 'League', year: 0, week: 0])


first = PlayerStat.where(nameid: 1).first
first.delete if first
stats = PlayerStat.create([nameid: 1, year: 0, week: 0, rush: 0, pass: 0])


Player.delete_all
players = NflData::API::Player.get_quarterbacks
players_hash = JSON.parse(players)
players_hash.each { |item, value|
    value.each { |sub_item|
        @player = Player.create(nameid: sub_item["nfl_player_id"].to_i, name: sub_item["full_name"],
        team: sub_item["team"], image: sub_item["picture_link"])
        @player.save
    }
}
