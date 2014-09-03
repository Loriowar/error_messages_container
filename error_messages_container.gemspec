# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'error_messages_container/version'

Gem::Specification.new do |spec|
  spec.name          = "error_messages_container"
  spec.version       = ErrorMessagesContainer::VERSION
  spec.authors       = ["Ivan Zabrovskiy"]
  spec.email         = ["loriowar@gmail.com"]
  spec.summary       = %q{Simple error messages container}
  spec.description   = %q{Simple container for storage and grouping error messages}
  spec.homepage      = "https://github.com/Loriowar/error_messages_container"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
