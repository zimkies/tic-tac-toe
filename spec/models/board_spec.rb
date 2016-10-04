require "rails_helper"

RSpec.describe "Board", :type => :model do
  let(:board) { Board.from_string string }
  let(:string) { '         ' }

  describe ".from_string" do
    let(:string) { "         " }

    it "creates a board instance from string" do
      board = Board.from_string(string)
      expect(board).to be_a Board
    end
  end

  describe "valid" do
    let(:board) { Board.from_string(board_string) }
    let(:board_string) { "         " }

    it "should be valid" do
      expect(board).to be_valid
    end

    context "not enough characters" do
      let(:board_string) { "        " }

      it "should be valid" do
        expect(board).to_not be_valid
      end
    end

    context "wrong characters" do
      let(:board_string) { "p        " }

      it "should be valid" do
        expect(board).to_not be_valid
      end
    end
  end

  describe "get_winner" do
    subject { board.get_winner }
    let(:string) { '         ' }

    it { should eq nil }

    context "with o won by horizontal" do
      let(:string) { '   ooo   ' }
      it { should eq :o }
    end

    context "with x won" do
      let(:string) { '   xxx   ' }
      it { should eq :x }
    end
  end
end
