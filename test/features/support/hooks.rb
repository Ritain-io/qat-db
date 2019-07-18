Around do |_, block|
  Dir.mktmpdir do |dir|
    @tmpdir = dir
    block.call
  end
end

After do
  QAT::DB::Loader.reset!
end

After('@postgres_test_table') do
  QAT::DB.postgres['drop table test;']
end