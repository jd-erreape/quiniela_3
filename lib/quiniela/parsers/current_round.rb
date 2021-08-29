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

      # Returns a multidimensional array of length 15 where each of the elements is an array
      # containing the home and away team belonging to the match
      def matches
        @matches ||= first_matches + [match15]
      end

      private

      def current_round_page
        @current_round_page ||= Nokogiri::HTML5(client_response)
      end

      def client_response
        Clients::CurrentRound.new.get.body
      end

      def first_matches
        current_round_page
          .css(".nombre-equipos")
          .take(14)
          .map do |match|
            match.css(".nombre").map(&:text)
          end
      end

      def match15
        current_round_page
          .css(".nombre-equipos")
          .last
          .css(".equipo")
          .map(&:text)
      end
    end
  end
end
