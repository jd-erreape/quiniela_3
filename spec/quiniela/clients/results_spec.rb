# frozen_string_literal: true

RSpec.describe Quiniela::Clients::Results do
  it_behaves_like "a client" do
    let(:base_uri) { "https://www.loteriasyapuestas.es" }
    let(:content_type) { "application/json" }
    let(:now) { Time.at(1_634_885_526) } # Fixed date, 22 Oct 2021
    let(:params) { { start_date: now - described_class::OFFSET, end_date: now } }
  end
end
