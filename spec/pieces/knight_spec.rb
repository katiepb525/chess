# frozen_string_literal: true

require './lib/pieces/knight'

describe Knight do
  describe '#legal_moves' do
    subject(:knight) { described_class.new }

    context 'place is [0,1]' do
      let(:place) { double('Place', x_coord: 0, y_coord: 1) }
      let(:result_arr) { [] }

      before do
        result = knight.legal_moves(place)
        result.each do |place|
          arr = []
          arr.push(place.x_coord, place.y_coord)
          result_arr.push(arr)
        end
      end

      it 'returns correct list of coordinates with none missing' do
        expect(result_arr).to include([2, 2], [1, 3], [2, 0])
        expect(result_arr.length).to be(3)
      end
    end

    context 'place is [7,7]' do
      let(:place) { double('Place', x_coord: 7, y_coord: 7) }
      let(:result_arr) { [] }

      before do
        result = knight.legal_moves(place)
        result.each do |place|
          arr = []
          arr.push(place.x_coord, place.y_coord)
          result_arr.push(arr)
        end
      end

      it 'returns correct list of coordinates with none missing' do
        expect(result_arr).to include([5, 6], [6, 5])
        expect(result_arr.length).to be(2)
      end
    end
  end
end
