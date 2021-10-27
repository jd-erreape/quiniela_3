# typed: false
# frozen_string_literal: true

RSpec.shared_examples "a client" do
  describe ".base_uri" do
    subject { described_class.base_uri }

    it { should eq(base_uri) }
  end

  describe "#get" do
    subject { described_class.new(**params).get }

    it "retrieves the given page from the third party service", :vcr do
      response = subject

      expect(response.code).to eq(200)
      expect(response.content_type).to eq(content_type)
    end
  end
end
