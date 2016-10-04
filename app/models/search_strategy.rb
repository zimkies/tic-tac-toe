# Play Strategy that does a DFS on all moves
# Uses a cache to speed up significantly.
# Also randomizes the move so we aren't playing the same game over and over
class SearchStrategy < Strategy
  attr_accessor :cache

  def initialize(board)
    super
    self.cache = {}
  end

  def move
    index, winner = get_best_move(board.to_s)[0]
    board.data[index] = :o.to_s
  end

  # Takes a string representing the board and a player
  #
  # Returns a pair [i, p]
  #   i: the index of the string that the player should play
  #   p: the predicted winner of the game if that move is made.
  def get_best_move(string, player=:o)
    return cache[[string, player]] if cache[[string, player]]

    board = Board.from_string(string)

    if board.game_over?
      cache[[string, player]] = [nil, board.get_winner]
      return cache[[string, player]]
    end

    # Look at open spots
    # for each open spot, see if playing that spot is a win, tie or loss
    # Return any spot in the following order: win, tie, loss
    results = []
    board.split_data.each_with_index do |c, i|
      next unless c == ' '

      board.data[i] = player.to_s
      position, winner = get_best_move(board.to_s, other_player(player))
      board.data[i] = ' '
      results << [i, winner]
    end

    # Return a random choice of win/tie/loss (in that order)
    wins = results.select { |a| a[1] == player }
    ties = results.select { |a| a[1] == nil }
    move_winner_pair = if wins.present?
      wins.sample
    elsif ties.present?
      ties.sample
    else
      results.sample
    end

    cache[[string, player]] = move_winner_pair
    return move_winner_pair
  end

  def other_player(player)
    if player == :o
      return :x
    else
      return :o
    end
  end
end
