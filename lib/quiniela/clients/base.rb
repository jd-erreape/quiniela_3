# typed: true
# frozen_string_literal: true

module Quiniela
  module Clients
    # Base client which will be inherited by specific
    # clients when accessing Quiniela services
    class Base
      include HTTParty

      def initialize(*params); end

      def get
        self.class.get(endpoint, { query: query })
      end

      protected

      def query
        {}
      end

      def endpoint
        raise "should be implemented by subclasses"
      end
    end
  end
end
