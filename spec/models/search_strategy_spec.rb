require "rails_helper"

RSpec.describe "SearchStrategy", :type => :model do
  let(:board) { Board.from_string(string) }
  let(:string) { 'xxoxox xo' }

  it "returns a board with an 'o' added" do
    strategy = SearchStrategy.new(board)
    strategy.move
    expect(strategy.board.to_s).to eq 'xxoxoxoxo'
  end

  context "with an empty board" do
    let(:string) { '         ' }

    it "returns a board with an 'o' added" do
      strategy = SearchStrategy.new(board)
      strategy.move
      expect(strategy.board.to_s).to match /\s*o\s*/ #'o        '
    end
  end

  context "with a choice" do
    let(:string) { 'xxo ox   '}

    it "returns a board with a winning 'o' added" do
      strategy = SearchStrategy.new(board)
      strategy.move
      expect(strategy.board.to_s).to eq 'xxo oxo  '
    end
  end

  context "with a choice between tie and loss" do
    let(:string) { 'xooxox x '}

    it "returns a board with a tie 'o' added" do
      strategy = SearchStrategy.new(board)
      strategy.move
      expect(strategy.board.to_s).to eq 'xooxoxox '
    end
  end
end
