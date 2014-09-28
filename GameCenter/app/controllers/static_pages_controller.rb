class StaticPagesController < ApplicationController
  def index
    wipe_c4_session
  end

  private

  def wipe_c4_session
    session['current_board'] = nil
    session['game'] = nil
    session['game_status'] = false
    session['current_player'] = 'X'
  end
end
      