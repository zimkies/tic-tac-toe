class PlayController < ApplicationController
  def show
    board = Board.from_string(params[:board])
    if !board.valid?
      return render plain: board.errors.to_sentence, status: 400
    end

    strategy = RandomStrategy.new(board)
    if !strategy.valid?
      return render plain: strategy.errors.to_sentence, status: 400
    end
    strategy.move
    render inline: strategy.board.to_s
  end
end
