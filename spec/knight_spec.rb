require './lib/pieces/knight'

describe Knight do
  describe '#legal_moves' do
    context 'place is [0,1]' do
      subject(:knight) { described_class.new }
      let(:place) { double('Place', x_coord: 0, y_coord: 1)}

      it 'returns correct list of coordinates' do
        result = knight.legal_moves(place)
        expect(result[0].x_coord).to eq(2)
        expect(result[0].y_coord).to eq(2)
        expect(result[1].x_coord).to eq(1)
        expect(result[1].y_coord).to eq(3)
        expect(result[2].x_coord).to eq(2)
        expect(result[2].y_coord).to eq(0)
      end
    end
  end
end