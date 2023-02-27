# frozen_string_literal: true

require './lib/board_handler'
require './lib/input_handler'
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
    @movement = Movement.new(@board_handler.board)
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


  def play_game
    until game_over? # will loop indefinetely! wip
      current_player = play_round
      display_board(@board_handler)
      puts ask_input(current_player)
      @input_handler.handle_player_input
      @input_handler.translate_coordinates(@board_handler.board)
      @movement.handle_player_movement(@input_handler)
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
