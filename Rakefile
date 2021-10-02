require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'db_seed_dump'
    gem.summary = '{Seed Dumper for Rails}'
    gem.description = %{Dump (parts) of your database to db/seeds.rb to get a headstart creating a meaningful seeds.rb file}
    gem.email = 'nick.flueckiger@renuo.ch'
    gem.homepage = 'https://github.com/reno/seed_dump'
    gem.authors = ['Rob Halff', 'Ryan Oblak', 'Nick Flueckiger']
    gem.license = 'MIT'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "db_seed_dump #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task default: :spec
