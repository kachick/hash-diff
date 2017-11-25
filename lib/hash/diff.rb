# coding: us-ascii
# Copyright (c) 2017 Kenichi Kamiya

class Hash
  class << self
    # @param old [Hash]
    # @param old [Hash]
    # @return [Hash::Diff]
    def Diff(old, new)
      Diff.new(old: old, new: new)
    end
  end

  class Diff
    VERSION = '0.1.0'.freeze

    attr_reader :old, :new

    # @note Don't care given hash might be changed in future, to keep lite cost
    def initialize(old:, new:)
      @old, @new = old.to_hash, new.to_hash
    end

    # @return [Hash]
    def deleted
      @deleted ||= extract_keys(updated, @new)
    end

    # @return [Hash]
    def appended
      @appended ||= extract_keys(updated, @old)
    end

    # @return [Hash]
    def updated
      @updated ||= (
        old_pairs = @old.to_a
        new_pairs = @new.to_a
        ((old_pairs - new_pairs) | (new_pairs - old_pairs)).to_h
      )
    end

    # @return [Hash]
    def value_updated
      @value_updated ||= (
        extract_keys(
          extract_keys(updated, deleted),
          appended
        )
      )
    end

    # @return [Hash]
    def kept
      @kept ||= extract_keys(@new, updated)
    end

    # @return [String]
    def inspect
      "old: #{@old.inspect} / new: #{@new.inspect}"
    end

    private

    # @return [Hash]
    def extract_keys(base, extracting)
      ret = base.dup
      extracting.each_key do |key|
        ret.delete key
      end
      ret
    end
  end
end
