class RandomStrategy < Strategy
  # Find the first spot that hasn't been played and play it
  def move
    board.data[index_to_play] = 'o'
  end

  def index_to_play
    indexes_of_open_positions.sample
  end

  def indexes_of_open_positions
    board.split_data.each_with_index
      .select { |c, i| c == ' ' }
      .map { |pair| pair[1] }
  end
end
