class RandomStrategy
  attr_accessor :board, :errors

  def initialize(board)
    self.board = board
    self.errors = []
  end

  def valid?
    validate_game_not_over
    validate_os_turn

    return !errors.present?
  end

  # Find the first spot that hasn't been played and play it
  def move
    index = board.data.split("").index { |c| c == ' ' }
    board.data[index] = 'o'
  end

  def to_s
    board
  end

  private

  def validate_game_not_over
    if board.game_over?
      self.errors << "Game is over"
      return false
    end
    true
  end

  def validate_os_turn
    if !board.plausibly_os_turn?
      self.errors << "Not o's turn"
      return false
    end
    return true
  end
end
