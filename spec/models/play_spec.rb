require "rails_helper"

RSpec.describe "Board", :type => :model do
  describe ".from_string" do
    let(:string) { "         " }

    it "creates a board instance from string" do
      board = Board.from_string(string)
      expect(board).to be_a Board
    end
  end
end
