# frozen_string_literal: true

# If having some issues running the specs
# because of SSL verification issues
# (i.e. we're having this when developing on a VPS)
# we can use SKIP_SPECS_SSL env var to skip
# SSL verification when creating or updating VCR cassettes
#
if ENV["SKIP_SPECS_SSL"]
  module Quiniela
    module Clients
      class Base
        default_options.update(verify: false)
      end
    end
  end
end
