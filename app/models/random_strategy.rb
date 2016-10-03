class RandomStrategy
  attr_accessor :board

  def initialize(board)
    self.board = board
  end

  def move
    board.data[0] = 'o'
  end

  def to_s
    board
  end
end
