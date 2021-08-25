# frozen_string_literal: true

module Quiniela
  module Clients
    # Access third party service to retrieve the page where
    # info regarding the results of the quiniel can be found
    class Results < Base
      base_uri "https://www.loteriasyapuestas.es"

      ENDPOINT = "/es/resultados/quiniela"
    end
  end
end
