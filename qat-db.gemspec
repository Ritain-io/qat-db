#encoding: utf-8
Gem::Specification.new do |gem|
  gem.name        = 'qat-db'
  gem.version     = '9.0.0'
  gem.summary     = %q{QAT's wrapper for Oracle database interactions.}
  gem.description = <<-DESC
  QAT-DB provides generic methods for connecting to and handling databases:
    - Quick connection
    - One line queries
    - Advanced querying and scripting through Sequel
  DESC
  gem.email    = 'qatoolkit@readinessit.com'
  gem.homepage = 'https://www.ritain.io'
  
  gem.metadata    = {
    'source_code_uri'   => 'https://github.com/Ritain-io/qat-db'
  }
	
  gem.authors = ['QAT']
  gem.license = 'GPL-3.0'

  extra_files = %w[LICENSE]
  gem.files   = Dir.glob('{lib}/**/*') + extra_files
  
  gem.required_ruby_version = '~> 3.2'
	
  gem.add_dependency('qat-logger', '~> 9.0')

  gem.add_dependency('sequel', '~> 5.70')

  gem.add_dependency('bigdecimal', '~> 3.1.4')

  gem.add_development_dependency('qat-cucumber', '~> 9.0')
  gem.add_development_dependency('qat-devel', '~> 9.0')

  gem.add_development_dependency('ruby-oci8', '~> 2.2', '>= 2.2.1')
  gem.add_development_dependency('pg', '~> 1.5')

end
