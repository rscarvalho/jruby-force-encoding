# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'force_encoding/version'

Gem::Specification.new do |spec|
  spec.name          = 'jruby-force-encoding'
  spec.version       = ForceEncoding::VERSION
  spec.authors       = ['Rodolfo Carvalho']
  spec.email         = %w(rodolfo@infweb.net)
  spec.description   = %q{A gem to force string enconding conversion on java}
  spec.summary       = %q{A gem to force string enconding conversion on java}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
