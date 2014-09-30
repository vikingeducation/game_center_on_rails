class Game 

	attr_accessor :winner, :game_win, :comp_choice, :player_choice

	def initialize(player_choice)
		@player_choice = player_choice
		@eval_winner = {3 => 1, 1 => 2, 2 => 3 }
	end

	def comp_choice
		rand(1..3)
	end

	def game_win(player_choice, comp_choice)
		if player_choice == comp_choice
			"This is a draw"
		elsif @eval_winner[player_choice] == comp_choice
			"computer wins"
		else
			"player wins"
		end
	end

end