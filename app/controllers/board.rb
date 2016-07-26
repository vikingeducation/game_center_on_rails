class Board

  attr_reader :state

  def initialize(state = nil)
    col = 7
    row = 6
    state ||= Array.new(row) { Array.new(col) }
    @state = state
  end

  # [
  #   ["X"]
  #   ["O", "O"]
  #   []
  #   []
  #   []
  #   []
  # ]

end