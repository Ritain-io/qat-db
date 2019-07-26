require 'pg'
require 'ruby-oci8'

puts 'Start checking for databases to be up...'

@result = 1

(1..20).each do |i|
  pg_conn = PG::Connection.ping('localhost', ENV['POSTGRES_PORT'], nil, nil, ENV['POSTGRES_DB'], ENV['POSTGRES_USER'], ENV['POSTGRES_PASSWD'])

  oracle_conn = OCI8.new(ENV['ORACLE_USER'], ENV['ORACLE_PASSWD'], "//localhost:#{ENV['ORACLE_PORT']}/#{ENV['ORACLE_DB']}") rescue OCIError

  if pg_conn == 0 && oracle_conn != OCIError
    @result = 0
    break
  end

  puts "Check number #{i} of 20 failed. Retrying..."

  sleep 5
end

if @result == 0
  puts 'Databases are up !!'
else
  puts 'Databases failed to be up !!'
  `travis_terminate 1`
end