class HomeController < ApplicationController
  def index
    init_session
  end

  def init_session
      session[:your_score] = 0
      session[:their_score] = 0
      session[:player_move] = "none yet "
      session[:ai_move] = "none yet "
      session[:result] = " Please Play "
  end

end
