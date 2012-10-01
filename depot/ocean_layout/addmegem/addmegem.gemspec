# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'addmegem/version'

Gem::Specification.new do |gem|
  gem.name          = "addmegem"
  gem.version       = Addmegem::VERSION
  gem.authors       = ["harish"]
  gem.email         = ["bkholyharish@gmail.com"]
  gem.description   = %q{to add two values}
  gem.summary       = %q{simply adding two values}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
