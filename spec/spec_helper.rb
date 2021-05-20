# coding: us-ascii
# frozen_string_literal: true

require 'rspec'

RSpec.configure do |c|
  c.disable_monkey_patching!
  c.warnings = true
  c.raise_on_warning = true
end

require 'warning'

if Warning.respond_to?(:[]=) # @TODO Removable this guard after dropped ruby 2.6
  Warning[:deprecated] = true
  Warning[:experimental] = true
end

Gem.path.each do |path|
  Warning.ignore(//, path)
end

Warning.process do |_warning|
  :raise
end

require_relative '../lib/hash/diff'
