# frozen_string_literal: true

require './lib/pieces/king'

describe King do
  describe '#legal_moves' do
    subject(:king) { described_class.new }
    context 'place is [3,3]' do
      let(:place) { double('Place', x_coord: 3, y_coord: 3) }
      let(:result_arr) { [] }

      before do
        result = king.legal_moves(place)
        result.each do |place|
          arr = []
          arr.push(place.x_coord, place.y_coord)
          result_arr.push(arr)
        end
      end

      it 'returns correct moveset' do
        expect(result_arr).to include([2, 2], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3], [4, 4])
      end

      it 'has no duplicates' do
        expect(result_arr).to eq(result_arr.uniq)
      end

      it 'has no missing moves' do
        expect(result_arr.length).to be(8)
      end
    end
  end
end
