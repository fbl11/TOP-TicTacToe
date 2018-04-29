class TicTacToe
  def initilize
    @grid = Grid.new
    @player_1 = Player.new("Captain X", :X)
    @player_2 = Player.new("Doctor O", :O)
    @current_player = @player_1
  end

  def play
    while check_outcome != win || check_outcome != draw #[write check_outcome in class TicTacToe]
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
end

def check_draw
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

end

class Player
  def initilize(name = "Anonymous", marker)
    raise "Marker must be a symbol" unless marker.is_a?(Symbol)
    @name = name
    @marker = marker
  end

end
