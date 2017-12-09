require 'json'

class PlayerStatsController < ApplicationController
  before_action :set_player_stat, only: [:show, :edit, :update, :destroy]

  # GET /player_stats
  # GET /player_stats.json
  def index
    @player_stats = PlayerStat.where("year = ? AND week = ?", params[:year], params[:week]).order(pass: :desc)
  end

  # GET /player_stats/1
  # GET /player_stats/1.json
  def show
  end

  # GET /player_stats/new
  def new
    @player_stat = PlayerStat.new
  end

  # GET /player_stats/1/edit
  def edit
  end

  # POST /player_stats
  # POST /player_stats.json
  def create
    @player_stat = PlayerStat.new(player_stat_params)

    respond_to do |format|
      if @player_stat.save
        format.html { redirect_to @player_stat, notice: 'Player stat was successfully created.' }
        format.json { render :show, status: :created, location: @player_stat }
      else
        format.html { render :new }
        format.json { render json: @player_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_stats/1
  # PATCH/PUT /player_stats/1.json
  def update
    respond_to do |format|
      if @player_stat.update(player_stat_params)
        format.html { redirect_to @player_stat, notice: 'Player stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_stat }
      else
        format.html { render :edit }
        format.json { render json: @player_stat.errors, status: :unprocessable_entity }
      end
    end
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
  
  # DELETE /player_stats/1
  # DELETE /player_stats/1.json
  def destroy
    @player_stat.destroy
    respond_to do |format|
      format.html { redirect_to player_stats_url, notice: 'Player stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_stat
      @player_stat = PlayerStat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_stat_params
      params.require(:player_stat).permit(:nameid, :year, :week, :rush, :pass)
    end
end
