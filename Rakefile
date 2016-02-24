require 'rubygems'
require 'bundler/setup'
Bundler.setup :development
require 'rake/testtask'

task default: :test
task spec: :test
desc "run tests"
Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*.rb'] - ['test/test_helper.rb']
end
