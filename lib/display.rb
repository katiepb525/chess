# frozen_string_literal: true

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
    You can specify your desired piece first, then move,\n
    or you can type both a single string, e.g. d2d3.\n"
  end

  def display_board(board_handler)
    board_handler.board.grid.each do |row|
      symb_arr = []
      row.each do |place|
        symb_arr.push(place.symbol)
      end
      puts "#{symb_arr}\n"
      symb_arr = []
    end
  end
end
