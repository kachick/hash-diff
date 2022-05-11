# coding: us-ascii
# frozen_string_literal: true

lib_name = 'hash-diff'

require_relative './lib/hash/diff/version'

Gem::Specification.new do |gem|
  # specific

  gem.description   = %q{Get difference in 2 Hash}

  gem.summary       = gem.description.dup
  gem.homepage      = "https://github.com/kachick/#{lib_name}"
  gem.license       = 'MIT'
  gem.name          = lib_name.dup
  gem.version       = Hash::Diff::VERSION

  gem.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  gem.required_ruby_version = '>= 3.0'

  # common

  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  git_ls_filepaths = `git ls-files`.lines.map(&:chomp)
  minimum_filepaths = git_ls_filepaths.grep(%r!\A(?:lib|sig)/!)
  raise "obvious mistaken in packaging files: #{minimum_filepaths.inspect}" if minimum_filepaths.size < 1
  extra_filepaths = %w[README.md MIT-LICENSE]
  raise 'git ignores extra filename' unless (extra_filepaths - git_ls_filepaths).empty?
  gem.files         = minimum_filepaths | extra_filepaths
  gem.require_paths = ['lib']
end
