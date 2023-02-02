# frozen_string_literal: true

require './lib/pieces/queen'
describe Queen do
  describe '#legal_moves' do
    subject(:queen) { described_class.new }

    context 'place is [3,3]' do
      let(:place) { double('Place', x_coord: 3, y_coord: 3) }
      let(:result_arr) { [] }
      before do
        result = queen.legal_moves(place)
        result.each do |place|
          arr = []
          arr.push(place.x_coord, place.y_coord)
          result_arr.push(arr)
        end
      end

      it 'returns correct left diag moveset' do
        expect(result_arr).to include([0, 6], [1, 5], [2, 4], [4, 2], [5, 1], [6, 0])
      end

      it 'returns correct right diag moveset' do
        expect(result_arr).to include([0, 0], [1, 1], [2, 2], [4, 4], [5, 5], [6, 6], [7, 7])
      end

      it 'returns correct up/down straight moveset' do
        expect(result_arr).to include([3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7])
      end

      it 'returns correct left/right straight moveset' do
        expect(result_arr).to include([0, 3], [1, 3], [2, 3], [4, 3], [5, 3], [6, 3], [7, 3])
      end

      it 'has no duplicates' do
        expect(result_arr).to eq(result_arr.uniq)
      end

      it 'has no missing moves' do
        expect(result_arr.length).to be(27)
      end
    end
  end
end
