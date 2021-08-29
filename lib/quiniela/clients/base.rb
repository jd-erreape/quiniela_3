# frozen_string_literal: true

module Quiniela
  module Clients
    # Base client which will be inherited by specific
    # clients when accessing Quiniela services
    class Base
      include HTTParty

      def initialize(*params); end

      def get
        self.class.get(self.class::ENDPOINT, { query: query })
      end

      protected

      def query
        {}
      end
    end
  end
end
