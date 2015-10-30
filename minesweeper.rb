class Board
  attr_accessor :dimensions, :num_bombs, :internal_state_grid, :display_state_grid

  def initialize(dimensions = [9,9], num_bombs = 10)
    @dimensions = dimensions
    @num_bombs = num_bombs
    @internal_state_grid = Array.new(dimensions[0]) {Array.new(dimensions[1])}
    @display_state_grid = Array.new(dimensions[0]) {Array.new(dimensions[1])}
  end

  def reveal(coordinates)
    row = coordinates[0]
    column = coordinates[1]

    queue = [[row,column]]

    until queue.empty?
      current_square = queue.shift
      current_value = @internal_state_grid[current_square[0]][current_square[1]]
      if current_value.is_a?(Fixnum)
        @display_state_grid[current_square[0]][current_square[1]] = true
        if current_value == 0
          queue.concat(get_children(current_value))
        end
      end
    end
  end

  def get_children(position)
    row = position[0]
    column = position[1]

    candidate_spaces = [ 
      [row - 1, column - 1],
      [row, column - 1],
      [row + 1, column - 1],
      [row - 1, column - 1],
      [row + 1, column],
      [row - 1, column + 1],
      [row, column + 1],
      [row + 1, column + 1]
    ]
  end

end
