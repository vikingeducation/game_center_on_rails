class RpsController < ApplicationController
  def new
  end

  def move
    rps = Rps.new(params[:move])
    @result = rps.determine_win
    render :new
  end
end
