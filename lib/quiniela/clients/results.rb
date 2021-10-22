# frozen_string_literal: true

module Quiniela
  module Clients
    # Access third party service to retrieve the page where
    # info regarding the results of the quiniel can be found
    class Results < Base
      base_uri "https://www.loteriasyapuestas.es"

      ENDPOINT = "/servicios/buscadorSorteos"
      OFFSET = 3600 * 24 * 31 * 4 # Four montsh from now

      def initialize(start_date: Time.now - OFFSET, end_date: Time.now)
        @start_date = start_date
        @end_date = end_date

        super
      end

      protected

      def query
        {
          game_id: "LAQU",
          celebrados: true,
          fechaInicioInclusiva: parsed_date(start_date),
          fechaFinInclusiva: parsed_date(end_date)
        }
      end

      private

      attr_reader :start_date, :end_date

      def parsed_date(date)
        date.strftime("%Y%m%d")
      end
    end
  end
end
