#encoding: utf-8
Gem::Specification.new do |gem|
  gem.name        = 'qat-db'
  gem.version     = '6.0.0'
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
  gem.license = 'GPL-3'

  extra_files = %w[LICENSE]
  gem.files   = Dir.glob('{lib}/**/*') + extra_files

  gem.add_dependency('qat-logger', '~> 6.0', '>= 6.0')

  gem.add_dependency('sequel', '~> 4.28')

  gem.add_development_dependency('qat')
  gem.add_development_dependency('qat-devel')

  gem.add_development_dependency('ruby-oci8', '~> 2.2', '>= 2.2.1')
  gem.add_development_dependency('pg', '~> 0.18', '>= 0.18.4')
end
