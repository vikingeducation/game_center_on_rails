class Rps < ActiveRecord::Base
  CHOICES = ["rock", "paper", "scissors"]

  def initialize
      @victory = {:scissors => :rock, :rock => :paper, :paper => :scissors }
  end

  def check_win(choice1)
    comp_choice = computer_chooses
    if choice1 == comp_choice
#      puts "This is a draw"
    elsif @victory[choice1] == comp_choice
#      puts "computer wins"
    else
#      puts "player wins"
    end
  end

  def computer_chooses
    @comp_choice = CHOICES[rand(0..2)]
  end

end
