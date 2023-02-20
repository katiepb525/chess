# chess
Command line chess project from TOP.

To do:
* Rspec tests:
  ~~* Instead of testing all of the pieces, just create a test for PlaceHandler to make sure it calculates the legal_moves correctly.~~ Well, we want to keep information seperate, but still test methods in PlaceHandler.
  * The only pieces that should be tested are ones with special conditions. (Knight should be able to hop, pawn able to promote, etc.)
  * Test BoardHandler to make sure it initalizes the board correctly.
  * Test BoardHandler to make sure it moves pieces correctly.
* Pawn:
  * Have legal_moves change depending if pawn is light or dark.
    * Update rspec tests to reflect this as well.
* BoardHandler:
  * ~~Initalize the board with black/white pieces in appropriate places.~~ 
    * ~~Sort of works, need to figure out how to have assign_symbol method on all piece classes with mutability. (Currently only stores pawn symbols cause thats all I wrote.)~~
    * ~~Need to assign :dark to instance variable of dark pieces.~~
  * ~~Create a function that selects a piece from input and moves it to place from input.~~ 
    ~~* Make sure it does not allow illegal moves, or replacing present pieces.~~
* InputHandler:
  * ~~Manages player input.~~
  * Write tests to determine it is returning correctly parsed input.
  * Catches bad input and sends message to GameHandler and BoardHandler.
* Player:
  * ~~Manages information about the player.~~
  * Should be responsible for getting player input and passing off to InputHandler.
* GameHandler:
  * ~~Plays rounds -- switches between players.~~
  * Checks for checkmate and stalemate conditions, ends game.
  * Saves game state, loads game state.

Other:
* ~~Privatize methods/functions that dont need to be public.~~
* Fix law of demeter violations. (Some weird chaining going on with my methods.)

Save for later: 
* GameHandler calls display message method, loops #gets when player enters bad input.
