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

  gem.required_ruby_version = '>= 3.0'

  gem.add_development_dependency 'rspec', '>= 3.10.0', '< 4.0'
  gem.add_development_dependency 'yard', '>= 0.9.26', '< 2'
  gem.add_development_dependency 'rake', '>= 13.0.3', '< 20.0'
  gem.add_development_dependency 'warning', '>= 1.2.0', '< 2.0'
  gem.add_development_dependency 'rubocop', '>= 1.14.0', '< 1.15.0'
  gem.add_development_dependency 'rubocop-rake'
  gem.add_development_dependency 'rubocop-performance'
  gem.add_development_dependency 'rubocop-rubycw'
  gem.add_development_dependency 'rubocop-rspec'

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
