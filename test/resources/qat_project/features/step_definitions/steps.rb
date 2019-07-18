Given(/^some pre\-settings$/) do
  assert true
end

Given(/^some conditions$/) do
  assert true
end

When(/^some actions are made$/) do
  assert true
end

Then(/^a result is achieved$/) do
  assert true
end

Then(/^an expected result is not achieved$/) do
  assert false
end

When(/^action (.*) is made$/) do |action|
  assert true
end

Then(/^result (.*) is achieved$/) do |result|
  assert true
end

Then(/^a list of database connections exist$/) do
  @connections = QAT::DB::Loader.connections
  refute_empty @connections
end

And(/^the list of database connections include:$/) do |table|
  column          = table.columns.first
  exp_connections = column.to_a.map { |e| e.value }
  exp_connections.shift
  assert exp_connections.all? { |exp_conn| QAT::DB::Loader.connections.keys.include?(exp_conn.to_sym) },
         "Connections missing... Availables are [#{QAT::DB::Loader.connections.keys.join(', ')}]."
end