class Game
  def initialize(win_checker)
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @pieces = [:o, :x]
    @turn = 0
    @win_checker = win_checker
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

def current_piece
  @pieces [ @turn % 2 ]
end

def check_for_win
  if @win_checker.has_won?(current_piece, @board) 
    puts "Winner is #{current_piece}"
    new_game
  end
end

  def reset
    @board = [ [nil,nil,nil],[nil,nil,nil],[nil,nil,nil] ]
    @turn = 0
    @pieces.rotate!
  end

  private

  def row_to_string(row) #This will take in a row array
    row_symbols = row.map do |piece|
      piece || " "
    end
    row_symbols.join("|")
  end

end
