class GamesController < ApplicationController

  before_action :set_game, only: [:update, :show]

  def index
    games = Game.all
    render json: games, status: 201
  end

  def create
    @game = Game.create(game_params)
    render json: @game, status: 201
  end

  def update
    @game.update(game_params)
    @game.save
    render json: @game, status: 201
  end

  def show
    render json: @game, status: 201
  end

  private

  def game_params
    params.permit(state: [])
  end

  def set_game
    @game = Game.find(params[:id])
  end

end
