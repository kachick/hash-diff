#!/usr/bin/env rake
# frozen_string_literal: true
require 'bundler/gem_tasks'

require 'rspec/core/rake_task'

task default: [:spec]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.ruby_opts = %w[-w]
end

begin
  require 'rubocop/rake_task'
rescue LoadError
  puts 'can not use rubocop in this environment'
else
  RuboCop::RakeTask.new
end
