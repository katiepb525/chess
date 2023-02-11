# frozen_string_literal: true

require './lib/board_handler'
require './lib/display'
require './lib/player'

# Manages aspects concerning rounds, game rules, checkmate/stalemate conditions, saving and loading game.
# (Might be too many responsibilites, though.)
class GameHandler
  include Display
  def initialize
    @turn = 0
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @board_handler = BoardHandler.new
  end

  def get_player_name(player)
    ask_player_name(player)
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
end
