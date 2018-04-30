class TicTacToe
  def initilize
    @grid = Grid.new
    @player_1 = Player.new("Captain X", :X)
    @player_2 = Player.new("Doctor O", :O)
    @current_player = @player_1
  end

  def play
    while !check_outcome
      @grid.display
      @current_player.get_coordinates #[write method in class Player]
    end
    player_take_turns
  end

def player_take_turns
  if @current_player == @player_1
    @current_player = @player_2
  else
    @current_player = @player_1
  end
end

def check_outcome
  check_win || check_draw
end

def check_win
  if winning_combination?(@current_player.marker) #[write method in class Grid]
    puts "#{@current_player.name} wins!"
    true
  else
    false
  end
end

def check_draw
  if @Grid.full? #[write method in class Grid]
    puts "This is a draw."
    true
  else
    false
  end
end

end

class Grid
  def initilize
    @grid = Array.new(3){Array.new(3)}
  end

  def display
    @grid.each do |row|
      each.do |cell|
      cell.nil? ? print(" - ") : print(" " + cell.to_s)
  end

  def full?
    @grid.all? do |row|
      row.none?(&:nil?)
    end
  end

  def winning_combination?(marker)
    winning_diagonal?(marker) ||
    winning_horizontal?(marker) ||
    winning_vertical?(marker)
  end

  def winning_diagonal?(marker)
    diagonal_cells.all?{ |cell| cell == marker }
  end

  def winning_horizontal?(marker)
    horizontal_cells.all?{|cell| cell == marker}
  end

  def winning_vertical?(marker)
    vertical_cells.all?{|cell| cell == marker}
  end

  def diagonal_cells
    [[ @grid[0][0],@grid[1][1],@grid[2][2] ],[ @grid[2][0],@grid[1][1],@grid[0][2] ]]
  end

  def horizontal_cells
    [[ @grid[0][0],@grid[0][1],@grid[0][2] ],[ @grid[1][0],@grid[1][1],@grid[1][2] ], [ @grid[2][0],@grid[2][1],@grid[2][2] ]]
  end

  def vertical_cells
    [[ @grid[0][0],@grid[1][0],@grid[2][0] ],[ @grid[0][1],@grid[1][1],@grid[2][1] ], [ @grid[0][2],@grid[1][2],@grid[2][2] ]]
  end
end

class Player
  def initilize(name = "Anonymous", marker)
    raise "Marker must be a symbol" unless marker.is_a?(Symbol)
    @name = name
    @marker = marker
  end

end
