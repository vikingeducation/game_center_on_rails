class PagesController < ApplicationController

  def index
  end

  def blackjack
    session['game_over'] = false
  end

end
