class RockPaperScissorsController < ApplicationController
  def new
  end

  def shoot
    @rps = RockPaperScissor.new (params[:move]).to_sym
  end
end
