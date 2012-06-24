# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guardrc/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Keyvan Fatehi"]
  gem.email         = ["keyvanfatehi@gmail.com"]
  gem.description   = "Guardrc allows one to have custom Guardfile commands in a different file than the Guardfile. Useful for different developers with different Guardfile preferences to be able to customize without removing/ignoring the Guardfile from git entirely."
  gem.summary       = "Eval Guardfile commands in an external file from the Guardfile"
  gem.homepage      = "https://github.com/keyvanfatehi/guardrc"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guardrc"
  gem.require_paths = ["lib"]
  gem.version       = Guardrc::VERSION
end
