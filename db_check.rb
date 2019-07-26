require 'pg'
require 'ruby-oci8'


(0..60).each do
  pg_conn = PG::Connection.ping('localhost', POSTGRES_PORT, nil, nil, POSTGRES_DB, POSTGRES_USER, POSTGRES_PASSWD)

  oracle_conn = OCI8.new(ORACLE_USER, ORACLE_PASSWD, "//localhost:#{ORACLE_PORT}/#{ORACLE_DB}") rescue OCIError

  break if pg_conn == 0 && oracle_conn != OCIError

  sleep 1
end