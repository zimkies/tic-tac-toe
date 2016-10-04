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
    board_full? || get_winner.present?
  end

  def board_full?
    split_data.select { |c| c == ' ' }.count == 0
  end

  def get_winner
    # TODO Add some shortcut logic to speed this up - check if at least 3
    # plays have been made

    # Check rows
    (0..2).each do |r|
      row = (0..2).map { |c| split_data[index_from_r_and_c(r, c)] }

      # If all elements are the same and not empty
      return row.first.to_sym if row.uniq.length == 1 && row.first != ' '
    end

    # Check columns
    (0..2).each do |c|
      columns = (0..2).map { |r| split_data[index_from_r_and_c(r, c)] }

      # If all elements are the same and not empty
      return columns.first.to_sym if columns.uniq.length == 1 && columns.first != ' '
    end

    # Check tl->br diagonal
    diagonal = (0..2).map { |i| split_data[index_from_r_and_c(i, i)] }
    return diagonal.first.to_sym if diagonal.uniq.length == 1 && diagonal.first != ' '

    # Check bl->tr diagonal
    diagonal = (0..2).map { |i| split_data[index_from_r_and_c(2 - i, i)] }
    return diagonal.first.to_sym if diagonal.uniq.length == 1 && diagonal.first != ' '

    # Otherwise nobody has won
    return
  end

  def index_from_r_and_c(r, c)
    r * 3 + c
  end

  def split_data
    data.split("")
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
