require "rails_helper"

RSpec.describe "Play endpoint", :type => :request do
  let(:url) { "/play?board=#{board_string}"}
  let(:board_string) { "+++++++++"}

  it "returns correct data" do
    get url
    expect(response.status).to eq(200)
  end
end
