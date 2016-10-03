class SearchStrategy < Strategy
  # Do a DFS for a winning strategy
  def move
    index = get_best_move[0]
    board[index] = 'o'
  end

  # Return the index that should be played by this winner to win/tie
  def get_best_move(string, player=:o)
    board = Board.from_string(string)

    if board.game_over?
      return [nil, board.get_winner]
    end

    # Look at open spots

    # for each open spot, get if that spot is a win, tie or loss
    # Return the first won that is a win, then tie, then loss
    results = []
    board.data.split("").each_with_index do |c, i|
      next unless c == ' '

      board[i] = player.to_s
      a = get_best_move(board.to_s, other_player(player))
      results << [i, a]
    end

    win = results.find { |a| a[1] == player }
    return win if win

    tie = results.find { |a| a[1] == nil }
    return tie

    return results.first
  end

  def other_player(player)
    if player == :o
      return :x
    else
      return :o
    end
  end
end
