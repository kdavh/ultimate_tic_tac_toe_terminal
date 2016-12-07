require "./toe_game.rb"
require "./view.rb"

game = ToeGame.new
view = View.new(game)

while game.on do
  view.game

  array = readline.strip.split(",").map(&:to_i)

  if !game.place([array[0..1], array[2..3]])
    view.rejected_move
  end
end

view.winner
