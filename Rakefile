#!/usr/bin/env rake
#encoding: utf-8

require 'qat/devel/tasks'
require 'erb'

namespace :qat do
  namespace :db do
    def clear_reports_folder!
      mkdir_p 'public'
      rm_rf ::File.join('public', '*')
    end

    desc 'Run all test scenarios containing given tags'
    task :tags, :tags do |_, params|
      tags = params[:tags].is_a?(String) ? [params[:tags]] : params[:tags].to_a
      raise ArgumentError.new "A tag is needed to execute the task!" unless tags.any?
      ENV['CUCUMBER_OPTS'] = "#{ENV['CUCUMBER_OPTS']} --tags #{tags.join(',')}"

      cd 'test' do
        Cucumber::Rake::Task.new('run', 'Run all test scenarios containing given tags') do |task|
          clear_public_folder!
        end.runner.run
      end
    end

    namespace :gemfile do
      desc 'Generate example gemfile for gem usage'
      task :example do
        @gem_name = 'qat-db'

        spec = Gem::Specification::load("#{@gem_name}.gemspec")

        @gem_version              = spec.version
        @development_dependencies = spec.development_dependencies

        File.write 'Gemfile.example', ERB.new(<<ERB).result
source 'http://vps316412.ovh.net:8082/nexus/repository/rit-ruby/'

gem '<%= @gem_name %>', '<%= @gem_version %>'
<% @development_dependencies.each do |dependency| %>gem '<%= dependency.name %>', '<%= dependency.requirements_list.reverse.join "', '"%>'
<% end %>
ERB
      end

      desc 'Generate default gemfile'
      task :default do
        File.write 'Gemfile.default', <<GEMFILE
source 'http://vps316412.ovh.net:8082/nexus/repository/rit-ruby/'

gemspec
GEMFILE
      end
    end
  end
end

namespace :tests do
  desc 'Clean previous execution data'
  task :clean do
    Dir.chdir(File.join File.dirname(__FILE__), 'test', 'public') do
      (Dir.entries(Dir.pwd) - ['.', '..', '.keep', '.gitkeep']).each do |file|
        File.delete file
        puts "Deleted #{file}"
      end
    end
  end
end