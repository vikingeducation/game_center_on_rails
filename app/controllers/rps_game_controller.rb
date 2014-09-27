class RpsGameController < ApplicationController

		CHOICES = ["rock", "paper", "scissors"]

	def new
	end

	def index
		@draw = "DRAW"
		@comp_win = "COMP WINS"
		@player_win = "PLAYER WINS"
		if((session[:comp_count])==nil)
			session[:comp_count] = 0
		end
		if((session[:play_count])==nil) 
			session[:play_count] = 0
		end
		if is_valid?(session[:choice])
			@player = session[:choice].strip.downcase
			@computer = session[:comp_choice].strip.downcase
			@result = check_win(@player, @computer)
		else
			rps_game_index_path
		end
	end

	def create
		session[:choice] = params[:player_choice]
		session[:comp_choice] = computer_chooses
		redirect_to rps_game_index_path
	end

	def is_valid?(choice)
		!choice.nil?
	end

	def check_win(choice1, choice2)
		@victory = {:scissors => :rock, :rock => :paper, :paper => :scissors }
		if choice1 == choice2
			return @draw
		elsif @victory[choice1.strip.to_sym] == choice2
			session[:comp_count] += 1
			return @comp_win
		else
			session[:play_count] += 1
			return @player_win
		end
	end

	def computer_chooses
		@comp_choice = CHOICES[rand(0..2)]
	end

end


# to add feature to track play count

def conditions
	if((session[:history])==nil)
			session[:history] = Array.new
	end
	if((session[:counter])==nil)
			session[:counter] = 0
	end
end