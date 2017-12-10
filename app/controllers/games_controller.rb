require 'espn_scraper'

class GamesController < ApplicationController

  # GET /games
  # GET /games.json
  def index
    @games = Game.where("year = ? AND week = ?", params[:year], params[:week])
  end

  def update_games

    # if no records exists with given year and week
    if !(Game.where(year: params[:year], week: params[:week]).exists?)
      
      # get scores for year and week in a hash
      scores = ESPN.get_nfl_scores(params[:year], params[:week])
      
      scores.each { |item|
      
        # create a game object with values from the hash
        @game = Game.create(home: item[:home_team], homescore: item[:home_score],
        away: item[:away_team], awayscore: item[:away_score], date: item[:game_date],
        league: item[:league], year: params[:year], week: params[:week])
        
        @game.save
      }
    end
    # index route with parameters
    redirect_to games_path(year: params[:year], week: params[:week])
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.permit(:home, :homescore, :away, :awayscore, :date, :league, :year, :week)
    end
end
