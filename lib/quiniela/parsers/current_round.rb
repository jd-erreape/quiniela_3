# frozen_string_literal: true

module Quiniela
  module Parsers
    # Retrieves info regarding the current round fetching the third party
    # current round info and parsing its content using Nokogiri
    class CurrentRound
      # Returns an integer with the current round number
      def number
        @number ||= current_round_page
                    .css(".numero-jornadas")
                    .text
                    .delete("^0-9")
                    .to_i
      end

      private

      def current_round_page
        @current_round_page ||= Nokogiri::HTML5(client_response)
      end

      def client_response
        Clients::CurrentRound.new.page.body
      end
    end
  end
end
