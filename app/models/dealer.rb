class Dealer < Player

  def initialize(hand: [], hand_value: 0)
    @name = "Dealer"
    @hand = hand
    @hand_value = hand_value
  end

end