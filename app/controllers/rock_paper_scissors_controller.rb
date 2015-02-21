class RockPaperScissorsController < ApplicationController
  def new
  end

  def shoot
    @RPS = RockPaperScissor.new (params[:move]).to_sym
  end
end
