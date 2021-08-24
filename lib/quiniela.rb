# frozen_string_literal: true

require_relative "quiniela/version"

require "httparty"
require "nokogiri"

module Quiniela
  class Error < StandardError; end

  module Clients
    autoload :CurrentRound, "quiniela/clients/current_round"
  end

  module Parsers
    autoload :CurrentRound, "quiniela/parsers/current_round"
  end
end
