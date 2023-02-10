# frozen_string_literal: true

# Manages aspects concerning rounds, game rules, checkmate/stalemate conditions, saving and loading game.
# (Might be too many responsibilites, though.)
class GameHandler
  def initialize
    @turn = 0
    @player1 = Player.new('one')
    @player2 = Player.new('two')
    @board_handler = BoardHandler.new
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
