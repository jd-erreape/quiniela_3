# frozen_string_literal: true

module Quiniela
  module Parsers
    # Retrieves info regarding the current results for the Quiniela
    class Results
      class NotFound < StandardError; end

      # It returns the results for the given round number (integer)
      # The format of the results will be:
      #
      # [HomeTeam, AwayTeam, HomeResult, AwayResult]
      #
      # If the match has not been played yet, it will return nil as
      # home and away result
      def round(number)
        given_round = rounds.find { |round| round[:jornada].to_i == number }

        raise NotFound unless given_round

        given_round[:partidos].map(&method(:build_match))
      end

      # It returns the results for the last round played or being played
      def last_round
        rounds.first[:partidos].map(&method(:build_match))
      end

      private

      def rounds
        @rounds ||= JSON.parse(Clients::Results.new.get.body, symbolize_names: true)
      end

      def build_match(match)
        result = match[:marcador]
        home_result, away_result = result ? result.split("-").map(&:to_i) : [nil, nil]

        [
          match[:local],
          match[:visitante],
          home_result,
          away_result
        ]
      end
    end
  end
end
