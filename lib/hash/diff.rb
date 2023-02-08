# coding: us-ascii
# frozen_string_literal: true
# Copyright (c) 2017 Kenichi Kamiya

class Hash
  # @param older [Hash]
  # @param newer [Hash]
  # @return [Hash::Diff]
  def self.Diff(older, newer)
    Diff.generate(older:, newer:)
  end

  Diff = Data.define(:old, :new, :dirty) do
    def self.generate(older:, newer:)
      old_hash = older.to_hash
      new_hash = newer.to_hash
      old_pairs = old_hash.to_a
      new_pairs = new_hash.to_a
      dirty = ((old_pairs - new_pairs) | (new_pairs - old_pairs)).to_h
      new(old: old_hash, new: new_hash, dirty:)
    end

    # @return [Hash]
    def deleted
      dirty.except(*new.keys)
    end

    # @return [Hash]
    def appended
      dirty.except(*old.keys)
    end

    # @return [Hash]
    def value_updated
      dirty.except(*deleted.keys).except(*appended.keys)
    end

    # @return [Hash]
    def kept
      new.except(*dirty.keys)
    end
  end

  Diff::VERSION = '0.3.0'
end
