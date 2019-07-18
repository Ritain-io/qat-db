Given(/^I have connection info for database "([^"]*)":$/) do |db_name, conn_info|
  @conn_info = eval(conn_info)
  @db_name   = db_name
end

When(/^I load the connection information$/) do
  begin
    @exception = nil
    QAT::DB::Loader.load_db(@db_name, @conn_info)
  rescue => @exception
    log.warn { "Occured exception: (#{@exception.class}) #{@exception.message}" }
  end
end

Then(/^a Sequel database connection for "([^"]*)" exists in the connections list$/) do |db_name|
  db = QAT::DB::Loader.connections[db_name.to_sym]
  assert db, "Database connection for '#{db_name}' was not found..."
  assert db.is_a?(Sequel::Database)
end

Then(/^the Sequel database connections exists in the connections list:$/) do |table|
  column          = table.columns.first
  exp_connections = column.to_a.map { |e| e.value }
  exp_connections.shift
  assert exp_connections.all? { |exp_conn| QAT::DB::Loader.connections.keys.include?(exp_conn.to_sym) },
         "Connections missing... Availables are [#{QAT::DB::Loader.connections.keys.join(', ')}]."
end