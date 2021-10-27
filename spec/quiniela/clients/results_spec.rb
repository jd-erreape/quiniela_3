# typed: false
# frozen_string_literal: true

require_relative "../../support/constants"

RSpec.describe Quiniela::Clients::Results do
  it_behaves_like "a client" do
    let(:base_uri) { "https://www.loteriasyapuestas.es" }
    let(:content_type) { "application/json" }
    let(:now) { TIME_NOW } # Fixed date, 22 Oct 2021
    let(:params) { { start_date: now - described_class::OFFSET, end_date: now } }
  end
end
