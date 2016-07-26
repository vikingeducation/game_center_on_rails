module GamesHelper

  def load_game
    [JSON.parse(session[:grid]), session[:player]]
  end

  def save_game(game)
    session[:grid] = game.board.grid.to_json
    session[:player] = game.player
  end
end
