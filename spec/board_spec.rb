require './lib/board'
describe Board do
  context 'upon initialization' do
    subject(:board) { described_class.new }

    it 'creates an 8x8 grid' do
      expect(board.grid.flatten.length).to be(64)
    end

    it 'has a light square in the bottom right corner' do
      expect(board.grid[7][0].color_square).to be(:light)
    end

  end
end