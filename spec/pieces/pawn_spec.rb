# frozen_string_literal: true

require './lib/pieces/pawn'

describe Pawn do
  describe '#legal_moves' do
    subject(:pawn) { described_class.new }
    context 'light pawn, start place is [3,3]' do
      let(:place) { double('Place', x_coord: 3, y_coord: 3) }

      it 'returns only possible move (forward)' do
        result = pawn.legal_moves(place)
        expect([result[0].x_coord, result[0].y_coord]).to eq([3, 2])
      end
    end

    context 'dark pawn, start place is [3,3]' do
      let(:place) { double('Place', x_coord: 3, y_coord: 3) }
      
      before do
        pawn.to_dark_color
      end

      it 'returns only possible move (forward)' do
        result = pawn.legal_moves(place)
        expect([result[0].x_coord, result[0].y_coord]).to eq([3, 4])
      end
    end
  end
end
