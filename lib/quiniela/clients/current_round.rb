# frozen_string_literal: true

module Quiniela
  module Clients
    # Access third party service to retrieve the page where
    # info regarding the current quiniela round can be found
    class CurrentRound < Base
      base_uri "https://juegos.loteriasyapuestas.es"

      ENDPOINT = "/jugar/la-quiniela/apuesta/?access=headercms&lang=es"
    end
  end
end
