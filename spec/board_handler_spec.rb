# frozen_string_literal: true

require './lib/board_handler'

describe BoardHandler do
  subject(:board_handler) { described_class.new }

  context 'with an empty board' do
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

  context 'with legal notation' do
    let(:pawn) { double('Pawn')}
    let(:place_of_piece_to_move) { board_handler.board.grid[6][3] }
    let(:place_to_move_to) {board_handler.board.grid[5][3]}
    before do
      place_of_piece_to_move.current_piece = pawn
      raw_input = 'd2d3'
      board_handler.move_piece(raw_input)
    end

    it 'allows pawn movement within legal bounds' do
      moved_piece = place_to_move_to.current_piece
      expect moved_piece.to eq(pawn)
    end

    # it 'allows knight movement within legal bounds' do

    # end

    # it 'allows queen movement within legal bounds' do

    # end

    # it 'allows bishop movement within legal bounds' do
    # end

    # it 'allows king movement within legal bounds' do
    # end

    # it 'allows rook movement within legal bounds' do
    # end
  end

  context 'with illegal notation' do
    it 'throws an error message' do
    end
  end
end