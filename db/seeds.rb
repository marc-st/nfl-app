# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first = Game.where(home: 'Home Team').first
first.delete if first

games = Game.create([home: 'Home Team', homescore: 0, away: 'Away Team', awayscore: 0, date: "00-00-0000", league: 'League'])
