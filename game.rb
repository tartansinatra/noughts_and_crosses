class Game
  def initialize
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @pieces = [:o, :x]
    @turn = 0
  end

# WINNING MOVES = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]



def display_board
  row_strings = @board.map do |row|
    row_to_string(row)
  end
  row_strings.join("\n_ _ _\n")
end

def place_piece(row, column)
  if out_of_range?(row, column)
    puts "Outside of board range"
  end
  if @board[ row ][ column ]
    puts "Already a piece there."
    return
  end
  @board[ row ][ column ] = @pieces[@turn % 2]
  end

def check_if_full
  if board_full?
    puts "Full board, play again"
    new_game
  end
end

def new_game()
  @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
  @turn = 0
  @pieces.rotate!
end


# Remember if using the following three methods, you will need to change your Runner to 
# game.turn in all cases.
  def turn(row, column)
    place_piece(row, column)
    puts display_board
    check_for_win()    
    @turn = @turn +1
  end

  def current_piece
    @pieces[ @turn %2]
  end

  def check_for_win
     if has_won?(current_piece)
      puts "winner is #{current_piece}"
      new_game
    elsif board_full?
      puts "Full board play again?"
    end
  end


  def has_won?(symbol)
    horizontal_line?(symbol, @board) || vertical_line?(symbol) || diagonal_line?(symbol)
  end

  def horizontal_line?(symbol, board)
    board.any? do |row|
      row_has_winning_line(row, symbol)
    end
  end

  def vertical_line?(symbol)
    transposed_board = @board.transpose
    horizontal_line?(symbol, transposed_board)
  end

  def diagonal_line?(symbol)
    middle_piece = @board[1][1]
    return false if middle_piece != symbol    
      top_left_and_bottom_right = @board[0][0] == symbol && @board[2][2] == symbol
      top_right_and_bottom_left = @board[0][2]==symbol && @board[2][0] == symbol
      top_left_and_bottom_right || top_right_and_bottom_left
  end

  def row_has_winning_line(row, symbol)
    row.all? do |square|
      square == symbol
    end
  end



     private
    # NOT REQUIRED FOR REGULAR USERS, JUST TESTING METHODS

    def board_full?
      @board.flatten.all?
      @turn == 9    
    end

    def out_of_range?(row, column)
      if row >2 || column >2
        return
      end    
    end

    def row_to_string(row)
      row_symbols = row.map do |piece|
       piece || " "
     end
     row_symbols.join("|")
   end



 end
