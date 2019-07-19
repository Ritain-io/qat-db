# -*- encoding : utf-8 -*-
Given(/^I have a connection "([^"]*)" with info:$/) do |db_name, info|
  conn_info = eval(info)
  if db_name == 'oracle' && !ENV['JENKINS_URL']
    if conn_info[:host] == 'localhost'
      conn_info[:host] = %x(ip route show 0.0.0.0/0).strip.match(/via (\S+)/).captures.first
    end
    conn_info[:database] = 'orcl.168.0.181' if conn_info[:database] == 'orcl'
  end
  log.debug { conn_info }
  QAT::DB::Loader.load_db(db_name, conn_info)
  @database = QAT::DB::Loader.connections[db_name.to_sym]
  assert @database, "Database connection for '#{db_name}' was not found..."
  assert @database.is_a?(Sequel::Database)
end

Given(/^I create a test table using query:$/) do |text|
  begin
    @database.query('drop table test;')
  rescue Sequel::DatabaseError => exception
    raise unless exception.message.match(/table "test" does not exist/)
  end
  query   = text.gsub(/^\s*/, '')
  @output = @database.query(query)
end

Given(/^I execute query:$/) do |text|
  query   = text.gsub(/^\s*/, '')
  @output = @database.query(query)
end

Then(/^the query returns values:$/) do |table|
  expected = table.hashes.first
  results  = @output.first
  expected.each do |k, v|
    assert_equal(eval(v), results[k.to_s.to_sym], "Values don't match!")
  end
end