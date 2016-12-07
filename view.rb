class View
  SQUARES = {
    nil => "\u24FF",
    ToeGame::PLAYER1 => "\u2460",
    ToeGame::PLAYER2 => "\u2461"
  }

  def initialize(game)
    @game = game
  end

  def game
    board = ""
    3.times do |big_row|
      3.times do |small_row|
        3.times do |big_col|
          3.times do |small_col|
            square = @game.board.square_at([big_col, big_row]).square_at([small_col, small_row])
            board += SQUARES[square.value]

            if big_col == 2 && small_col == 2
              board += "\n"

              if small_row == 2
                board += "\n"
              end
            elsif small_col == 2
              board += " "
            end
          end
        end
      end
    end

    print board
    puts
    puts "Previous move was #{@game.previous_moves}"
    puts "Go, player #{@game.current_player}"
  end

  def rejected_move
    puts "\n" + "*"*20
    puts "You can't go there, try again Player #{@game.current_player}"
    puts "*"*20
  end

  def winner
    puts
    puts "Player #{@game.winner} won"
  end
end
