# frozen_string_literal: true

RSpec.describe Quiniela::Parsers::CurrentRound do
  describe "#number" do
    subject { described_class.new.number }

    it "returns the number of the current quiniela's round", :vcr do
      expect(subject).to be > 0
    end
  end
end
