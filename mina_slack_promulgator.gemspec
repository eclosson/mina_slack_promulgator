# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/slack/promulgator/version'

Gem::Specification.new do |spec|
  spec.name          = "mina_slack_promulgator"
  spec.version       = Mina::Slack::Promulgator::VERSION
  spec.authors       = ["Evan Closson", "Matthew Powers"]
  spec.email         = ["eclosson@medivo.com", "mpowers@medivo.com"]
  spec.summary       = %q{Mina Deploy Notifications in Slack}
  spec.description   = %q{Mina Deploy Notifications in Slack.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
