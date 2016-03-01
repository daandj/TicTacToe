module TicTacToe
  class Game
    attr_accessor :players, :board, :current_player

    def initialize
      @board = Board.new
      @player1 = Player.new(1, "X")
      @player2 = Player.new(2, "O")
      @players = [@player1, @player2].shuffle
      @current_player = @players[0]

      @board.draw_grid
    end

    def start
      loop do
        next_move
        if winner?(@current_player)
          puts "Player#{@current_player.id} is the winner!"
          break
        elsif @board.draw?
          puts "Nobody has won"
          break
        end
        switch_current_player
      end
    end

    def next_move
      puts solicit_move
      collect_move
      @board.draw_grid
    end

    private

    def winner?(player)
      @board.winning_moves.each do |w|
        if w.all? { |a| @board.get_cell(a) == player.symbol }
          @winner = player
        end
      end
      if @winner == player
        return true
      else
        return false
      end
    end

    def switch_current_player
      @players[0], @players[1] = @players[1], @players[0]
      @current_player = @players[0]
    end

    def solicit_move
      "player #{@current_player.id}: Enter a number between 1 and 9 to make your move"
    end

    def collect_move(move = gets.chomp.to_i)
      if move.between?(1, 9)
        if @board.cell_free?(move)
          @board.set_cell(move, @current_player.symbol)
        else
          puts "Illegal move, enter another number:"
          collect_move
        end
      else
        puts "Illegal move, enter another number:"
        collect_move
      end
    end
  end
end
