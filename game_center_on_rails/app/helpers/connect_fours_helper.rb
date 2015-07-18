module ConnectFoursHelper

  def load_game
    if session["connect4"]
      @game = JSON.parse(session["connect4"])
    else
      @game = nil
    end
  end

  def save_game
    session["connect4"] = @game.to_json
  end

end
