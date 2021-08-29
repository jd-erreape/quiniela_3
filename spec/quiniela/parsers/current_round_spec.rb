# frozen_string_literal: true

RSpec.describe Quiniela::Parsers::CurrentRound do
  let(:instance) { described_class.new }

  describe "#number", :vcr do
    subject { instance.number }

    it "returns the number of the current quiniela's round" do
      expect(subject).to be > 0
    end
  end

  describe "#matches", :vcr do
    subject { instance.matches }

    it "returns the multidimensional array with all current quiniela's round matches" do
      expect(subject.length).to be(15)
      expect(subject.class).to be(Array)
      expect(subject.first.class).to be(Array)
      subject.flatten.each { |team| expect(team.class).to be(String) }
    end
  end
end
