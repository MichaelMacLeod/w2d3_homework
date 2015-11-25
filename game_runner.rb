require('pry-byebug')
require_relative('game')
require_relative('win_checker')

#creating game
win_checker_1 = WinChecker.new()
game = Game.new(win_checker_1)
# rubbish = RubbishWinChecker.new()
binding.pry;''
#place piece on (row, column)
game.place_piece(0,0)


#display board
# puts game.display_board
# #reset board
# puts game.reset
# puts game.display_board

# game.place_piece(0,0)
# game.place_piece(1,0)
# game.place_piece(2,0)
# game.place_piece(1,0)
# game.place_piece(0,1)
# game.place_piece(1,1)
# game.place_piece(1,2)
# game.place_piece(2,2)
# game.place_piece(2,1)


#TODO Don't allow pieces out of range

#TODO Rotate the starting piece when resetting*

#TODO Automatically reset when the board is full and tell us it's full. 

#TODO Automatically detect when someone has won and notify. 
#  piece = :o
#  puts "Checking if game is won #{game.has_won?(piece)} expect to be false."
#  game.place_piece(1,0)
#  game.place_piece(0,1)
#  game.place_piece(1,1)
#  game.place_piece(0,2)
#  puts "Checking if game is won #{game.has_won?(piece)} expect to be true."

# game.reset
# piece = :x
# puts "checking if game is won #{game.has_won?(piece)} expect to be false."
# game.place_piece(0,0)
# game.place_piece(0,1)
# game.place_piece(1,0)
# game.place_piece(0,2)
# game.place_piece(2,0)
# puts "Checking if game is won vertical #{game.has_won?(piece)} expect to be true."


# game.reset
# piece = :o
# puts "checking if game is won #{game.has_won?(piece)} expect to be false."
# game.place_piece(0,0)
# game.place_piece(0,1)
# game.place_piece(1,1)
# game.place_piece(0,2)
# game.place_piece(2,2)
# puts "Checking if game is won diagonal #{game.has_won?(piece)} expect to be true."

#When you place a piece, use the methods we've defined to tell us whether the game is won. Then RESET. 
puts game.display_board











