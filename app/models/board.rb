class Board
  attr_accessor :data

  def initialize(string)
    # TODO allow board to be arbitrary size
    self.data = string
  end

  # Creates a board from the string representation
  def self.from_string(string)
    # TODO error check
    board = new(string)
    board
  end

  def to_s
    self.data
  end
end
