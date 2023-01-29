require './lib/pieces/rook'

describe Rook do
  describe '#legal_moves' do
    subject(:rook) { described_class.new }

    context 'place is [0,0]' do
      let(:place) { double('Place', x_coord: 0, y_coord: 0) }
      let(:result) { [] }

      before do
        result = rook.legal_moves(place)
      end

      it 'returns correct list of coordinates' do
        expect(result).to all include([1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7])
      end
    end
  end

end