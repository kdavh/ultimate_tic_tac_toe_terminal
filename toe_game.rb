class ToeGame
  PLAYER1 = 1
  PLAYER2 = 2

  attr_reader :current_player, :board

  def initialize
    @board = Board.new { Board.new { Square.new } }
    @current_player = PLAYER1
    @previous_big_move = [0, 0]
    @previous_small_move = [1, 1]
  end

  def on
    !winner
  end

  def place(moves)
    if legal?(moves)
      @board.place(moves, @current_player)
      @current_player = @current_player == PLAYER1 ? PLAYER2 : PLAYER1
      @previous_big_move = moves[0]
      @previous_small_move = moves[1]
      true
    else
      false
    end
  end

  def winner
    @board.winner
  end

  def previous_moves
    [@previous_big_move, @previous_small_move]
  end

  private

  def legal?(current_moves)
    # first check is a responsibility of the game, other checks are rules of the board
    current_moves[0] == @previous_small_move && @board.legal?(current_moves)
  end
end


class Board
  def initialize(&blk)
    @grid = Array.new(3) { Array.new(3) { blk.call } }
  end

  def legal?(moves)
    moves.flatten.all? { |coord| (0..2).include?(coord) } &&
      winner == nil &&
      square_at(moves.first).legal?(moves[1..-1])
  end

  def place(moves, player)
    square_at(moves.first).place(moves[1..-1], player)
  end

  def winner
    @grid.find do |col|
      winner_for(col)
    end ||

    (0..2).find do |i|
      winner_for([@grid[0][i], @grid[1][i], @grid[2][i]])
    end ||

    winner_for((0..2).map { |i| @grid[2 - i][i] }) ||
    winner_for((0..2).map { |i| @grid[i][2 - i] })
  end

  def value
    winner
  end

  def square_at(move)
    @grid[move[0]][move[1]]
  end

  private

  def winner_for(squares)
    vals = squares.map(&:value)

    if vals[0] && vals[0] == vals[1] && vals[0] == vals[2]
      vals[0]
    end
  end
end


class Square
  attr_reader :value

  def initialize
    @value = nil
  end

  def place(_, player)
    @value = player
  end

  def legal?(_)
    !value
  end
end
