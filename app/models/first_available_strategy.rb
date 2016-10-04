class FirstAvailableStrategy < Strategy
  # Find the first spot that hasn't been played and play it
  def move
    index = board.data.split("").index { |c| c == ' ' }
    board.data[index] = 'o'
  end
end
