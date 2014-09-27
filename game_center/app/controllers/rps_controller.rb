class RpsController < ApplicationController
  def index
  @game = Game.new
  @playerchoice = params[:session]
  end

  def create
    session[:choice] = params[:rpsChoices]
    render index_path
  end

end
