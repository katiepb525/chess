require './lib/movement'
require './lib/input_handler'
require './lib/board'

describe Movement do
  let(:board) { Board.new }
  subject(:movement) { described_class.new('d2d3', board) }

  describe '#move_piece' do
    let(:place_of_piece_to_move) { movement.board.grid[6][3] }
    let(:place_to_move_to) { movement.board.grid[5][3] }
    let(:pawn) { double('Pawn') }
    let(:pawn_legal_move) {[double('Place', x_coord: 3, y_coord: 5)]}

    context 'with legal notation' do
      before do
        place_of_piece_to_move.current_piece = pawn
        expect(place_of_piece_to_move).to receive(:update_symbol)
        expect(place_to_move_to).to receive(:update_symbol)
        allow(pawn).to receive(:legal_moves).with(place_of_piece_to_move).and_return(pawn_legal_move)
        allow(pawn).to receive(:can_hop).and_return(false)
        movement.move_piece
      end

      it 'allows pawn movement within legal bounds' do
        moved_piece = place_to_move_to.current_piece
        expect(moved_piece).to eq(pawn)
      end
    end

    context 'with invalid input' do
      subject(:movement) { described_class.new('gggg', board) }

      it 'raises an error' do
        expect { movement.move_piece }.to raise_error(RuntimeError, 'Input is invalid')
      end
    end

    context 'with an illegal move' do
      subject(:movement) { described_class.new('d2d5', board) }

      let(:place_of_piece_to_move) { movement.board.grid[6][3] }
      let(:place_to_move_to) { movement.board.grid[3][3] }

      before do
        place_of_piece_to_move.current_piece = pawn
        allow(pawn).to receive(:legal_moves).with(place_of_piece_to_move).and_return(pawn_legal_move)
        allow(pawn).to receive(:can_hop).and_return(false)
      end
      
      it 'raises an error' do
        expect { movement.move_piece }.to raise_error(StandardError, 'Move is illegal')
      end
    end
  end
end