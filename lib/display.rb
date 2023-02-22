# frozen_string_literal: true

# Contains display functions.
module Display
  def intro_display
    "Welcome to..\n
      ....   || ..     ....   ....   ....  \n
    .|   ''  ||' ||  .|...|| ||. '  ||. '  \n
    ||       ||  ||  ||      . '|.. . '|.. \n
      '|...' .||. ||.  '|...' |'..|' |'..|' \n
    \n
    Press S to start a new game.\n
    Press L to load a saved game.\n"
  end

  def ask_player_name(player)
    "What is your name, player #{player.num}?\n"
  end

  def ask_input(player)
    "Player #{player.name}, enter your move.\n
    Please type single string, e.g. d2d3.\n"
  end

  def display_board(board_handler)
    board_handler.board.grid.each_with_index do |row, idx|
      symb_arr = []
      row.each do |place|
        symb_arr.push(place.symbol)
      end
      puts "#{8 - idx} #{symb_arr.join(' ')}"
      symb_arr = []
    end
    puts "  #{%w[a b c d e f g h].join(' ')}"
  end
end
