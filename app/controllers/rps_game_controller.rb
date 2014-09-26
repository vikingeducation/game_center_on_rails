class RpsGameController < ApplicationController

	
	CHOICES = ["rock", "paper", "scissors"]

	@victory = {:scissors => :rock, :rock => :paper, :paper => :scissors }

	

	def new
		# @game = Game.new(params[])
	end

	def index
		@game = Game.new
		@player = session[:choice]
	end

	def create
		session[:choice] = params[:player_choice]
		redirect_to rps_game_index_path
	end

	def is_valid?(choice)
		CHOICES.include?(choice)
	end

	def check_win(choice1, choice2)
		if choice1 == choice2
			puts "This is a draw"
		elsif @victory[choice1] == choice2
			puts "computer wins"
		else
			puts "player wins"
		end
	end

	def computer_chooses
		@comp_choice = CHOICES[rand(0..2)]
	end

end


# to add feature to track play count

# def conditions
# 		if((session[:history])==nil)
#   			session[:history] = Array.new
# 		end
# 		if((session[:counter])==nil)
#   			session[:counter] = 0
# 		end
# 	end