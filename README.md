# chess
Command line chess project from TOP.

To do:
* All pieces:
  * ~~Refactor #legal_moves to only store information about legal_moves. (Should only have single responsibility.)~~
  * ~~Store the piece's color. (Light or dark.)~~
  * ~~Figure out how to pass assign_symbol method through inheritence.~~
* PlaceHandler:
  * ~~Move #legal_moves calcuations to PlaceHandler class, under different reusable method names. (#mark_l_shape, #mark_all_diagonals, etc.)~~
* Rspec tests:
  * Instead of testing all of the pieces, just create a test for PlaceHandler to make sure it calculates the legal_moves correctly.
  * The only pieces that should be tested are ones with special conditions. (Knight should be able to hop, pawn able to promote, etc.)
  * Test BoardHandler to make sure it initalizes the board correctly.
  * Test BoardHandler to make sure it moves pieces correctly.
* Board:
  * ~~Correct incorrect assignment of squares.~~

Classes to create:
* DisplayHandler:
  * Write class that manages display functions (of board, messages, etc)
* BoardHandler(?):
  * ~~Initalize the board with black/white pieces in appropriate places.~~ 
    * ~~Sort of works, need to figure out how to have assign_symbol method on all piece classes with mutability. (Currently only stores pawn symbols cause thats all I wrote.)~~
    * ~~Need to assign :dark to instance variable of dark pieces.~~
  * Write tests to make sure assigned symbols, pieces etc. are in correct places.
  * Create a function that selects a piece from input and moves it to place from input. Make sure it does not allow illegal moves, or replacing present pieces.
* InputHandler:
  * ~~Manages player input.~~
  * Write tests to determine it is returning correctly parsed input.
* Player:
  * ~~Manages information about the player.~~
  * Should be responsible for getting player input and passing off to InputHandler.
* GameHandler(?):
  * ~~Plays rounds -- switches between players.~~
  * Checks for checkmate and stalemate conditions, ends game.
  * Saves game state, loads game state.

Other:
* ~~Privatize methods/functions that dont need to be public.~~