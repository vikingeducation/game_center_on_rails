class HiLoController < ApplicationController
  def new
    generate_hidden_num
    @answer = session['hidden_num']
    session['submitted_guesses'] = 0
    guess_submitted?
    session['max_guesses'] = 3

  end

  def make_move
    @answer = session['hidden_num']

    guess_submitted?
    @guess = params['guess']
    @game_over = game_over?

    render :new
  end

  private

  def generate_hidden_num
    session['hidden_num'] = rand(1..10)
  end

  def guess_submitted?
    if params['guess'] == nil
      @guess_submitted = false
    else
      @submitted_guesses = session['submitted_guesses']
      @submitted_guesses += 1
      session['submitted_guesses'] = @submitted_guesses
      @guess_submitted = true
    end
  end

  def game_over?
    if guessed_correctly?
      @won_game = true
      @lost_game = false
      true
    elsif out_of_guesses?
      @won_game = false
      @lost_game = true
      false
    else
      @won_game = false
      @lost_game = false
      false
    end
  end

  def guessed_correctly?
    params['guess'].to_i == session['hidden_num']
  end

  def out_of_guesses?
    session['submitted_guesses'] >= session['max_guesses']
  end

end
