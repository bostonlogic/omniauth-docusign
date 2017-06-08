# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-docusign/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-docusign"
  spec.version       = Omniauth::Docusign::VERSION
  spec.authors       = ["Mwaki Harri Magotswi"]
  spec.email         = ["mmagotswi@bostonlogic.com"]

  spec.summary       = %q{OmniAuth OAuth2 strategy for DocuSign.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/bostonlogic/omniauth-docusign"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth-oauth2', '~> 1.3.1'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency "minitest", "~> 5.0"
end
