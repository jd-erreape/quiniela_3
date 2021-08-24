# frozen_string_literal: true

require_relative "quiniela/version"

require "httparty"

module Quiniela
  class Error < StandardError; end

  module Clients
    autoload :CurrentRound, "quiniela/clients/current_round"
  end
end
