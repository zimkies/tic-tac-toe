class PlayController < ApplicationController
  def show
    # Ensure the board is valid
    if !board.valid?
      return render plain: board.errors.to_sentence, status: 400
    end

    # Ensure the strategy is valid
    if !strategy.valid?
      return render plain: strategy.errors.to_sentence, status: 400
    end
    strategy.move

    render inline: strategy.board.to_s
  end

  private

  def board
    @board ||= Board.from_string(params[:board])
  end

  def strategy
    @strategy ||= strategy_class.new(board)
  end

  def strategy_class
    case params[:strategy]
    when 'first_available'
      FirstAvailableStrategy
    when 'random'
      RandomStrategy
    when 'search'
      SearchStrategy
    else
      SearchStrategy
    end
  end
end
