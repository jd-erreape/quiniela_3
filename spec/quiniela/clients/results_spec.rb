# frozen_string_literal: true

RSpec.describe Quiniela::Clients::Results do
  it_behaves_like "a client" do
    let(:base_uri) { "https://www.loteriasyapuestas.es" }
    let(:content_type) { "application/json" }
  end
end
