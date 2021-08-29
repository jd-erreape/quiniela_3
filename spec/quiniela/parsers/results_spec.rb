# frozen_string_literal: true

RSpec.shared_examples "round matches" do
  it "returns a multidimensional array with all the given matches and their result" do
    round = subject

    expect(subject.length).to eq(15)

    round.each do |match|
      expect(match[0].class).to be(String)
      expect(match[1].class).to be(String)
      expect(match[2].class).to eq(Integer).or(eq(NilClass))
      expect(match[3].class).to eq(Integer).or(eq(NilClass))
    end
  end
end

RSpec.describe Quiniela::Parsers::Results do
  let(:instance) { described_class.new }

  describe "#round", :vcr do
    subject { instance.round(round_number) }

    context "the given round is found" do
      let(:round_number) { 1 }

      include_examples "round matches"
    end

    context "the given round is not found" do
      let(:round_number) { 1000 }

      it "raises a NotFound error" do
        expect { subject }.to raise_error(Quiniela::Parsers::Results::NotFound)
      end
    end
  end

  describe "#last_round", :vcr do
    subject { instance.last_round }

    include_examples "round matches"
  end
end
