module TicTacToe
  class Board
    def initialize
      @grid = Array.new(3) { Array.new(3) { Cell.new } }
    end

    def draw_grid
      puts "-" * 13
      (0..2).each do |row|
        draw_row(row)
      end
    end

    def set_cell(move, value)
      x = moves[move][0]
      y = moves[move][1]
      @grid[x][y].value = value
    end

    def get_cell(move)
      x = moves[move][0]
      y = moves[move][1]
      return @grid[x][y].value
    end

    def cell_free?(move)
      x = moves[move][0]
      y = moves[move][1]
      @grid[x][y].value.strip.empty? ? true : false
    end

    def winning_moves
      array = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]
      ]
    end

    def draw?
      @grid.flatten.map { |cell| cell.value.strip }.all? { |e| !e.empty? }
    end

    private

    def moves
      moves = {
        1 => [0, 0],
        2 => [0, 1],
        3 => [0, 2],
        4 => [1, 0],
        5 => [1, 1],
        6 => [1, 2],
        7 => [2, 0],
        8 => [2, 1],
        9 => [2, 2]
      }
    end

    def draw_row(row)
      string = "|" +
      @grid[row].map do |cell|
        cell.value.center(3)
      end.join("|") + "|"
      puts string
      puts "-" * 13
    end
  end
end
