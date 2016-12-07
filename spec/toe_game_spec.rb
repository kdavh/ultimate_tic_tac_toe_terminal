require "rspec"
require_relative '../toe_game.rb'

RSpec.describe ToeGame do
  let(:game) { ToeGame.new }

  describe "place" do
    it "puts current player piece on specified square" do
    end
  end

  describe "place" do
    it "allows start move anywhere in big center square" do
      expect(game.place([[1, 1], [0, 0]])).to eq(true)
    end

    it "doesn't allow second move in the same spot" do
      expect(game.place([[1, 1], [0, 0]])).to eq(true)
      expect(game.place([[1, 1], [0, 0]])).to eq(false)
    end

    it "does not allow start move anywhere outside the big center square" do
      expect(game.place([[0, 1], [0, 0]])).to eq(false)
    end

    describe "legal moves" do
      it "allows move if previous move's position on the small board is the current move's position on the large board" do
        game.place([[1, 1], [2, 2]])
        expect(game.place([[2, 2], [0, 0]])).to eq(true)
      end
    end

    describe "illegal moves" do
      it "does not allow move if previous move's position on the small board is not the current move's position on the large board" do
        game.place([[1, 1], [2, 2]])
        expect(game.place([[1, 2], [0, 0]])).to eq(false)
      end

      it "does not allow move if small board has a winner" do
        expect(game.place([[1, 1], [0, 0]])).to eq(true)
        expect(game.place([[0, 0], [1, 1]])).to eq(true)
        expect(game.place([[1, 1], [0, 1]])).to eq(true)
        expect(game.place([[0, 1], [1, 1]])).to eq(true)
        expect(game.place([[1, 1], [0, 2]])).to eq(true)
        expect(game.place([[0, 2], [1, 1]])).to eq(true)

        expect(game.place([[1, 1], [2, 2]])).to eq(false)
      end
    end
  end
end
