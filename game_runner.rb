require('pry-byebug')
require_relative('game')
require_relative('win_checker')
require_relative('rubbish_win_checker')



# create game
win_checker_1 = WinChecker.new()
rubbish = Rubbish_Win_Checker.new()


game = Game.new(rubbish)

# place piece
# game.turn(0,0)

# puts game.new_game

# # display board
# puts game.display_board

# CLEAR BOARD - RESET THE GAME



# TODO: ENFORCE BOARD LIMITATIONS




# TODO: Rotate the starting piece when resetting
puts game.display_board




# TODO: Automatically reset when the board is full and tell us it's a draw.


# TODO: Detect when someone has won and notify.
piece = :o

#HORIZONTAL LINE WINS
game.turn(0,0)
game.turn(1,0)
game.turn(0,1)
game.turn(1,1)
game.turn(0,2)

puts "checking if game is won on a horizontal. #{game.has_won?(piece)} expect to be true"



#VERTICAL LINE WINS
puts game.new_game
piece = :x
game.turn(0,0)
game.turn(0,1)
game.turn(1,0)
game.turn(0,2)
game.turn(2,0)

puts "checking if game is won on a vertical. #{game.has_won?(piece)} expect to be true"




#DIAGONAL LINE WINS
puts game.new_game
piece = :o
game.turn(0,0)
game.turn(0,1)
game.turn(1,1)
game.turn(2,0)
game.turn(2,2)

puts "checking if game is won on a diagonal. #{win_checker.has_won?(piece)} expect to be true"
game.new_game

# test displaying row - not useful for regular use, just in testing
# puts "test row #{ game.row_to_string([:o,nil,nil])}"


binding.pry;''
