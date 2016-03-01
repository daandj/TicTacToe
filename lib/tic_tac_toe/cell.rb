module TicTacToe
  class Cell
    attr_accessor :value
    def initialize(value = " ")
      @value = value.to_s
    end
  end
end
