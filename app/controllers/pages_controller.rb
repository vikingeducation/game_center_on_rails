class PagesController < ApplicationController
  def index
    session['game_over'] = false
  end

  def blackjack
    deck = Card.build_deck
    @dealer = Dealer.new
    @player = Player.new
    @game_over = session['game_over']
    @bet = 0

    # modify objects
    @dealer.hand = deck.pop(2)
    @player.hand = deck.pop(2)
    @dealer.set_hand_value
    @player.set_hand_value

    # save objects to session
    session['deck'] = deck
binding.pry
    session['dealer_hand'] = @dealer.hand
    session['dealer_hand_value'] = @dealer.hand_value

    session['player_hand'] = @player.hand
    session['player_hand_value'] = @player.hand_value
    session['player_bankroll'] = @player.bankroll

    # output objects to view
    # render :blackjack, locals: { dealer: dealer, player: player, bet: 0, game_over: game_over }
  end
end
