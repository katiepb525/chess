# frozen_string_literal: true

require './lib/pieces/rook'

describe Rook do
  subject(:rook) { described_class.new }

  context 'place is [0,0]' do
    let(:place) { double('Place', x_coord: 0, y_coord: 0) }
    let(:result_arr) { [] }

    before do
      result = rook.legal_moves(place)
      result.each do |place|
        arr = []
        arr.push(place.x_coord, place.y_coord)
        result_arr.push(arr)
      end
    end

    it 'returns correct list of coordinates with none missing' do
      expect(result_arr).to include([1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, 1], [0, 2], [0, 3],
                                    [0, 4], [0, 5], [0, 6], [0, 7])
      expect(result_arr.length).to be(14)
    end
  end

  context 'place is [7,7]' do
    let(:place) { double('Place', x_coord: 7, y_coord: 7) }
    let(:result_arr) { [] }

    before do
      result = rook.legal_moves(place)
      result.each do |place|
        arr = []
        arr.push(place.x_coord, place.y_coord)
        result_arr.push(arr)
      end
    end

    it 'returns correct list of coordinates with none missing' do
      expect(result_arr).to include([7, 6], [7, 5], [7, 4], [7, 3], [7, 2], [7, 1], [7, 0], [6, 7], [5, 7], [4, 7],
                                    [3, 7], [2, 7], [1, 7], [0, 7])
      expect(result_arr.length).to be(14)
    end
  end
end
