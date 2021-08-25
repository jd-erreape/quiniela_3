# frozen_string_literal: true

RSpec.shared_examples "a client" do
  describe ".base_uri" do
    subject { described_class.base_uri }

    it { should eq(base_uri) }
  end

  describe "#page" do
    subject { described_class.new.page }

    it "retrieves the given page from the third party service", :vcr do
      response = subject

      expect(response.code).to eq(200)
      expect(response.content_type).to eq("text/html")
    end
  end
end
