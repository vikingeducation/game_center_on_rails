Game Center on Rails
Featuring: Connect Four

David Meza (https://github.com/david-meza)
Garrett Weinert (https://github.com/gweinert)

Game center is a compilation of classic board games written in Ruby and using the Rails framework to have a web interface


This is a project as part of the Viking Code School curriculum
http://www.vikingcodeschool.com/




|                       | <% board.each do |row| %>
|                       |     <% row.each do |tile| %>
|                       |         <p>tile</p>
|                       |
|                       |
|                       |
|_______________________|

  o   o   o   o   o   o

  [Submit move]

  [Restart]

# Database: Connect_Four_Game

# Index page -> Shows a welcome message, ask for name, and game-mode to begin playing
# Redirect to the play path

# Render empty board
# Wait for input...

# Classes
# Board ->
  # Data-structure: 2-D array
  # 


# Player ->
  #Human
    # Make-move -> Checks if the move is valid (column is not full)
      # If it is, we perform the move
      # Else, we re-render the page with a flash
  #AI
    # Make-move ->
      # 1. Performs a winning move
      # 2. Performs a move that prevents losing
      # 3. If neither of these are possible, performs a random valid move
