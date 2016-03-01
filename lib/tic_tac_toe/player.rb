module TicTacToe
  class Player
    attr_accessor :id, :symbol
    
    def initialize(id, symbol)
      @id = id
      @symbol = symbol.upcase
    end
  end
end
