# coding: us-ascii
# frozen_string_literal: true
# Copyright (c) 2017 Kenichi Kamiya

class Hash
  class << self
    # @param old [Hash]
    # @param new [Hash]
    # @return [Hash::Diff]
    def Diff(old, new)
      Diff.new(old:, new:)
    end
  end

  class Diff
    attr_reader :old, :new

    # @note Don't care given hash might be changed in future, to keep lite cost
    def initialize(old:, new:)
      @old, @new = old.to_hash, new.to_hash
    end

    # @return [Hash]
    def deleted
      @deleted ||= updated.except(*@new.keys)
    end

    # @return [Hash]
    def appended
      @appended ||= updated.except(*@old.keys)
    end

    # @return [Hash]
    def updated
      @updated ||= (
        old_pairs = @old.to_a
        new_pairs = @new.to_a
        ((old_pairs - new_pairs) | (new_pairs - old_pairs)).to_h
      )
    end
    alias_method :changed, :updated

    # @return [Hash]
    def value_updated
      @value_updated ||= updated.except(*deleted.keys).except(*appended.keys)
    end

    # @return [Hash]
    def kept
      @kept ||= @new.except(*updated.keys)
    end

    # @return [String]
    def inspect
      "#{self.class}<changed: #{changed.inspect}>"
    end
  end
end

require_relative 'diff/version'
