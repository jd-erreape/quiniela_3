# frozen_string_literal: true

module Quiniela
  module Clients
    # Access third party service to retrieve the page where
    # info regarding the current quiniela round can be found
    class CurrentRound
      include HTTParty

      ENDPOINT = "/jugar/la-quiniela/apuesta/?access=headercms&lang=es"

      base_uri "https://juegos.loteriasyapuestas.es"

      def page
        self.class.get(ENDPOINT)
      end
    end
  end
end
