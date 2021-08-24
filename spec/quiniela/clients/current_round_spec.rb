# frozen_string_literal: true

RSpec.describe Quiniela::Clients::CurrentRound do
  describe ".base_uri" do
    subject { described_class.base_uri }

    it { should eq("https://juegos.loteriasyapuestas.es") }
  end

  describe "#page" do
    subject { described_class.new.page }

    it "retrieves the current round from the third party service", :vcr do
      response = subject

      expect(response.code).to eq(200)
      expect(response.content_type).to eq("text/html")
    end
  end
end
