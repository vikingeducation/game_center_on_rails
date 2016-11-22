class Cell
  attr_accessor :value

  def initialize(args = {})
    @coordinates  = args[:coords]
    @value        = args[:value]
  end

  def coords
    [coordinates.x, coordinates.y]
  end

  private
    attr_reader :coordinates
end
