#encoding: utf-8
Gem::Specification.new do |gem|
  gem.name        = 'qat-db'
  gem.version     = '7.0.0'
  gem.summary     = %q{QAT's wrapper for Oracle database interactions.}
  gem.description = <<-DESC
  QAT-DB provides generic methods for connecting to and handling databases:
    - Quick connection
    - One line queries
    - Advanced querying and scripting through Sequel
  DESC
  gem.email    = 'qatoolkit@readinessit.com'
  gem.homepage = 'https://github.com/readiness-it/qat-db'

  gem.authors = ['QAT']
  gem.license = 'GPL-3.0'

  extra_files = %w[LICENSE]
  gem.files   = Dir.glob('{lib}/**/*') + extra_files

  gem.add_dependency('qat-logger', '~> 8.0')

  gem.add_dependency('sequel', '~> 4.28')

  ####ruby 2.7 needs this version
  gem.add_dependency('bigdecimal', '~> 1.3.5')

  gem.add_development_dependency('qat-cucumber', '~> 7.0.4')
  gem.add_development_dependency('qat-devel', '~> 8.0')

  gem.add_development_dependency('ruby-oci8', '~> 2.2', '>= 2.2.1')
  gem.add_development_dependency('pg', '~> 0.18', '>= 0.18.4')

end
