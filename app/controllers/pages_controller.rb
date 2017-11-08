class PagesController < ApplicationController

  def index
    session['game_over'] = false
  end

end
