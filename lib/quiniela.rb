# typed: strict
# frozen_string_literal: true

require_relative "quiniela/version"

require "httparty"
require "nokogiri"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

# In case we need to add auto reloading we can check
# https://thurlow.io/ruby/2019/11/17/add-code-auto-loading-to-a-ruby-project-with-zeitwerk.html

module Quiniela
  class Error < StandardError; end
end
