class PlayController < ApplicationController
  def show
    board = Board.from_string(params[:board])
    strategy = RandomStrategy.new(board)
    strategy.move
    render inline: strategy.board.to_s
  end
end
