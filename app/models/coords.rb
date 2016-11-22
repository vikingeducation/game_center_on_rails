class Coords
  attr_reader :x, :y

  def initialize(args = {})
    @x = args[:x]
    @y = args[:y]
  end
end