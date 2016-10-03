class RandomStrategy
  attr_accessor :board

  def initialize(board)
    self.board = board
  end

  def move
    self.board.data[0] = 'o'
  end

  def to_s
    self.board
  end
end
