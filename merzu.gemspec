$:.push File.expand_path('../lib', __FILE__)
require 'merzu/version'

Gem::Specification.new do |s|
  s.name        = 'merzu'
  s.version     = Merzu::VERSION
  s.date        = '2016-07-09'
  s.summary     = %q{Transliteration utility for Indic scripts}
  s.description	= %q{Transliteration utility for Indic scripts for any language supported by IAST
    supporting Devanagari and Malayalam transliteration.
  }
  s.authors     = ['Anuj More']
  s.email       = ['anujmorex@gmail.com']
  s.homepage    = 'https://github.com/execat/merzu'
  s.license       = 'GPL-3.0'
  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.0.0'

  # specify any dependencies here; for example:
  # s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry'
end
