class RpsController < ApplicationController
  def new
  end

  def move
    rps = Rps.new(params[:move])
    session[:win_count] ||= 0
    session[:loss_count] ||= 0
    session[:win_count] += 1 if rps.won?
    session[:loss_count] += 1 if rps.lost?

    @wins = session[:win_count]
    @losses = session[:loss_count]

    @result = rps.determine_win
    render :new
  end
end
