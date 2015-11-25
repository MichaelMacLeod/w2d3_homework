class Game
  def initialize
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @pieces = [:o, :x]
    @turn = 0
  end

  def display_board
    row_strings = @board.map do |row|
      row_to_string(row)
    end
    row_strings.join("\n- - - \n")
  end

  def place_piece(row, column)
    if row >= 3 || column >= 3
      puts "Invalid move! Pick a place between 0 and 2."
      return false
      if @board[ row ] [ column ]
        puts "Already a piece there, try again!"
        return false
      end
    end
    @board[ row ] [ column ] = @pieces[ @turn % 2 ]
    @turn = @turn +1
    if @turn == 9
      puts "Full board. GAME OVER. play again."
      new_game
    end
  end


  def reset
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @turn = 0
    @pieces.rotate!
  end

  def has_won?(symbol)
    if horizontal_line?(symbol, @board) ||
      vertical_line?(symbol) || 
      diagonal_line(symbol)
      puts "WE HAVE A WINNER #{@pieces[ @turn % 2 ]}"
    else 
      false
    end
  end


  def horizontal_line?(symbol, board)
    board.any? do |row| 
      row_has_winning_line(row, symbol)
    end
  end

  def diagonal_line(symbol)
    middle_piece = @board[1][1]
    return false if middle_piece != symbol
    top_left_and_bottom_right = @board[0][0]==symbol && @board[2][2]==symbol
    top_right_and_bottom_left = @board[0][2]==symbol && @board[2][0]
    top_left_and_bottom_right || top_right_and_bottom_left
  end

  def row_has_winning_line(row, symbol)
    row.all? do |square| 
      square == symbol
    end
  end

  def vertical_line?(symbol)
    @board.transpose.any? do |row| 
      row_has_winning_line(row, symbol)
    end
  end

  private

  def row_to_string(row) #This will take in a row array
    row_symbols = row.map do |piece|
      piece || " "
    end
    row_symbols.join("|")
  end

end
