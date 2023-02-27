# frozen_string_literal: true

require './lib/board_handler'
require './lib/display'
require './lib/player'
require './lib/movement'

# Manages aspects concerning rounds, game rules, checkmate/stalemate conditions, saving and loading game.
# (Might be too many responsibilites, though.)
class GameHandler
  include Display
  def initialize
    @turn = 0
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @board_handler = BoardHandler.new
    @input_handler = InputHandler.new
    @movement = nil
  end

  def start_game
    puts intro_display
    get_player_name(@player1)
    get_player_name(@player2)
    set_up_game
  end

  private

  def get_player_name(player)
    puts ask_player_name(player)
    input = gets.chomp
    player.name = input
  end

  def play_round
    @turn += 1
    if @turn.odd?
      @player1
    else
      @player2
    end
  end

  def set_up_game
    @board_handler.set_up_board
    play_game
  end

  def handle_player_input(current_player)
    current_player.raw_input = gets.chomp
    notation_valid = @input_handler.notation_is_valid?(current_player.raw_input)

    until notation_valid
      if notation_valid == false
        puts display_bad_input
      end
      current_player.raw_input = gets.chomp
      notation_valid = @input_handler.notation_is_valid?(current_player.raw_input)
    end
  end

  def handle_player_movement(current_player) # Kind of messy?
    @movement = Movement.new(current_player.raw_input, @board_handler.board, @input_handler)
    case @movement.ok_to_move_to?
    when true
      @movement.move_piece
    when false
      until @movement.ok_to_move_to?
        puts "That move is illegal. Please enter a legal move."
        handle_player_input(current_player)
        @movement = Movement.new(current_player.raw_input, @board_handler.board, @input_handler)
      end
      @movement.move_piece
    end
  end

  def play_game
    until game_over? # will loop indefinetely! wip
      current_player = play_round
      display_board(@board_handler)
      puts ask_input(current_player)
      handle_player_input(current_player)
      handle_player_movement(current_player)
      display_board(@board_handler)
    end
    # game_over_msg(current_player)
  end

  def game_over?
    # stalemate? || checkmate?
  end
end

game = GameHandler.new
game.start_game
