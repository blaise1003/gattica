require 'rake'
require 'rake/testtask'
require 'rake/task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "gattica"
    gemspec.summary = "Gattica is a easy to use Ruby Gem for getting data from the Google Analytics API."
    gemspec.email = "chrisl@seerinteractive.com"
    gemspec.homepage = "http://github.com/chrisle/gattica"
    gemspec.description = "Gattica is a easy to use Ruby Gem for getting data from the Google Analytics API.  It supports metrics, dimensions, sort, filters, goals, and segments.  It can handle accounts with 1000+ profiles, and can return data in CSV, Hash, or JSON"
    gemspec.authors = ["Christopher Le, et all"]
    gemspec.add_dependency 'hpricot'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = false
end
