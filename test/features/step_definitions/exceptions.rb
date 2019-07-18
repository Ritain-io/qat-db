Then /^a "([^"]*)" exception is raised$/ do |klass|
  refute_nil @exception
  assert_equal klass, @exception.class.to_s
  @exception = nil
end

Then /^no exception is raised$/ do
  refute @exception
end