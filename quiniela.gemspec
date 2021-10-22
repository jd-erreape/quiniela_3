# frozen_string_literal: true

require_relative "lib/quiniela/version"

Gem::Specification.new do |spec|
  spec.name          = "quiniela"
  spec.version       = Quiniela::VERSION
  spec.authors       = ["jd-erreape"]
  spec.email         = ["juandediosherrero@gmail.com"]

  spec.summary       = "Ruby gem that provides info regarding matches and results of Spanish Quiniela game."
  spec.homepage      = "https://github.com/jd-erreape/quiniela"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jd-erreape/quiniela"
  spec.metadata["changelog_uri"] = "https://github.com/jd-erreape/quiniela/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", ">= 0.18.1"
  spec.add_dependency "nokogiri", ">= 1.12.3"
  spec.add_dependency "zeitwerk", ">= 2.5.1"
  spec.add_development_dependency "pry", ">= 0.14.0"
  spec.add_development_dependency "vcr", ">= 6.0.0"
  spec.add_development_dependency "webmock", ">= 3.14.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
