require "rails_helper"

RSpec.describe "Play endpoint", :type => :request do
  let(:url) { "/play?board=#{board_string}"}
  let(:board_string) { "+++++++++"}

  it "returns correct data" do
    get url
    expect(response.status).to eq(200)
  end

  context "with an empty board" do
    let(:board_string) { "+++++++++"}

    it "returns correct data" do
      get url
      expect(response.status).to eq(200)

      # should be a valid board
      board = response.body

      expect(board.length).to eq(9)

      # should have one more o
      expect(board.split("").select { |i| i == 'o' }.count).to eq(1)
    end
  end
end
