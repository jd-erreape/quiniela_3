# frozen_string_literal: true

module Quiniela
  module Clients
    # Access third party service to retrieve the page where
    # info regarding the current quiniela round can be found
    class Base
      include HTTParty

      def page
        self.class.get(self.class::ENDPOINT)
      end
    end
  end
end
