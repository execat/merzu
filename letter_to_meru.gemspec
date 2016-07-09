# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'letter_to_meru'

Gem::Specification.new do |s|
  s.name        = 'letter_to_meru'
  s.version     = LetterToMeru::VERSION
  s.date        = '2016-07-09'
  s.summary     = %q{This is a transliteration utility for Indic scripts}
  s.description	= %q{This is a transliteration utility for Indic scripts}
  s.authors     = ['Anuj More']
  s.email       = ['anujmorex@gmail.com']
  s.files       = ['lib/letter_to_meru.rb']
  s.homepage    =
    'https://github.com/execat/letter_to_meru'
  s.license       = 'GPL-3.0'

  s.files         = `git ls-files`.split('\n')
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  # s.add_development_dependency 'rspec'
end
