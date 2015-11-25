require_relative('win_checker')

win_checker = WinChecker.new()
empty_board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
symbol = :o
puts "check the the empty board does not win: expect that #{win_checker.has_won?(symbol, empty_board)} is false."

board_with_horizontal = [ [:o,:o,:o],[nil,nil,nil],[nil,nil,nil] ]
puts "check that the horizontal line wins does not win: expect that #{win_checker.has_won?(symbol, board_with_horizontal)} is true."

board_with_vertical = [ [:o,nil,nil],[:o,nil,nil],[:o,nil,nil] ]
puts "check that the vertical line wins does not win: expect that #{win_checker.has_won?(symbol, board_with_vertical)} is true."

board_with_diagonal = [ [:o,nil,nil],[nil,:o,nil],[nil,nil,:o] ]
puts "check that the diagonal line wins does not win: expect that #{win_checker.has_won?(symbol, board_with_diagonal)} is true."

