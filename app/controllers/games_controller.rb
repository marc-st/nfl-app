require 'espn_scraper'

class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.where("year = ? AND week = ?", params[:year], params[:week])
  end

  def update_games
    
    puts NflData::API::Player.get_quarterbacks
    
    if !(Game.where(year: params[:year], week: params[:week]).exists?)
      scores = ESPN.get_nfl_scores(params[:year], params[:week])
      
      scores.each { |item|
        @game = Game.new
        @game.home = item[:home_team]
        @game.homescore = item[:home_score]
        @game.away = item[:away_team]
        @game.awayscore = item[:away_score]
        @game.date = item[:game_date]
        @game.league = item[:league]
        @game.year = params[:year]
        @game.week = params[:week]
        @game.save
      }
    end
    # load table
    redirect_to games_path(year: params[:year], week: params[:week])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.permit(:home, :homescore, :away, :awayscore, :date, :league, :year, :week)
    end
end
