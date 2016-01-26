class ConnectFourController < ApplicationController

  def new

    if session[:player].nil?
      session[:player] = "player_1"
    end 
    
    if session[:game_message]
      @game_message = session[:game_message]
    end 

    if session[:board]
      board = JSON.parse(session[:board])
      game = ConnectFour.new(board,session[:player])
    else
      game = ConnectFour.new(nil,session[:player])
      game.board.setup
      board = game.board.board
    end

    session[:board] = game.board.board.to_json
    @board = board 

  end

  def drop_piece

    board = JSON.parse(session[:board])
    player = session[:player]
    game = ConnectFour.new(board,player)
    column = params[:column].to_i

    if game.check_game(player,column)
      session[:board] = game.board.board.to_json
      session[:player] = game.switch_player
      redirect_to '/'
    else 
      session[:player] = game.switch_player
      redirect_to connect_four_game_over_path
    end

  end

  def new_game
    session[:board] = nil
    session[:player] = nil
    session[:game_message] = nil
    redirect_to '/'
  end  

  def game_over
    board = JSON.parse(session[:board])
    player = session[:player]
    game = ConnectFour.new(board,player)
    puts "Player is #{session[:player]}"
    if player = "player_1"
      session[:game_message] = game.check_win_or_draw(game.player_1)
    else
      session[:game_message] = game.check_win_or_draw(game.player_2)
    end
   
    redirect_to '/'
  end
    
end
