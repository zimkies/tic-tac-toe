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
    validate_size && validate_characters

    return !errors.present?
  end

  def to_s
    self.data
  end

  def plausibly_os_turn?
    x_count = data.split("").select { |c| c == 'x' }.count
    o_count = data.split("").select { |c| c == 'o' }.count

    (x_count - o_count).in? ([0, 1])
  end

  def game_over?
  end

  private

  def validate_characters
    if !data.split("").all? { |c| c.in?(['o', 'x', ' ']) }
      self.errors << "Board must only contain 'o', 'x', ' ' characters."
      return false
    end
  end

  def validate_size
    if !data
      self.errors << "Board must be a non-empty string"
      return false
    end

    if data.length != SIZE
      self.errors << "Board must be #{SIZE} characters long"
      return false
    end
    return true
  end
end
