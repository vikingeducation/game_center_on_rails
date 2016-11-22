require File.expand_path('../cell', __FILE__)

class Board
  attr_reader :default, :height, :width

  extend Forwardable
  def_delegator :cells, :each
  include Enumerable

  def initialize(args = {})
    @default  = args[:default]
    @height   = args[:height]  || 6
    @width    = args[:width]   || 7
    @grid     = args[:state]   || build(width, height)
    populate if default
  end

  def cell(x, y)
    select { |cell| cell.coords == [x, y]  }[0]
  end

  def cells
    columns.flatten
  end

  def clear
    populate(nil)
  end

  def columns
    grid
  end

  def diagonals
    positive_diagonals + negative_diagonals
  end

  def positive_diagonals
    diagonals = []

    positive_diagonal_starting_points.each do |coordinate|
      diagonals << get_positive_diagonal(coordinate)
    end

    diagonals
  end

  def negative_diagonals
    diagonals = []

    negative_diagonal_starting_points.each do |coordinate|
      diagonals << get_negative_diagonal(coordinate)
    end

    diagonals
  end

  def neighbors(cell: nil, coords: nil)
    raise ArgumentError unless cell || coords

    coordinates = cell ? cell.coords : coords
    neighbors_coordinates = neighbors_coordinates(coordinates)

    cells.select do |neighbor|
      neighbors_coordinates.include?(neighbor.coords)
    end
  end

  def populate(new_value = default)
    each do |cell|
      begin
        value = new_value.dup
      rescue TypeError
        value = new_value
      ensure
        cell.value = value
      end
    end
  end

  def rows
    grid.transpose
  end

  def view
    rows.map do |row|
      stringify_row(row)
    end.join("\n")
  end

  private
    attr_reader :grid

    def stringify_row(row)
      (row.map { |cell| "|#{ cell.value || '-'  }"  } + ["|"]).join
    end

    def get_positive_diagonal(starting_coordinate)
      diagonal = []

      x_position = starting_coordinate.x
      y_position = starting_coordinate.y

      while y_position <= upper_limit
        break if x_position > right_hand_limit
        diagonal << cell(x_position, y_position)
        x_position += 1
        y_position += 1
      end

      diagonal
    end

    def positive_diagonal_starting_points
      diagonal_starting_points = []

      upper_limit.downto(lower_limit).each do |y|
        diagonal_starting_points << Coords.new(x: left_hand_limit, y: y)
      end

      ((left_hand_limit + 1)..right_hand_limit).each do |x|
        diagonal_starting_points << Coords.new(x: x, y: lower_limit)
      end

      diagonal_starting_points
    end

    def get_negative_diagonal(starting_coordinate)
      diagonal = []

      x_position = starting_coordinate.x
      y_position = starting_coordinate.y - 1

      while y_position >= lower_limit
        break if x_position > right_hand_limit
        diagonal << cell(x_position, y_position)
        x_position += 1
        y_position -= 1
      end

      diagonal
    end

    def negative_diagonal_starting_points
      diagonal_starting_points = []

      ((lower_limit + 1)..height).each do |y|
        diagonal_starting_points << Coords.new(x: left_hand_limit, y: y)
      end

      ((left_hand_limit + 1)..right_hand_limit).each do |x|
        diagonal_starting_points << Coords.new(x: x, y: height)
      end

      diagonal_starting_points
    end

    def build(width, height)
      grid = Array.new(width) { Array.new }
      cell_coordinates.each do |coords|
        grid[coords.x] << Cell.new(coords: coords)
      end
      grid
    end

    def cell_coordinates
      cell_coordinates = []
      x_range.each do |x_position|
        y_range.each do |y_position|
          cell_coordinates << Coords.new(x: x_position, y: y_position)
        end
      end
      cell_coordinates
    end

    def neighbors_coordinates(coordinates)
      x, y = coordinates
      [[(x - 1), (y - 1)], [(x - 1), y], [(x - 1), (y + 1)],
       [x, (y + 1)], [(x + 1), (y + 1)], [(x + 1), y],
       [(x + y), (y - 1)], [x, (y - 1)]]
    end

    def left_hand_limit
      0
    end

    def right_hand_limit
      (width - 1)
    end

    def upper_limit
      (height - 1)
    end

    def lower_limit
      0
    end

    def x_range
      (left_hand_limit..right_hand_limit)
    end

    def y_range
      (lower_limit..upper_limit)
    end
end
