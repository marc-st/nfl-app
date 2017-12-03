require 'espn_scraper'

class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.where("year = ? AND week = ?", params[:year], params[:week])
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_table

    puts NflData::API::Statline.get_passing(1, 2014)
    # NflData::API::Player.get_quarterbacks
    
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
    redirect_to index_path(year: params[:year], week: params[:week])
  end
  
  
  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
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
