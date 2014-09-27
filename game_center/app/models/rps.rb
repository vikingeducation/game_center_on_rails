class Rps < ActiveRecord::Base
  @@choices = ["rock", "paper", "scissors"]

  def initialize
    @victory = {:scissors => :rock, :rock => :paper, :paper => :scissors }
  end

  def check_win(choice1)
    comp_choice = computer_chooses
    if choice1 == comp_choice
      "Computer choice was: #{comp_choice} this is a draw"
    elsif @victory[choice1] == comp_choice
      "Computer choice was: #{comp_choice} computer wins"
    else
      "Computer choice was: #{comp_choice} player wins"
    end
  end

  def computer_chooses
    @comp_choice = @@choices[rand(0..2)]
  end

end
