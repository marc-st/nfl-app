require 'json'

class PlayerStatsController < ApplicationController
  before_action :set_player_stat, only: [:show, :edit, :update, :destroy]

  # GET /player_stats
  # GET /player_stats.json
  def index
    @player_stats = PlayerStat.where("year = ? AND week = ?", params[:year], params[:week]).order(pass: :desc)
  end

  # GET /player_stats/new
  def new
    @player_stat = PlayerStat.new
  end

  def update_stats 
    
    # if no records exist with the particular year and week
    if !(PlayerStat.where(year: params[:year], week: params[:week]).exists?)
      
      # Parse API result into readable format
      stats = JSON.parse(NflData::API::Statline.get_passing(params[:week], params[:year]))
      
      stats.each { |item|
      
        # find the associated player given the player_id 
        @player = Player.find_by_nameid(item["nfl_player_id"])
        
        if !(@player) # if the player doesn't exist then add new player
          @player = Player.create(nameid: item["nfl_player_id"], name: "Unknown", team: "Unknown", image: "Unknown")
          @player.save
        end
        
        # I connect player to player_stat and ensure *player_id* is in player_stats table
        @player_stat = @player.player_stats.create(nameid: item["nfl_player_id"], week: item["week"], year: item["year"],
        rating: item["qb_rating"], pass: item["pass_yards"])
        
        @player_stat.save
    }
    end
    # index route with parameters
    redirect_to player_stats_path(year: params[:year], week: params[:week])
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def player_stat_params
      params.require(:player_stat).permit(:nameid, :year, :week, :rush, :pass)
    end
end
