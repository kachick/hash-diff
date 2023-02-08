# frozen_string_literal: true

require 'bundler/gem_tasks'

require 'rspec/core/rake_task'

begin
  require 'rubocop/rake_task'
rescue LoadError
  puts 'can not use rubocop in this environment'
else
  RuboCop::RakeTask.new
end

task default: [:test_behaviors]

task test_behaviors: [:spec]

desc 'Simulate CI results in local machine as possible'
multitask simulate_ci: [:test_behaviors, :validate_signatures, :rubocop]

RSpec::Core::RakeTask.new(:spec) do |rt|
  rt.ruby_opts = %w[-w]
end

desc 'Prevent miss packaging!'
task :view_packaging_files do
  sh 'rm -rf ./pkg'
  sh 'rake build'
  cd 'pkg' do
    sh 'gem unpack *.gem'
    sh 'tree -I *\.gem'
  end
  sh 'rm -rf ./pkg'
end
