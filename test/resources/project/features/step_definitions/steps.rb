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

Then(/^the list of database connections is empty$/) do
  assert_empty QAT::DB::Loader.connections
end
