class RpsController < ApplicationController

  def index
    @rps_game = Rps.new
    @playerchoice = session[:choice]
    @winner = @rps_game.check_win(@playerchoice) if @playerchoice
  end

  def create
    session[:choice] = params[:rpsChoices]
    redirect_to rps_path
  end

end
