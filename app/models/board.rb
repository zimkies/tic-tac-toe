class Board
  SIZE = 9

  attr_accessor :data, :errors

  def initialize(string)
    # TODO allow board to be arbitrary size
    self.data = string
    self.errors = []
  end

  # Creates a board from the string representation
  def self.from_string(string)
    # TODO error check
    board = new(string)
    board
  end

  def valid?
    validate_size

    return !errors.present?
  end

  def to_s
    self.data
  end

  private

  def validate_size
    if !data
      self.errors << "Board must be a non-empty string"
      return
    end

    if data.length != SIZE
      self.errors << "Board must be #{SIZE} characters long"
    end
  end
end
