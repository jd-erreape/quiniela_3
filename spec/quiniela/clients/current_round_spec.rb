# frozen_string_literal: true

require_relative "./shared/a_client"

RSpec.describe Quiniela::Clients::CurrentRound do
  it_behaves_like "a client" do
    let(:base_uri) { "https://juegos.loteriasyapuestas.es" }
  end
end
