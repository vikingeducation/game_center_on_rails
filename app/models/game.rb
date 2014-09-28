class Game 

	attr_accessor :winner, :comp_choice, :player_choice
	

	def initialize(player_choice)
		@player_choice = player_choice
		@comp_choice = rand(1..3)
		@eval_winner = {3 => 1, 1 => 2, 2 => 3 }

		if @player_choice == @comp_choice
			@winner = "This is a draw"
		elsif @eval_winner[@player_choice] == @comp_choice
			@winner = "computer wins"
		else
			@winner = "player wins"
		end

	end





end