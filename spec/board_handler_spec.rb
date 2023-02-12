# frozen_string_literal: true

require './lib/board_handler'

describe BoardHandler do
  context 'with an empty board' do
    subject(:board_handler) { described_class.new }

    before do
      board_handler.set_up_board
    end

    it 'places dark rooks in correct spots' do
      top_left_place = board_handler.board.grid[0][0]
      top_right_place = board_handler.board.grid[0][7]

      expect(top_left_place.current_piece.class.name).to eq('Rook')
      expect(top_left_place.current_piece.color).to eq(:dark)
      expect(top_right_place.current_piece.class.name).to eq('Rook')
      expect(top_right_place.current_piece.color).to eq(:dark)
    end

    it 'places light rooks in correct spots' do
      bottom_left_place = board_handler.board.grid[7][0]
      bottom_right_place = board_handler.board.grid[7][7]

      expect(bottom_left_place.current_piece.class.name).to eq('Rook')
      expect(bottom_left_place.current_piece.color).to eq(:light)
      expect(bottom_right_place.current_piece.class.name).to eq('Rook')
      expect(bottom_right_place.current_piece.color).to eq(:light)
    end
  end
end
