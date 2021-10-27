# typed: false
# frozen_string_literal: true

require "vcr"
require "webmock"
require "quiniela"
require_relative "./support/skip_ssl"

def bypass_vcr?
  ENV["BYPASS_VCR"] == "true"
end

RSpec.configure do |config|
  config.before(:suite) do
    if !bypass_vcr?
      puts "Using VCR"

      VCR.configure do |c|
        c.cassette_library_dir = "spec/cassettes"
        c.hook_into :webmock
        c.configure_rspec_metadata!
      end
    else
      puts "Hitting external services"
      # disable vcr for the suite
      VCR.turn_off!(ignore_cassettes: true)

      VCR.configure do |c|
        c.allow_http_connections_when_no_cassette = true
        c.default_cassette_options = { record: :new_episodes }
      end
      WebMock.allow_net_connect!
    end
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
