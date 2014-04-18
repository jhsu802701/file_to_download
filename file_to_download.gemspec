# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'file_to_download/version'

Gem::Specification.new do |spec|
  spec.name          = "file_to_download"
  spec.version       = FileToDownload::VERSION
  spec.authors       = ["Jason Hsu"]
  spec.email         = ["rubyist@jasonhsu.com"]
  spec.summary       = %q{Gem for managing the process of downloading files}
  spec.description   = %q{Gets the size and age of a file and whether to replace an existing file}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
