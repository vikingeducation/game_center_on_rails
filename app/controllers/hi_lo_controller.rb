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
    set_game_over_status
    @feedback = determine_feedback

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

  def set_game_over_status
    if guessed_correctly?
      @won_game = true
      @lost_game = false
    elsif out_of_guesses?
      @won_game = false
      @lost_game = true
    else
      @won_game = false
      @lost_game = false
    end
  end

  def guessed_correctly?
    params['guess'].to_i == session['hidden_num']
  end

  def out_of_guesses?
    session['submitted_guesses'] >= session['max_guesses'] && !guessed_correctly?
  end

  def determine_feedback
    if out_of_guesses?
      "You're out of guesses."
    elsif params['guess'].to_i > session['hidden_num']
      'Go lower.'
    elsif params['guess'].to_i < session['hidden_num']
      'Go higher.'
    else
      "You're right!"
    end
  end

end
