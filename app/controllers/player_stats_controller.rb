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

  # GET /player_stats/1/edit
  def edit
  end

  def update_stats 
    # load statistics here
    if !(PlayerStat.where(year: params[:year], week: params[:week]).exists?)
      stats = JSON.parse(NflData::API::Statline.get_passing(params[:week], params[:year]))
      puts stats
      stats.each { |item|
        @player = Player.find_by_nameid(item["nfl_player_id"])
        if !(@player)
          @player = Player.create(nameid: item["nfl_player_id"], name: "Unknown", team: "Unknown", image: "Unknown")
          @player.save
        end
        @player_stat = @player.player_stats.create(nameid: item["nfl_player_id"], week: item["week"], year: item["year"],
        rating: item["qb_rating"], pass: item["pass_yards"])
        @player_stat.save
    }
    end
    # load table
    redirect_to player_stats_path(year: params[:year], week: params[:week])
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def player_stat_params
      params.require(:player_stat).permit(:nameid, :year, :week, :rush, :pass)
    end
end
