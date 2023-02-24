# chess
Command line chess project from TOP.

Issues: 
* If a player selects an empty spot and tries to move to an empty spot, their turn would be skipped. (should be illegal move)
* If a player enters an input that *does* have four characters but doesnt have numbers, file_to_coordinate will try to parse the letter and nil cant be coercered into integer will be returned. (probably the same with only numbers)
* Player 2 can move Player 1's pieces.

To do:
* PlaceHandler
* Rspec tests:
  ~~* Instead of testing all of the pieces, just create a test for PlaceHandler to make sure it calculates the legal_moves correctly.~~ Well, we want to keep information seperate, but still test methods in PlaceHandler.
  * The only pieces that should be tested are ones with special conditions. (Knight should be able to hop, pawn able to promote, etc.)
  * ~~Test BoardHandler to make sure it moves pieces correctly.~~
* Pawn:
  * Have legal_moves change depending if pawn is light or dark. (Player2 moves falsely returning illegal cause of this)
    * Update rspec tests to reflect this as well.
* BoardHandler:
  * Test BoardHandler to make sure it initalizes the board correctly.
  ~~* Fix all moves being allowed to hop over pieces.~~ ~~Created movement class.~~
* InputHandler:
  * ~~Manages player input.~~
  * Write tests to determine it is returning correctly parsed input.
  * ~~Catches bad input~~ ~~and sends message to GameHandler and BoardHandler.~~ (instead of sending multiple messages, decided to use error handling)
* Player:
  * ~~Manages information about the player.~~
  * ~~Should be responsible for getting player input and passing off to InputHandler.~~
* GameHandler:
  * ~~Plays rounds -- switches between players.~~
  * Display the possible positions a player can go to before they enter their input.
  * ~~GameHandler should call display message method, loops #gets when player enters bad input.~~ half works? havent caught all bad inputs yet. also loops after attempted illegal move
  * Define game_over which checks messages from CheckMateFiner and StalemateFinder
  * Saves game state, loads game state.
* CheckFinder:
  * Sees if king is within line of capture.
  * Prevents king from putting itself into check.
  * Sees if king is in check after move from opposing player has been made.
  * If King is in check, sends message.
* CheckmateFinder:
  * Looks for checkmate conditions.
    * Is in check.
    * King cannot move out of danger.
    * King cannot capture threatening piece.
* StalemateFinder:
  * If the board state of the game repeats itself three times, sends message of stalemate.

Other:
* Not sure about movement having intertwined denpendency on inputhandler object. Might be messy?

Save for later: 
* Fix law of demeter violations. (Some weird chaining going on with my methods, like below.)
* Having to call legal_moves with @start_place.curr_piece.legal_moves(@start_place) is silly. Remove the need for an argument pass every time by using instance vars.
* Refactor legal_moves to get places from the actual board, not newly instantiated places.
