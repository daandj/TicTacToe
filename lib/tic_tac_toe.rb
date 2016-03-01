require_relative "tic_tac_toe/board"
require_relative "tic_tac_toe/cell"
require_relative "tic_tac_toe/player"
require_relative "tic_tac_toe/game"

game = TicTacToe::Game.new
game.start
