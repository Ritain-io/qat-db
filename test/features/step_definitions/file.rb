Given /^I have a databases YAML file with content:$/ do |text|
  ::File.write(::File.join(@tmpdir, "database.yml"), text)
end

And /^I load database connections from the databases file$/ do
  begin
    @error = nil
    QAT::DB::Loader.load_file(::File.join(@tmpdir, "database.yml"))
  rescue => @error
  end
end
